CREATE TABLE _User
(
	FNameAndLName	NVARCHAR(50) NOT NULL,
	BirthDate	DATE NOT NULL,
	gender   NVARCHAR(50) NOT NULL,
	homeAddress	  NVARCHAR(100) NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	Score    FLOAT   NOT NULL,
	Email	NVARCHAR(50) NOT NULL,
	NumOfBooksReaded    INT NOT NULL,
	NumOfPagesReaded    BIGINT NOT NULL,
	PRIMARY KEY (UserName),
);

CREATE TABLE _Admin
(
    FNameAndLName    NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
	PRIMARY KEY (Email),
);

CREATE TABLE SalingCart
(
    UserNameOfEachShopper    NVARCHAR(50) NOT NULL,
    TotalPricesOfBooks BIGINT NOT NULL,
    AmountPaidByEachShopper    BIGINT NOT NULL,
	AdminEmail	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserNameOfEachShopper),
	FOREIGN KEY (AdminEmail) REFERENCES _Admin(Email)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Book
(
	BName	NVARCHAR(50) NOT NULL,
	CoverImage VARBINARY(MAX) NOT NULL,
	Price	BIGINT NOT NULL,
	NumOfScorers	BIGINT NOT NULL,
	AuthorName	NVARCHAR(50) NOT NULL,
	AvgBookRating	FLOAT NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	AdminEmail	NVARCHAR(50) NOT NULL,
	SalingCart	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (BName),
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (AdminEmail) REFERENCES _Admin(Email)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (SalingCart) REFERENCES SalingCart(UserNameOfEachShopper)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
);

CREATE TABLE SubjectClassification
(
	_Classification NVARCHAR(50) NOT NULL,
	BName	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (BName,_Classification),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE PdfFile
(
	BName	NVARCHAR(50) NOT NULL,
	NameOfPublication NVARCHAR(50) NOT NULL,
	PrintingNumber BIGINT NOT NULL,
	_PageCount INT NOT NULL,
	PRIMARY KEY (BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE AudioFile
(
	BName	NVARCHAR(50) NOT NULL,
	PeriodOfTime  TIME NOT NULL,
	ReaderName  NVARCHAR(50) NOT NULL,
	PRIMARY KEY (BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);



CREATE TABLE Scoring
(
	AmountOfScore	FLOAT   NOT NULL,
	BName	NVARCHAR(50) NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserName,BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Search
(
	BName	NVARCHAR(50) NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserName,BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Shopping
(
	BName	NVARCHAR(50) NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserName,BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,

);

CREATE TABLE RecordReading
(
	YesORNo   NVARCHAR(10),
	BName	NVARCHAR(50) NOT NULL,
	UserName	NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserName,BName),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Comment
(
    NumOfCommentLikes    BIGINT NOT NULL,
    NumOfCommentDislikes BIGINT NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    BName NVARCHAR(50) NOT NULL,
    Comment NVARCHAR(50) NOT NULL,
	PRIMARY KEY (Comment),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE CommentText
(
    _Text    NVARCHAR(50) NOT NULL,
    Comment NVARCHAR(50) NOT NULL,
	PRIMARY KEY (_Text,Comment),
	FOREIGN KEY (Comment) REFERENCES Comment(Comment)
	ON DELETE CASCADE ON UPDATE CASCADE,
);


CREATE TABLE AttractivePiece
(
    NumOfLikes    BIGINT NOT NULL,
    NumOfDislikes BIGINT NOT NULL,
    BName    NVARCHAR(50) NOT NULL,
    Piece    NVARCHAR(100) NOT NULL,
	PRIMARY KEY (Piece),
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE _Text
(
    _Text    NVARCHAR(50) NOT NULL,
    PieceOfText NVARCHAR(100) NOT NULL,
	PRIMARY KEY (_Text),
	FOREIGN KEY (PieceOfText) REFERENCES AttractivePiece(Piece)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Record
(
    Email    NVARCHAR(50) NOT NULL,
    UserName    NVARCHAR(50) NOT NULL,
    AttractivePiece NVARCHAR(100) NOT NULL, 
	PRIMARY KEY (UserName),
	FOREIGN KEY (UserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (AttractivePiece) REFERENCES AttractivePiece(Piece)
	ON DELETE CASCADE ON UPDATE CASCADE,
);



CREATE TABLE ShoppingCart
(
    UserNameOfShopper    NVARCHAR(50) NOT NULL,
    NumOfBooks BIGINT NOT NULL,
    TotalPricesOfBooks BIGINT NOT NULL,
    Email NVARCHAR(50) NOT NULL,
	PRIMARY KEY (UserNameOfShopper),
	FOREIGN KEY (UserNameOfShopper) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Exist
(
    BName    NVARCHAR(50) NOT NULL,
    ShoppingCart NVARCHAR(50) NOT NULL,
	FOREIGN KEY (BName) REFERENCES Book(BName)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (ShoppingCart) REFERENCES ShoppingCart(UserNameOfShopper)
	ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Prize
(
    WinnerUserName    NVARCHAR(50) NOT NULL,
    PostageDate Date NOT NULL,
    PrizeAmount    BIGINT NOT NULL,
    Email    NVARCHAR(50) NOT NULL,
	PRIMARY KEY (WinnerUserName),
	FOREIGN KEY (WinnerUserName) REFERENCES _User(UserName)
	ON DELETE CASCADE ON UPDATE CASCADE,
);


ALTER TABLE _User
ADD CONSTRAINT CHECK_User 
CHECK (gender = 'Female' OR  gender = 'Male');

ALTER TABLE Book
ADD CONSTRAINT CHECK_Book 
CHECK(AvgBookRating >=1  AND  AvgBookRating<=5);

ALTER TABLE Scoring
ADD CONSTRAINT CHECK_Scoring 
CHECK(AmountOfScore >=1  AND  AmountOfScore<=5);

ALTER TABLE RecordReading
ADD CONSTRAINT CHECK_RecordReading 
CHECK (YesORNo = 'Yes' OR YesORNo = 'No');

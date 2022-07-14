INSERT INTO _User (FNameAndLName, BirthDate, gender, homeAddress, UserName, Score, Email, NumOfBooksReaded, NumOfPagesReaded)
VALUES ('User1','1111-01-01','Female','Iran','UserName1',111,'email1@gmail.com',1,100),
('User2','2222-02-02','Male','Theran','UserName2',222,'email2@gmail.com',2,200),
('User3','3333-03-03','Female','Iran','UserName3',333,'email3@gmail.com',3,300),
('User4','4444-04-04','Male','Iraq','UserName4',444,'email4@gmail.com',4,400);

INSERT INTO _Admin (FNameAndLName, Email)
VALUES ('Admin1','AdminEmail1@gmail.com'),
('Admin2','AdminEmail2@gmail.com'),
('Admin3','AdminEmail3@gmail.com'),
('Admin4','AdminEmail4@gmail.com');

INSERT INTO SalingCart (UserNameOfEachShopper, TotalPricesOfBooks,AmountPaidByEachShopper, AdminEmail)
VALUES ('UserName1',100000,100,'AdminEmail1@gmail.com'),
('UserName2',100000,200,'AdminEmail1@gmail.com'),
('UserName3',100000,300,'AdminEmail1@gmail.com'),
('UserName4',100000,400,'AdminEmail1@gmail.com');

INSERT INTO Book (BName, CoverImage,Price, NumOfScorers,AuthorName,AvgBookRating,UserName,AdminEmail,SalingCart)
VALUES ('BName1',0x111,10000,11,'Author1',1.0,'UserName1','AdminEmail1@gmail.com','UserName1'),
('BName2',0x222,20000,22,'Author2',2.0,'UserName2','AdminEmail2@gmail.com','UserName2'),
('BName3',0x333,30000,33,'Author3',3.0,'UserName3','AdminEmail3@gmail.com','UserName3'),
('BName4',0x444,40000,44,'Author4',4.0,'UserName4','AdminEmail4@gmail.com','UserName4');

INSERT INTO  SubjectClassification(_Classification, BName)
VALUES ('jhanr1','BName1'),
('jhanr2','BName2'),
('jhanr3','BName3'),
('jhanr4','BName4');

INSERT INTO  PdfFile(BName, NameOfPublication, PrintingNumber, _PageCount)
VALUES ('BName1','NameOfPublication1',1,100),
('BName2','NameOfPublication2',2,200),
('BName3','NameOfPublication3',3,300),
('BName4','NameOfPublication4',4,400);

INSERT INTO  AudioFile(BName, PeriodOfTime, ReaderName)
VALUES ('BName1','1:1:1','ReaderName1'),
('BName2','2:2:2','ReaderName2'),
('BName3','3:3:3','ReaderName3'),
('BName4','4:4:4','ReaderName4');

INSERT INTO  Scoring(AmountOfScore, BName, UserName)
VALUES (1,'BName1','UserName1'),
(2,'BName2','UserName2'),
(3,'BName3','UserName3'),
(4,'BName4','UserName4');

INSERT INTO  Search(BName, UserName)
VALUES ('BName1','UserName1'),
('BName2','UserName2'),
('BName3','UserName3'),
('BName4','UserName4');

INSERT INTO  Shopping(BName, UserName)
VALUES ('BName1','UserName1'),
('BName2','UserName2'),
('BName3','UserName3'),
('BName4','UserName4');

INSERT INTO  RecordReading(YesORNo, BName, UserName)
VALUES ('Yes','BName1','UserName1'),
('No','BName2','UserName2'),
('Yes','BName3','UserName3'),
('No','BName4','UserName4');

INSERT INTO  Comment(NumOfCommentLikes, NumOfCommentDislikes, UserName, Email, BName, Comment)
VALUES (100,100,'UserName1','email1@gmail.com','BName1','Comment1'),
(200,200,'UserName2','email2@gmail.com','BName2','Comment2'),
(300,300,'UserName3','email3@gmail.com','BName3','Comment3'),
(400,400,'UserName4','email4@gmail.com','BName4','Comment4');

INSERT INTO  CommentText(_Text, Comment)
VALUES ('_Text1','Comment1'),
('_Text2','Comment2'),
('_Text3','Comment3'),
('_Text4','Comment4');

INSERT INTO  AttractivePiece(NumOfLikes, NumOfDislikes, BName, Piece)
VALUES (100,100,'BName1','PieceOfText1'),
(200,200,'BName2','PieceOfText2'),
(300,300,'BName3','PieceOfText3'),
(400,400,'BName4','PieceOfText4');

INSERT INTO  _Text(_Text, PieceOfText)
VALUES ('_Text1','PieceOfText1'),
('_Text2','PieceOfText2'),
('_Text3','PieceOfText3'),
('_Text4','PieceOfText4');

INSERT INTO  Record(Email, UserName, AttractivePiece)
VALUES ('email1@gmail.com','UserName1','PieceOfText1'),
('email4@gmail.com','UserName4','PieceOfText2'),
('email2@gmail.com','UserName2','PieceOfText3'),
('email3@gmail.com','UserName3','PieceOfText4');

INSERT INTO ShoppingCart(UserNameOfShopper, NumOfBooks, TotalPricesOfBooks, Email)
VALUES ('UserName1',22,1200000,'email1@gmail.com'),
('UserName2',2,100000,'email2@gmail.com'),
('UserName3',11,2000000,'email3@gmail.com'),
('UserName4',6,250000,'email4@gmail.com');

INSERT INTO Exist(BName, ShoppingCart)
VALUES ('BName1','UserName1'),
('BName2','UserName1'),
('BName3','UserName3'),
('BName4','UserName3');

INSERT INTO Prize(WinnerUserName, PostageDate, PrizeAmount,Email)
VALUES ('UserName1','3333-03-04',2500000,'email1@gmail.com'),
('UserName2','3335-07-12',1200000,'email2@gmail.com'),
('UserName3','3552-10-25',1000000,'email3@gmail.com');

/*DELETE FROM _USER
DELETE FROM _Admin
DELETE FROM Book
DELETE FROM SalingCart
DELETE FROM SubjectClassification
DELETE FROM PdfFile
DELETE FROM AudioFile
DELETE FROM Scoring
DELETE FROM Search
DELETE FROM Shopping
DELETE FROM RecordReading
DELETE FROM Comment
DELETE FROM CommentText
DELETE FROM AttractivePiece
DELETE FROM _Text
DELETE FROM Record
DELETE FROM ShoppingCart
DELETE FROM Exist
DELETE FROM Prize*/




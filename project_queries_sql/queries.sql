--Delete from table
DELETE 
FROM _User
WHERE UserName = 'Aliie';

DELETE FROM Exist;

DELETE 
FROM Book
WHERE AvgBookRating < 2.5;


-- Update rows
UPDATE Book
SET Price = Price+20000
WHERE Price<50000

UPDATE Prize
SET WinnerUserName = 'UserName2'
WHERE WinnerUserName = 'UserName1'

UPDATE ShoppingCart
SET TotalPricesOfBooks = TotalPricesOfBooks - 23000
WHERE NumOfBooks > 5


--Update table
ALTER TABLE _User
ADD RegisterDate Date;

ALTER TABLE Book
ADD YearOfPublication Date;

ALTER TABLE AudioFile
ADD SizeOfFile FLOAT;


-- Select from table
SELECT b.BName
FROM BOOK AS b
WHERE b.AuthorName = 'Author3'

SELECT Price
FROM BOOK
WHERE AvgBookRating>3.5

SELECT b.BName
FROM BOOK AS b , _User AS u, ShoppingCart AS sh
WHERE b.UserName = u.UserName AND sh.UserNameOfShopper = u.UserName

SELECT b.*
FROM BOOK AS b 
WHERE b.Price > (SELECT AVG(bb.Price)
					FROM Book AS bb)

SELECT p.NameOfPublication , p.BName
FROM BOOK AS b , PdfFile AS p , _User AS u
WHERE p.BName = b.BName AND  u.UserName = b.UserName

SELECT a.ReaderName , a.BName
FROM BOOK AS b , AudioFile AS a , _User AS u
WHERE a.BName = b.BName AND  u.UserName = b.UserName

SELECT b.BName
FROM BOOK AS b , RecordReading AS r , _User AS u
WHERE r.BName = b.BName AND  u.UserName = b.UserName AND r.YesORNo = 'Yes'

SELECT b.BName
FROM BOOK AS b , RecordReading AS r , _User AS u
WHERE r.BName = b.BName AND  u.UserName = b.UserName AND r.YesORNo = 'No' 
						AND b.AvgBookRating = (SELECT MAX(AvgBookRating)
												FROM Book)

SELECT SUM(AmountPaidByEachShopper)
FROM SalingCart 

SELECT a.Piece
FROM BOOK AS b , AttractivePiece AS a , _Text AS t
WHERE a.Piece = t.PieceOfText AND a.BName = b.BName

SELECT ABS(a.NumOfLikes - a.NumOfDislikes)  AS diff
FROM BOOK AS b , AttractivePiece AS a , _Text AS t
WHERE a.Piece = t.PieceOfText AND a.BName = b.BName

SELECT b.CoverImage
FROM BOOK AS b , SubjectClassification AS s
WHERE s.BName = b.BName AND s._Classification = 'jhanr3' AND b.BName = 'BName1'

SELECT c.UserName
FROM Comment AS c , CommentText AS ct
WHERE c.Comment = ct.Comment

SELECT c.Comment
FROM Comment AS c , CommentText AS ct
WHERE c.Comment = ct.Comment AND c.NumOfCommentLikes > c.NumOfCommentDislikes

SELECT p.WinnerUserName
FROM _User AS u , Prize AS p
WHERE p.WinnerUserName = u.UserName AND u.homeAddress = 'Iran'

SELECT SUM(S.AmountOfScore) AS _sum
FROM Scoring AS S , Book AS B, _User AS U
WHERE S.BName = B.BName AND S.UserName = U.UserName AND S.AmountOfScore > (SELECT AVG(AmountOfScore)
																FROM Scoring) 

SELECT R.AttractivePiece
FROM Record AS R , _User AS U
WHERE R.UserName = U.UserName AND U.UserName = 'UserName1'

SELECT S.BName
FROM Search AS S , _User AS U
WHERE S.UserName = U.UserName AND U.UserName = 'UserName3'

SELECT ad.Email
FROM _Admin AS ad , SalingCart AS s
WHERE s.AdminEmail = ad.Email

SELECT u.UserName
FROM  _User AS U
WHERE u.NumOfBooksReaded = (SELECT MAX(NumOfBooksReaded)
									FROM _User)
		AND u.NumOfPagesReaded = (SELECT MAX(NumOfPagesReaded)
									FROM _User)


/*CREATE OR ALTER VIEW winners
AS SELECT p.WinnerUserName
FROM _User AS u , Prize AS p
WHERE p.WinnerUserName = u.UserName AND u.NumOfPagesReaded>200

--SELECT * FROM winners

CREATE OR ALTER VIEW suggestion_book
AS SELECT b.BName
FROM BOOK AS b , RecordReading AS r , _User AS u
WHERE r.BName = b.BName AND  u.UserName = b.UserName AND r.YesORNo = 'No' 
--SELECT * FROM suggestion_book

GO
CREATE OR ALTER TRIGGER _subject
ON Book
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON
INSERT INTO SubjectClassification
(
_Classification,
BName
)
SELECT NULL, I.BName
FROM INSERTED I
END

GO
CREATE OR ALTER TRIGGER piece
ON AttractivePiece
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON
INSERT INTO _Text
(
_Text,
PieceOfText
)
SELECT NULL, I.Piece
FROM INSERTED I
END


CREATE OR ALTER PROCEDURE dbo.IncreaseScore
(
    @pages BIGINT
)
AS
BEGIN
    UPDATE _User
    SET Score = Score+1
    WHERE NumOfPagesReaded = @pages AND @pages = (SELECT MAX(NumOfPagesReaded)
														FROM _User)
END;

--EXEC dbo.IncreaseScore @pages = 400
--EXEC dbo.IncreaseScore @pages = 100
--SELECT * FROM _User


CREATE OR ALTER PROCEDURE dbo.BadComment
(
    @dislikes BIGINT,
	@likes BIGINT
)
AS
BEGIN
    DELETE 
	FROM AttractivePiece
    WHERE NumOfDislikes = @dislikes AND NumOfLikes = @likes AND @dislikes-@likes>500
END;

--EXEC dbo.BadComment @dislikes=600  ,@likes=  100
--EXEC dbo.BadComment @dislikes=300  ,@likes=  300
--SELECT * FROM AttractivePiece


CREATE FUNCTION UnreadButScored()
RETURNS TABLE 
AS
RETURN 
(
	SELECT s.UserName
	FROM RecordReading AS R , Scoring AS s
	WHERE r.UserName = s.UserName AND r.YesORNo = 'No'
)
GO

--SELECT * FROM dbo.UnreadButScored()

CREATE FUNCTION ValleyOfPrizes()
RETURNS bigint
AS
BEGIN
	DECLARE @Result bigint
	SELECT @Result = MAX(PrizeAmount) - MIN(PrizeAmount)
	FROM Prize
	RETURN @Result

END
GO
--SELECT dbo.ValleyOfPrizes() AS valley*/
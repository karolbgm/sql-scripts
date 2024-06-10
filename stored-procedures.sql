CREATE OR ALTER PROCEDURE SumTheNumberUpTo
 @TargetNum int = 0
AS
BEGIN
 DECLARE @Counter int = 0;
 DECLARE @Sum int = 0;
 
 WHILE @Counter <= @TargetNum 
 BEGIN
   SET @Sum += @Counter;
   SET @Counter = @Counter + 1
 END
 PRINT @Sum;
 --RETURN @Sum;
END
Go
--DECLARE @Total int = 0;
--Set @Total = EXEC SumTheNumberUpTo @TargetNum = 73;

Exec SumTheNumberUpTo @TargetNum = 73;
Go


CREATE OR ALTER PROCEDURE ListStudents
AS
BEGIN
  SELECT *
  FROM Students
  ORDER BY Lastname desc;
END
Go
EXEC ListStudents;
Go
-- PROCEDURE TO JOIN ASSESSMENTS AND STUDENTS AND FILTER BY ID
CREATE OR ALTER PROCEDURE AssignmentScoreByStudent 
    @StudentNumber INT = 1
AS 
BEGIN
    --SELECT Firstname, Lastname, Name Assessment, Score
	SELECT CONCAT(Students.Firstname, ' ', Students.Lastname) Name, Name Assessment, Score
    FROM Students
    JOIN Assignments ON Assignments.StudentId = Students.Id
    WHERE Students.Id = @StudentNumber;
END;

Go
Exec AssignmentScoreByStudent @StudentNumber = 1;
Go

--PROCEDURE TO INSERT NEW ASSESSMENT
CREATE OR ALTER PROCEDURE AddAssessment
    -- Assign variables
    @StudentId INT = NULL,
	-- The number of characters is higher, otherwise we won't get the > 50 error, because only 50 would be recognized
	@AssessmentName VARCHAR(150) = NULL,
	@AssessmentScore INT = 0
AS
BEGIN
    -- Check for valid student Id
    if not exists (
	 SELECT * FROM Students
		WHERE Id = @StudentId
	)
	BEGIN
	    PRINT 'Student is not found!';
		return;
	END

	-- Check the Name length
	if  @AssessmentName is NULL
	BEGIN
	    PRINT 'Name is required';
		return;
	END

	-- Check the name max length 50
	if len(@AssessmentName) > 50
	BEGIN
	    PRINT 'Name has a limit of 50 characters';
		return;
	END

	if @AssessmentScore < 0 or @AssessmentScore > 100
	BEGIN
	    PRINT 'Score invalid. It must be between 0 and 100';
		return;
	END
    INSERT INTO Assignments (Name, Score, StudentId)
	VALUES (@AssessmentName, @AssessmentScore, @StudentId)
END;
Go

-- SCORE TEST
Exec AddAssessment @StudentId = 1, @AssessmentName = 'SQL', @AssessmentScore = 200;
Go

-- NAME TEST
Exec AddAssessment @StudentId = 1, @AssessmentScore = 100;
Go

-- ID TEST
Exec AddAssessment @StudentId = 10, @AssessmentName = 'SQL', @AssessmentScore = 100;
Go

-- TEST SCORE, NAME AND ID
Exec AddAssessment @AssessmentScore = 150, @StudentId = 10;
Go

-- PROCEDURE TO EDIT/UPDATE

CREATE OR ALTER PROCEDURE ChangeAssessment
    @Id int = NULL,
	@NewName varchar(51)= NULL,
	@NewScore int = NULL
AS
BEGIN
    if not exists (
	 SELECT * FROM Assignments
		WHERE Id = @Id
	)
	BEGIN
	    PRINT 'Assessment not found!';
		return;
	END

	-- Check the Name length
	if  @NewName is NULL
	BEGIN
	    PRINT 'Name is required';
		return;
	END

	-- Check the name max length 50
	if len(@NewName) > 50
	BEGIN
	    PRINT 'Name has a limit of 50 characters';
		return;
	END

	if @NewScore < 0 or @NewScore > 100
	BEGIN
	    PRINT 'Score invalid. It must be between 0 and 100';
		return;
	END

-- Good practice: create a transaction for update
    BEGIN TRANSACTION
    UPDATE Assignments
	SET Name = @NewName, Score = @NewScore
	WHERE Id = @Id;

	if @@ROWCOUNT != 1
	ROLLBACK TRANSACTION -- IT WILL UNDO THE UPDATE IF UPDATED MORE THAN 1
	BEGIN
	    PRINT 'Update failed!';
		return;
	END

	COMMIT TRANSACTION;
	PRINT 'Update successful';

END;
go
Exec ChangeAssessment @Id = 1, @NewName = 'JS', @NewScore = '100';
go
-- PROCEDURE TO DELETE
CREATE OR ALTER PROCEDURE DeleteAssessment
    @Id int = NULL
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM Assignments WHERE Id = @Id;

if @@ROWCOUNT != 1
ROLLBACK TRANSACTION
BEGIN
    PRINT 'Delete failed';
	return;
END
    PRINT 'Delete successful';
END;
go
Exec DeleteAssessment @Id = 8
go



SELECT * 
FROM Assignments
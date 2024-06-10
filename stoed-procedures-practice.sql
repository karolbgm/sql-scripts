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
    @StudentId INT = NULL,
	@AssessmentName VARCHAR(50) = ' ',
	@AssessmentScore INT = 0
AS
BEGIN
    INSERT INTO Assignments (Name, Score, StudentId)
	VALUES (@AssessmentName, @AssessmentScore, @StudentId)
END;
Go

Exec AddAssessment @StudentId = 1, @AssessmentName = 'SQL', @AssessmentScore = 100;
Go
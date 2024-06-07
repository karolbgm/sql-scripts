--CREATE DATABASE
CREATE DATABASE TQLBOOTCAMP;

use TQLBOOTCAMP --this will make sure everything we insert will be inside this database
go
--CREATE TABLE
CREATE TABLE Students (
Id int not null primary key identity (1,1),
Firstname varchar(30) not null,
LAstname varchar(30) not null,
Cellphone varchar(15),
DateOfBirth DateTime not null,
Active bit not null default 1
);
go

INSERT INTO Students (Firstname, LAstname, DateOfBirth) 
VALUES ('Karol', 'Morgan', '1994-04-11'),
('Bea', 'G', '1994-10-07'),
('David', 'H', '1994-11-11'),
('Matt', 'L', '1994-06-19');
go

SELECT * FROM Students;

UPDATE Students SET Cellphone = '000-000-000' 
WHERE Cellphone is null;


CREATE TABLE Assignments (
Id int not null primary key identity (1,1),
Name varchar(50) not null,
Score int not null,
StudentId int not null foreign key references Students(Id)
);
go

INSERT INTO Assignments (Name, Score, StudentId)
VALUES ('Git/Github', 110, 1),
('Git/Github', 110, 2),
('Git/Github', 100, 3),
('Git/Github', 90, 4);
go

SELECT * 
FROM Assignments;

SELECT * 
FROM Students
join Assignments on (Assignments.StudentId = Students.Id);

SELECT a.*, concat(s.firstname, ' ', s.lastname) Name
from Assignments a
join Students s
on s.Id = a.StudentId
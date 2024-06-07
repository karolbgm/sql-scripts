--MAINTAINING DATA

--DELETE

--Start with a Select just to make sure you're selecting the right rows
SELECT * 
FROM Customers
WHERE Sales < 10000;

DELETE 
FROM Customers
WHERE Sales < 10000 and Name = 'Huntington';

DELETE
FROM Customers
WHERE Sales < 6000;

SELECT *
-- DELETE
FROM Customers
WHERE id in (
SELECT Id from Customers WHERE City = 'Cincinnati' and Sales > 30000
);

DELETE 
FROM Customers
WHERE Id = 1;




--UPDATE

--set - every set will put a series of equal
UPDATE Customers Set
 Sales += 10,
 City = 'Karoland'
 Where Id = 15;
 --After Set we always use an expression, number or anything equivalent to the same data type

SELECT *
FROM Customers
WHERE Id = 15;

UPDATE Customers Set
 Sales += 10000,
 City = 'Columbus'
 Where Id = 22;

 SELECT *
FROM Customers
WHERE Id = 22;



--INSERT

INSERT INTO Customers (Name, City, State, Sales, Active) VALUES ('TQL', 'CINCINNATI', 'OH', 100000, 0);

SELECT * 
FROM Customers
WHERE Name like 'T%';

--INSERTING MULTIPLE LINES
INSERT INTO Customers (Name, City, State, Sales, Active) 
VALUES ('TQL Tampa22', 'TAMPA', 'FL', 100000, 0),
('TQL Tampa33', 'TAMPA', 'FL', 100000, 0),
('TQL Tampa44', 'TAMPA', 'FL', 100000, 0);

SELECT *
FROM Customers
WHERE Name like 'TQL T%';

--INSERTING INTO ORDERS TABLE
INSERT INTO Orders (CustomerId, Date)
VALUES (38, '2024-06-07');

SELECT * 
FROM Orders
WHERE CustomerId = 38;

--SECOND EXAMPLE
INSERT into Orders (CustomerId, Date, Description)
values 
((SELECT Id FROM Customers WHERE Name = 'TQL'), '2024-06-07', 'TQL 1st Order');
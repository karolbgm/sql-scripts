--INNER JOIN

--SELECT Date, Orders.Description 'Order', Product, OrderLines.Description, Quantity, Price 
--FROM Orders
-- join OrderLines on OrderLines.OrdersId = Orders.Id
-- ORDER BY Product, Description ASC;

-- SELECT *
--FROM Customers
-- join Orders
-- on Orders.CustomerId = Customers.Id;


--ALIAS FOR TABLE NAMES
--SELECT *
--FROM Customers c
--join Orders o
--on o.CustomerId = c.Id
--join OrderLines ol 
--on ol.OrdersId = o.Id;

--LEFT JOIN
--SELECT *
--FROM Customers c
--left join Orders o
--on o.CustomerId = c.Id;

----RIGHT JOIN
--SELECT *
--FROM Customers c
--right join Orders o
--on o.CustomerId = c.Id;

----OUTER JOIN
--SELECT *
--FROM Customers c
--full outer join Orders o
--on o.CustomerId = c.Id;



--UNION
--'A' 'Class' creates a new column called Class with A value
--SELECT *, 'A' 'Class'
--FROM Customers
--WHERE sales >= 80000
--UNION
--SELECT *, 'B' 'Class'
--FROM Customers
--WHERE sales <= 80000 and sales >=20000
--UNION
--SELECT *, 'C' 'Class'
--FROM Customers
--WHERE sales < 20000

--ORDER BY Class Asc;

--
--SELECT AVG(Sales) 'Average'
--FROM Customers;

--SUBQUERIES
--Remember to add the Select Statement for subqueries
--Subqueries are done first, that's why we use parethesis
SELECT *
FROM Customers
WHERE Sales > (SELECT AVG(Sales)
FROM Customers);

SELECT *
FROM Customers
WHERE Sales < (SELECT AVG(Sales)
FROM Customers
WHERE City = 'Columbus');

SELECT *
FROM Customers
WHERE Sales >= (SELECT AVG(Sales)
FROM Customers
WHERE City = 'Cincinnati' or City = 'Cleveland');
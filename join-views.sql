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
SELECT *
FROM Customers c
left join Orders o
on o.CustomerId = c.Id;

--RIGHT JOIN
SELECT *
FROM Customers c
right join Orders o
on o.CustomerId = c.Id;

--OUTER JOIN
SELECT *
FROM Customers c
full outer join Orders o
on o.CustomerId = c.Id;

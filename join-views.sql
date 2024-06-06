SELECT Date, Orders.Description 'Order', Product, OrderLines.Description, Quantity, Price 
FROM Orders
 join OrderLines on OrderLines.OrdersId = Orders.Id
 ORDER BY Product, Description ASC;

 SELECT *
FROM Customers
 join Orders
 on Orders.CustomerId = Customers.Id;
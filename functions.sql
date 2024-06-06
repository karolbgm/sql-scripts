--DECLARE @LowSales int = 20000
--DECLARE @HighSales int = 50000
--Always use @ to declare Variables
-- We must include type of data (int, varchar(n) - strings, bit - 0 or 1, datetime)

--SELECT *
--  FROM Customers
--  WHERE Sales between @LowSales and @HighSales;
DECLARE @counter int = 0;
while @counter < 10
begin
  PRINT 'Iteration' + str(@counter)

  SET @Counter = @Counter + 1
end
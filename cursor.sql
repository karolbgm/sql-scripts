-- Declare cursor for result set we'll get from Select
DECLARE CustomerCursor CURSOR For
    SELECT Id, Name, City, State, Sales
	FROM Customers
	Order by Sales desc;

-- Open makes the result available for fetching 
OPEN CustomerCursor;
-- Declare the variables that are gonna hold the values fetched 
DECLARE @Id int, @Name varchar(30), @City varchar(30), @State char(2), @Sales decimal (9,2)
Fetch Next From CustomerCursor into @Id, @Name, @City, @State, @Sales;

-- Loop to determine whether there are more rows to fetch
-- If FETCH_STATUS = 0, there are more rows
While @@FETCH_STATUS = 0 BEGIN
  SELECT @Name, @Sales;

  Fetch Next From CustomerCursor into @Id, @Name, @City, @State, @Sales;

END;

PRINT @Name;

-- Close cursor when there are no more rows to fetch
CLOSE CustomerCursor;

-- Remove cursor from memory
DEALLOCATE CustomerCursor
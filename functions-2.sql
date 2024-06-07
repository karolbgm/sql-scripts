--FUNCTIONS
SELECT City, count(*) 'How Many?'
  FROM Customers
  GROUP BY City
  --HAVING is tied to Group By always
  HAVING count(*) > 12;

  --HAVING operates on a whole group while WHERE operates on each row 


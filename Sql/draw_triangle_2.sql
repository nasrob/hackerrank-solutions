/*
P(R) represents a pattern drawn by Julia in R rows.
The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *

Write a query to print the pattern P(20).
*/



SET @num = 0;

SELECT REPEAT('* ',@num := @num + 1)
FROM information_schema.tables LIMIT 20;

/*
The information_schema.tables trick is often used to generate a sequence of numbers
without needing to create a dedicated numbers table.
*/
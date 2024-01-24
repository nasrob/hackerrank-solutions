/*
You are given a table, Functions, containing two columns: X and Y.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X.
List the rows such that X1 ≤ Y1.
*/
SELECT DISTINCT Functions1.X, Functions1.Y 
FROM ( SELECT X, Y, COUNT(*) AS CNT FROM Functions GROUP BY X, Y ) Functions1 
JOIN Functions Functions2 ON Functions1.X = Functions2.Y 
AND Functions1.Y = Functions2.X 
AND Functions1.X < Functions1.Y 
OR (Functions1.X = Functions1.Y AND Functions1.CNT > 1) 
ORDER BY Functions1.X;

-- 2nd Solution
with t as
(select X, Y, row_number() over(order by X) as nrow
from Functions)

select t1.X, t2.X
from t as t1, t as t2
where t1.nrow < t2.nrow and t1.X = t2.Y and t1.Y = t2.X;
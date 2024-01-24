/*
Write a query calculating the amount of error (i.e.:  average monthly salaries),
and round it up to the next integer.
*/
SELECT CEIL(
    AVG(SALARY) - AVG(CAST(REPLACE(SALARY, '0', '') AS SIGNED))
)
FROM EMPLOYEES;
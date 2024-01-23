/*
Write a query to print all prime numbers less than or equal to 1000.
Print your result on a single line, and use the ampersand () character as your separator (instead of a space).
For example, the output for all prime numbers < 10 would be:
2&3&5&7
*/

WITH RECURSIVE list AS ( -- recursive CTE (list) generates a list of numbers starting from 2 up to 1000.
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM list
    WHERE n < 1000
),
division AS ( -- subquery (division) generates pairs of numbers (num and factor)
    SELECT L1.n AS num,
        L2.n AS factor,
        MOD(L1.n, L2.n) AS remainder --  and their remainders when num is divided by factor.
    FROM list L1
    LEFT JOIN list L2 ON L2.n <= ROUND(SQRT(L1.n)) -- self-join on the list CTE, where the second number (factor) is less than or equal to the square root of the first number (num).
    ORDER BY L1.n
)

SELECT GROUP_CONCAT(prime_numbers.num SEPARATOR '&') -- concatenate the prime numbers with an ampersand (&) separator.
FROM (
    SELECT DISTINCT div1.num -- selects prime numbers from the division subquery
    FROM division div1
    WHERE NOT EXISTS ( -- NOT EXISTS clause ensures that only numbers without a remainder of 0 in any previous row are selected, making them prime.
        SELECT div2.num
        FROM division div2
        WHERE div2.num = div1.num AND div2.remainder = 0
    )
) AS prime_numbers;
/*
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

SELECT round(lat_n,4) as answer
FROM (
    SELECT row_number() OVER (order by lat_n) AS rn, lat_n FROM station
    ) AS numbered_rows
WHERE rn = (SELECT (COUNT(*) - 1) / 2 + 1 FROM station);

select round(s.lat_n, 4)
from station as s 
where (
    (select count(lat_n) from station where lat_n < s.lat_n) = 
    (select count(lat_n) from station where lat_n > s.lat_n)
);

with med as
(
    select lat_n, row_number() over(order by lat_n) as upper,
    row_number() over(order by lat_n desc) as lower from station
)
select round(avg(lat_n),4) 
from (
    select lat_n from med 
    where upper = lower 
        or upper + 1 = lower 
        or upper - 1 = lower
    ) as subquery;


-- works on postgresql also
WITH get_median AS (
    SELECT
        lat_n
        ,row_number() OVER(ORDER BY lat_n ASC) AS rn_asc
        ,COUNT(*) OVER() AS ct
    FROM STATION
)
SELECT
    ROUND(AVG(lat_n), 4) AS median
FROM
    get_median
WHERE
    rn_asc BETWEEN ct/2.0 AND ct/2.0 + 1;

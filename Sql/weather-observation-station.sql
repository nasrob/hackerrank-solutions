/*
Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/
SELECT
    ROUND(SUM(lat_n), 2),
    ROUND(SUM(long_w), 2)
FROM STATION;

/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880
and less than 137.2345.
Truncate your answer to 4 decimal places.
*/
SELECT TRUNCATE(SUM(lat_n), 4)
FROM STATION
WHERE lat_n >= 38.7880 AND lat_n <= 137.2345;

/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.
*/
SELECT TRUNCATE(MAX(lat_n), 4)
FROM STATION
WHERE lat_n <= 137.2345;

/*
Query (LONG_W) for the largest (LAT_N) in STATION that is less than 137.2345.
Round your answer to 4 decimal places.
*/
SELECT ROUND(long_w, 4) FROM STATION WHERE lat_n < 137.2345
ORDER BY lat_n DESC LIMIT 1;

-- 2nd Solution
SELECT ROUND(long_w, 4) FROM STATION
WHERE lat_n = (SELECT MAX(lat_n) FROM STATION WHERE lat_n < 137.2345);
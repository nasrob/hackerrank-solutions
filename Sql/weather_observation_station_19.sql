-- Query the Euclidean Distance between points  and  and format your answer to display 4 decimal digits.

SELECT ROUND(
    SQRT(
        POW(MAX(lat_n) - MIN(lat_n), 2) +
        POW(MAX(long_w) - MIN(long_w), 2)
        ),
    4)
FROM STATION;
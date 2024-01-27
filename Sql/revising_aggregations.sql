-- Query the total population of all cities in CITY where District is California.
SELECT SUM(population) FROM CITY WHERE district = 'California';

-- Query the average population of all cities in CITY where District is California.
SELECT AVG(population) FROM CITY WHERE district = 'California';

-- Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(population)) FROM CITY;

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(population) FROM CITY WHERE COUNTRYCODE = 'JPN';

-- Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(population) - MIN(population) FROM CITY;


/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT SUM(CITY.Population) FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia';
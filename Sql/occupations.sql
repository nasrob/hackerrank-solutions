SELECT CONCAT(name , '(', SUBSTRING(occupation, 1, 1), ')')
FROM OCCUPATIONS
ORDER BY name ASC;

SELECT 
    CONCAT('There are a total of ', COUNT(occupation),' ', LOWER(occupation), 's.')
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(occupation) ASC, occupation ASC
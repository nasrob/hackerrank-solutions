/*
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains 3 columns Grade, Min_Mark, Max_Mark.

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark.
Ketty doesn't want the NAMES of those students who received a grade lower than 8.
The report must be in descending order by grade -- i.e. higher grades are entered first.
If there is more than one student with the same grade (8-10) assigned to them,
order those particular students by their name alphabetically.
Finally, if the grade is lower than 8,
use "NULL" as their name and list them by their grades in descending order.
If there is more than one student with the same grade (1-7) assigned to them,
order those particular students by their marks in ascending order.

Write a query to help Eve.
*/
-- 1st Solution
SELECT
    IF(Grades.grade >= 8, Students.name, NULL) AS name,
    Grades.grade, Students.marks
FROM Students
RIGHT JOIN Grades ON Students.marks
BETWEEN Grades.Min_Mark AND Grades.Max_Mark
WHERE Grades.grade >= 8
    OR (Grades.grade < 8 AND Students.Marks IS NOT NULL)
ORDER BY Grades.grade DESC, name, Students.marks; 

-- Solution without Join
SELECT 
    CASE
        WHEN G.GRADE >= 8 THEN S.NAME
        ELSE 'NULL'
    END,
    G.GRADE, S.MARKS
FROM STUDENTS S, GRADES G
WHERE S.MARKS >= MIN_MARK AND S.MARKS <= MAX_MARK
ORDER BY G.GRADE DESC, S.NAME, S.MARKS;

-- Solution using CTE
with a as 
(
select
    Name,
    grade,
    marks
from
    students
    left join grades on marks between min_mark and max_mark
)
select 
    case
        WHEN grade > 7 then name 
        ELSE NULL
    END,
    grade,
    marks
from
    a
order by grade desc, name asc, marks asc;
/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date.
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day
for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project.
Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete
the project in ascending order.
If there is more than one project that have the same number of completion days,
then order by the start date of the project.
*/

SET @prev_date = NULL, @grp_date_ranges = 0;

SELECT MIN(Start_date) as Start_date, Max(End_date) as End_date
FROM (
    SELECT Start_date, End_date,
    @grp_date_ranges := IF(@prev_date = Start_date - INTERVAL 1 DAY, @grp_date_ranges,
                        @grp_date_ranges + 1) as gdr,
    @prev_date := Start_date
    FROM Projects
    ORDER BY Start_date
) t
GROUP BY gdr
ORDER BY COUNT(*) ASC, Start_date ASC;
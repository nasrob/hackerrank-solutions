/*
Write a query to print total number of unique hackers who made at least 1 submission each day 
(starting on the first day of the contest),
and find the hacker_id and name of the hacker who made maximum number of submissions each day.
If more than one such hacker has a maximum number of submissions, print the lowest hacker_id.
The query should print this information for each day of the contest, sorted by the date.

The following tables hold contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

Submissions: The submission_date is the date of the submission, submission_id is the id of the submission,
hacker_id is the id of the hacker who made the submission, and score is the score of the submission.
*/
SELECT
    ds.submission_date,
    COUNT(DISTINCT ds.hacker_id) AS unique_hackers,
    h.hacker_id,
    h.name
FROM (
    SELECT
        submission_date,
        hacker_id,
        COUNT(submission_id) AS total_submissions
    FROM
        Submissions
    GROUP BY
        submission_date, hacker_id
) ds
JOIN (
    SELECT
        submission_date,
        MAX(total_submissions) AS max_submissions
    FROM (
        SELECT
            submission_date,
            hacker_id,
            COUNT(submission_id) AS total_submissions
        FROM
            Submissions
        GROUP BY
            submission_date, hacker_id
    ) sub
    GROUP BY
        submission_date
) msd ON ds.submission_date = msd.submission_date AND ds.total_submissions = msd.max_submissions
JOIN Hackers h ON ds.hacker_id = h.hacker_id
GROUP BY
    ds.submission_date, h.hacker_id
ORDER BY
    ds.submission_date;
/*
The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
Exclude all hackers with a total score of 0 from your result.
*/

/*
1st Solution, not passing the test yet
*/

WITH scores AS (
    SELECT hacker_id, MAX(score) AS max_score
    FROM SUBMISSIONS
    GROUP BY hacker_id, challenge_id
),
totals AS (
    SELECT hacker_id, SUM(max_score) AS total_score
    FROM scores
    GROUP BY hacker_id
)
SELECT H.hacker_id, H.name, t.total_score
FROM HACKERS H
JOIN totals T USING (hacker_id)
HAVING T.total_score <> 0
ORDER BY T.total_score DESC, H.hacker_id ASC;


-- 2nd Solution, working
SELECT hacker_id, name, SUM(max_score) FROM 
    (
        SELECT H.hacker_id, H.name, MAX(score) max_score
        FROM HACKERS H
        JOIN SUBMISSIONS S USING (hacker_id)
        GROUP BY H.hacker_id, H.name, S.challenge_id
    ) total_score
GROUP BY hacker_id, name
HAVING SUM(max_score) <> 0
ORDER BY SUM(max_score) DESC, hacker_id;
/*
Write a query to print the hacker_id, name, and the total number of challenges created by each student.
Sort your results by the total number of challenges in descending order.
If more than one student created the same number of challenges, then sort the result by hacker_id.
If more than one student created the same number of challenges 
and the count is less than the maximum number of challenges created,
then exclude those students from the result.
*/

-- 1st Solution
WITH total_challenges AS (
    SELECT H.hacker_id AS h_id, H.name, COUNT(CH.challenge_id) challenge_count
    FROM Hackers H
    JOIN Challenges CH USING(hacker_id)
    GROUP BY H.hacker_id, H.name
)

SELECT * FROM total_challenges
WHERE challenge_count NOT IN (
    SELECT challenge_count FROM total_challenges
    GROUP BY challenge_count
    HAVING COUNT(1) > 1 AND challenge_count < (SELECT MAX(challenge_count) FROM total_challenges)
)
ORDER BY challenge_count DESC, H.hacker_id ASC;
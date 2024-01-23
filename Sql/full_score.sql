/*
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
Order your output in descending order by the total number of challenges in which the hacker earned a full score.
If more than one hacker received full scores in same number of challenges,
then sort them by ascending hacker_id.
*/

-- 1st Solution
SELECT H.hacker_id, H.name FROM Hackers H
JOIN Submissions S USING (hacker_id)
JOIN Challenges CH USING (challenge_id)
WHERE S.score = (SELECT MAX(score) FROM Difficulty WHERE difficulty_level = CH.difficulty_level) -- query for top score
GROUP BY H.hacker_id, H.name
HAVING COUNT(DISTINCT CH.challenge_id) > 1
ORDER BY COUNT(CH.challenge_id) DESC, H.hacker_id ASC;

-- 2nd Solution
SELECT  H.hacker_id, H.name
FROM Hackers as H
JOIN Submissions as S on H.hacker_id = S.hacker_id -- join all tables
JOIN Challenges as C on S.challenge_id = C.challenge_id
JOIN Difficulty as D ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score -- Condition (before aggregation): WHERE row has a 'top score'
GROUP BY h.hacker_id, h.name -- Aggregate by hacker id so we can count occurences
-- of 'top score by id' (name has to be included b/c it's in output)
HAVING COUNT(h.hacker_id) >=2 -- Condition (after aggregation): Where id appears twice or more   
ORDER BY COUNT(h.hacker_id) DESC, h.hacker_id ASC; -- Order by the number of challenges the id got full marks for and then id

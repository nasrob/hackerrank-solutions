SELECT c.contest_id, c.hacker_id, c.name,
    SUM(s.total_submissions) AS total_submissions,
    SUM(s.total_accepted_submissions) AS total_accepted_submissions,
    SUM(v.total_views) AS total_views,
    SUM(v.total_unique_views) AS total_unique_views
FROM Contests c
LEFT JOIN Colleges cl ON c.contest_id = cl.contest_id
LEFT JOIN Challenges ch ON cl.college_id = ch.college_id
LEFT JOIN 
    (
        SELECT challenge_id, SUM(total_views) AS total_views,
                            SUM(total_unique_views) AS total_unique_views
        FROM view_stats
        GROUP BY challenge_id
    ) AS v ON ch.challenge_id = v.challenge_id

LEFT JOIN
    (
        SELECT challenge_id, SUM(total_submissions) AS total_submissions,
                            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM submission_stats
        GROUP BY challenge_id
    ) AS s ON ch.challenge_id = s.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING
    SUM(s.total_submissions) IS NOT NULL OR
    SUM(s.total_accepted_submissions) IS NOT NULL OR
    SUM(v.total_views) IS NOT NULL OR
    SUM(v.total_unique_views) IS NOT NULL
ORDER BY c.contest_id;
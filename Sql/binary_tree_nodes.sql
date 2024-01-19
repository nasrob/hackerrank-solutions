SELECT n,
    CASE
        WHEN p IS NULL THEN 'Root'
        WHEN n IN (SELECT DISTINCT p FROM BST WHERE p IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS nodeType
FROM BST
ORDER BY n;
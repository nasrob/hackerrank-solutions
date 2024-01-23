SELECT W.id, WP.age, W.coins_needed, W.power
FROM WANDS W
JOIN WANDS_PROPERTY WP USING (code)
WHERE WP.is_evil = 0
AND W.coins_needed = (
    SELECT MIN(WANDS.coins_needed) FROM WANDS
    WHERE WANDS.code = W.code AND WANDS.power = W.power
)
ORDER BY W.power DESC, WP.age DESC;
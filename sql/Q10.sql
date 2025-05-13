-- ===========================================================
-- Q10: Top-3 genre pairs to appear in festivals 
-- ===========================================================

SELECT
    g_1.genre_name AS genre_1,
    g_2.genre_name AS genre_2,
    COUNT(*) AS occurences
FROM performance p
JOIN event e ON e.event_id = p.event_id
JOIN performer_genre pg_1 ON pg_1.performer_id = p.performer_id
JOIN performer_genre pg_2 ON pg_2.performer_id = p.performer_id
-- self-join -> cartesian set -> filter by pg1<pg2
                          AND pg_1.genre_id < pg_2.genre_id 
JOIN genre g_1 ON g_1.genre_id = pg_1.genre_id
JOIN genre g_2 ON g_2.genre_id = pg_2.genre_id
GROUP BY g_1.genre_name, g_2.genre_name
ORDER BY occurences DESC
LIMIT 3;
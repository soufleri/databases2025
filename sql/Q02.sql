-- ===========================================================
-- Q02: List all the artists belonging to a specific music genre ('Rap')
--      indicating whether they participated a specific year (2021)
-- ===========================================================

SELECT 
    p.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    CASE 
        WHEN a.performer_id IS NOT NULL THEN 'Artist'
        WHEN b.performer_id IS NOT NULL THEN 'Band'
        ELSE 'Unknown'
    END AS performer_type,
    g.genre_name,
    CASE 
        WHEN perf_in_year.performer_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS performed_in_year
FROM performer p
LEFT JOIN artist a ON p.performer_id = a.performer_id
LEFT JOIN band b ON p.performer_id = b.performer_id
JOIN performer_genre pg ON p.performer_id = pg.performer_id
JOIN genre g ON pg.genre_id = g.genre_id
LEFT JOIN (
    SELECT DISTINCT pf.performer_id
    FROM performance pf
    JOIN event e ON pf.event_id = e.event_id
    WHERE e.year = 2021 -- Replace with the desired year
) AS perf_in_year ON p.performer_id = perf_in_year.performer_id
WHERE g.genre_name = 'Rap' -- Replace with the desired genre
ORDER BY performer_name;

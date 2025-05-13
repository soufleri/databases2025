-- ===========================================================
-- Q14: Find which music genres had the same number of appearances
--      in two consecutive years, with at least 3 appearances per year;
-- ===========================================================

WITH genre_year_counts AS (
    SELECT 
        g.genre_name,
        e.year,
        COUNT(*) AS performance_count
    FROM performance pf
    JOIN event e ON pf.event_id = e.event_id
    JOIN performer_genre pg ON pf.performer_id = pg.performer_id
    JOIN genre g ON pg.genre_id = g.genre_id
    GROUP BY g.genre_name, e.year
    HAVING COUNT(*) >= 3
)
SELECT 
    g1.genre_name,
    g1.year AS year_1,
    g2.year AS year_2,
    g1.performance_count
FROM genre_year_counts g1
JOIN genre_year_counts g2 
    ON g1.genre_name = g2.genre_name
   AND g2.year = g1.year + 1
   AND g1.performance_count = g2.performance_count
ORDER BY g1.genre_name, g1.year;

/*
SELECT 
    g1.genre_name,
    g1.year AS year_1,
    g2.year AS year_2,
    g1.performance_count
FROM (
    SELECT 
        g.genre_name,
        e.year,
        COUNT(*) AS performance_count
    FROM performance pf
    JOIN event e ON pf.event_id = e.event_id
    JOIN performer_genre pg ON pf.performer_id = pg.performer_id
    JOIN genre g ON pg.genre_id = g.genre_id
    GROUP BY g.genre_name, e.year
    HAVING COUNT(*) >= 3
) AS g1
JOIN (
    SELECT 
        g.genre_name,
        e.year,
        COUNT(*) AS performance_count
    FROM performance pf
    JOIN event e ON pf.event_id = e.event_id
    JOIN performer_genre pg ON pf.performer_id = pg.performer_id
    JOIN genre g ON pg.genre_id = g.genre_id
    GROUP BY g.genre_name, e.year
    HAVING COUNT(*) >= 3
) AS g2
  ON g1.genre_name = g2.genre_name
 AND g2.year = g1.year + 1
 AND g1.performance_count = g2.performance_count
ORDER BY g1.genre_name, g1.year;
*/
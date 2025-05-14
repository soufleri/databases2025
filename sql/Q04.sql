-- ===========================================================
-- Q04: For a certain artist (31), find the average ratings (Performance Score)
--      and appearance (Overall Score).
-- 
-- ===========================================================

SELECT 
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    ROUND(AVG(r.score_performance), 2) AS avg_score_performance,
    ROUND(AVG(r.score_overall), 2) AS avg_score_overall
FROM rating r
JOIN performance pf ON r.performance_id = pf.performance_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
LEFT JOIN band b ON p.performer_id = b.performer_id
WHERE pf.performer_id = 31 -- Replace with the desired artist ID
GROUP BY pf.performer_id, performer_name;

/* Alt query plan
ANALYZE FORMAT=JSON
SELECT 
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    ROUND(AVG(r.score_performance), 2) AS avg_score_performance,
    ROUND(AVG(r.score_overall), 2) AS avg_score_overall
FROM rating r FORCE INDEX (idx_rating_perf)
JOIN performance pf ON r.performance_id = pf.performance_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
LEFT JOIN band b ON p.performer_id = b.performer_id
WHERE pf.performer_id = 31
GROUP BY pf.performer_id, performer_name;
*/
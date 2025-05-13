-- ===========================================================
-- Q03: Find performers who have appeared as an opening act more
--      than twice in the same year.
-- ===========================================================

SELECT 
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    COUNT(*) AS opening_performances,
    e.year
FROM performance pf
JOIN event e ON pf.event_id = e.event_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
LEFT JOIN band b ON p.performer_id = b.performer_id
WHERE pf.type_id = 1  -- Opening
GROUP BY pf.performer_id, e.year
HAVING COUNT(*) > 2
ORDER BY e.year, performer_name;

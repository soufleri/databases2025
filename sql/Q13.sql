-- ===========================================================
-- Q13: Find the artists who have participated in festivals 
--      in at least 3 different continents.
-- ===========================================================

SELECT
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    COUNT(DISTINCT l.continent) AS continent_count,
    GROUP_CONCAT(DISTINCT l.continent ORDER BY l.continent SEPARATOR ', ') AS continents
FROM performance pf
JOIN event e ON pf.event_id = e.event_id
JOIN festival f ON e.year = f.year
JOIN location l ON f.location_id = l.location_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
GROUP BY pf.performer_id, performer_name
HAVING COUNT(DISTINCT l.continent) >= 3
ORDER BY continent_count DESC, performer_name;
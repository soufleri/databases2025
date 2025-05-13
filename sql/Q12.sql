-- ===========================================================
-- Q12: Find the staff required for each day of the festival,
--      providing an analysis by category
-- ===========================================================

SELECT 
    e.date,
    SUM(20) AS tech_crew,
    SUM(CEIL(s.capacity * 0.05)) AS security,
    SUM(CEIL(s.capacity * 0.02)) AS support,
    SUM(20 + CEIL(s.capacity * 0.05) + CEIL(s.capacity * 0.02)) AS total_staff
FROM event e
JOIN stage s ON e.stage_id = s.stage_id AND e.year = s.year
GROUP BY e.date
ORDER BY e.date;
-- ===========================================================
-- Q07: Find out which festival had the lowest 
--      average experience of technical staff?
-- ===========================================================

SELECT 
    e.year,
    sr.role_name,
    ROUND(AVG(el.level_order), 2) AS average_experience
FROM event_staff es
JOIN event e ON es.event_id = e.event_id
JOIN staff s ON es.staff_id = s.staff_id
JOIN staff_role sr ON s.role_id = sr.role_id
JOIN experience_level el ON s.level_id = el.level_id
WHERE sr.role_id = 1
GROUP BY e.year
ORDER BY average_experience ASC
LIMIT 1;
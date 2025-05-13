-- ===========================================================
-- Q09: Find the visitors that have attended the same number 
--      of performances within a year, with more than 3 attendances.
-- ===========================================================

SELECT
    v.visitor_id,
    v.full_name,
    attendances.attended_performances 
-- Subquery: for each visitor, activated tickets -> event -> performance
FROM (
    SELECT
        t.visitor_id,
        COUNT(DISTINCT pf.performance_id) AS attended_performances
    FROM ticket t
    JOIN performance pf ON t.event_id = pf.event_id
    WHERE t.is_activated = TRUE
    GROUP BY t.visitor_id
    HAVING attended_performances > 3
) AS attendances
JOIN visitor v ON attendances.visitor_id = v.visitor_id
-- Innewer query: list of visitors with the same number of performances
-- Outer query: group by attended_performances and filter only those with more than 1 visitor
WHERE attendances.attended_performances IN (
    SELECT attended_performances
    FROM (
        SELECT
            t.visitor_id,
            COUNT(DISTINCT pf.performance_id) AS attended_performances
        FROM ticket t
        JOIN performance pf ON t.event_id = pf.event_id
        WHERE t.is_activated = TRUE
        GROUP BY t.visitor_id
        HAVING COUNT(DISTINCT pf.performance_id) > 3
        ) AS sub
    GROUP BY attended_performances
    HAVING COUNT(*) > 1
)
ORDER BY attended_performances DESC, v.visitor_id;
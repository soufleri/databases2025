-- ===========================================================
-- Q08: Find the support staff (id=3) that does not have
--      scheduled work on a specific date (eg '2018-07-23').
-- ===========================================================

SELECT
    s.staff_id,
    s.full_name
FROM staff s
WHERE s.role_id = 3
AND s.staff_id NOT IN (
    SELECT es.staff_id
    FROM event_staff es
    JOIN event e ON es.event_id = e.event_id
    WHERE e.date = '2018-07-23' -- Replace with the desired date
)
ORDER BY s.staff_id;
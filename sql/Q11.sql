-- ===========================================================
-- Q11: Find all the artists who participated at least 5 times
--      less than the artist with the most festival participations.
-- ===========================================================

SELECT
    pc.performer_id,
    pc.performer_name,
    pc.num_performances
FROM (
    -- counts performances for each performer
    SELECT
        pf.performer_id,
        COALESCE(a.stage_name, p.name) AS performer_name,
        COUNT(*) AS num_performances
    FROM performance pf
    JOIN performer p ON pf.performer_id = p.performer_id
    LEFT JOIN artist a ON p.performer_id = a.performer_id
    GROUP BY p.performer_id, performer_name
) AS pc
JOIN (
    -- gets the top performer count
    SELECT MAX(num_performances) AS max_perf
    FROM (
        SELECT
            performer_id,
            COUNT(*) AS num_performances
        FROM performance
        GROUP BY performer_id
    ) AS perf_counts
) AS tp
ON pc.num_performances <= tp.max_perf - 5
ORDER BY pc.num_performances DESC, pc.performer_name;
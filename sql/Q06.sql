-- ===========================================================
-- Q06: For a certain visitor (45), find the performances they
--      have attended and their average rating per performance.
-- ===========================================================

SELECT
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer,
    ROUND((
        r.score_performance +
        r.score_audio_visual +
        r.score_stage_presence +
        r.score_organization +
        r.score_overall
    ) / 5, 2) AS average_score
FROM ticket t
JOIN event e ON t.event_id = e.event_id
JOIN performance pf ON e.event_id = pf.event_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
LEFT JOIN rating r ON pf.performance_id = r.performance_id AND t.ticket_id = r.ticket_id
WHERE t.visitor_id = 1 -- Replace with the desired visitor ID
AND t.is_activated = TRUE
ORDER BY pf.performance_id;


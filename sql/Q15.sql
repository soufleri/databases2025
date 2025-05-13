-- ===========================================================
-- Q15: Find the top-5 visitors who have given the highest total ratings to an artist.
-- ===========================================================

SELECT
    v.visitor_id,
    v.full_name,
    pf.performer_id,
    COALESCE(a.stage_name, p.name) AS performer_name,
    SUM(
        r.score_overall +
        r.score_performance +
        r.score_audio_visual +
        r.score_organization +
        r.score_stage_presence
    ) AS total_score
FROM rating r
JOIN ticket t ON r.ticket_id = t.ticket_id
JOIN visitor v ON t.visitor_id = v.visitor_id
JOIN performance pf ON r.performance_id = pf.performance_id
JOIN performer p ON pf.performer_id = p.performer_id
LEFT JOIN artist a ON p.performer_id = a.performer_id
GROUP BY v.visitor_id, pf.performer_id
ORDER BY total_score DESC, visitor_id ASC
LIMIT 5;
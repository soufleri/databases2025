-- ===========================================================
-- Q05: Find young performers (age < 30) who have the most appearances in festivals.
-- ===========================================================

SELECT
    a.performer_id,
    a.stage_name,
    p.name AS real_name,
    a.age,
    COALESCE(solo.count_solo, 0) + COALESCE(band.count_band, 0) AS total_performances
FROM artist a
JOIN performer p ON a.performer_id = p.performer_id
-- Solo
LEFT JOIN (
    SELECT pf.performer_id, COUNT(*) AS count_solo
    FROM performance pf
    JOIN artist a ON pf.performer_id = a.performer_id
    WHERE a.age < 30
    GROUP BY pf.performer_id
) AS solo ON a.performer_id = solo.performer_id
-- As band member
LEFT JOIN (
    SELECT ab.artist_id, COUNT(*) AS count_band
    FROM artist_band ab
    JOIN performance pf ON ab.band_id = pf.performer_id
    JOIN artist a ON ab.artist_id = a.performer_id
    WHERE a.age < 30
    GROUP BY ab.artist_id
) AS band ON a.performer_id = band.artist_id
WHERE a.age < 30
GROUP BY total_performances DESC, a.age ASC;
-- ==========================================================
-- Q01: Festival's revenue per yeasr (across all ticket categories) 
--      and with analysis for all payment methods.
-- ==========================================================

SELECT
    f.year AS Festival_Year,
    SUM(CASE WHEN pm.method_id = 1 THEN t.price_paid ELSE 0 END) AS Credit_Card_Earnings,
    SUM(CASE WHEN pm.method_id = 2 THEN t.price_paid ELSE 0 END) AS Paypal_Earnings,
    SUM(CASE WHEN pm.method_id = 3 THEN t.price_paid ELSE 0 END) AS Bank_Transfer_Earnings,
    SUM(CASE WHEN pm.method_id = 4 THEN t.price_paid ELSE 0 END) AS Debit_Card_Earnings,
    SUM(CASE WHEN pm.method_id = 5 THEN t.price_paid ELSE 0 END) AS Google_Pay_Earnings,
    SUM(t.price_paid) AS Total_Earnings
FROM ticket t
JOIN event e ON t.event_id = e.event_id
JOIN festival f ON e.year = f.year
JOIN payment_method pm ON t.payment_method_id = pm.method_id
GROUP BY f.year
ORDER BY f.year;

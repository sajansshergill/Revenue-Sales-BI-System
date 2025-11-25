-- ======================================================
-- DAILY REVENUE
-- ------------------------------------------------------
-- This query calculates the total revenue generated
-- for each day from the `revenue_daily` table.
-- Used for: Daily trends, dashboards, alerts.
-- ======================================================

SELECT 
    date,
    SUM(revenue) AS total_revenue
FROM revenue_daily
GROUP BY date
ORDER BY date;

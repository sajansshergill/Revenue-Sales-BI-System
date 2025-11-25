-- ======================================================
-- REVENUE BY INDUSTRY
-- ------------------------------------------------------
-- This query shows which industries generate the most revenue.
-- Combines customers + subscriptions to calculate MRR by segment.
--
-- Useful for:
--   • Executive dashboards
--   • GTM strategy
--   • Revenue mix analysis
-- ======================================================

SELECT
    c.industry,
    SUM(s.mrr) AS total_mrr,
    COUNT(DISTINCT c.customer_id) AS customer_count
FROM customers c
JOIN subscriptions s
    ON c.customer_id = s.customer_id
GROUP BY c.industry
ORDER BY total_mrr DESC;

-- ======================================================
-- CUSTOMER SEGMENTATION
-- ------------------------------------------------------
-- This query groups customers by:
--   • Industry
--   • Company size (SMB, Mid, Enterprise)
--
-- And calculates:
--   • Number of customers
--   • Total MRR by segment
--
-- Useful for:
--   • ICP analysis
--   • Market penetration dashboards
-- ======================================================

SELECT
    c.industry,
    c.company_size,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    SUM(s.mrr) AS total_mrr
FROM customers c
JOIN subscriptions s
    ON c.customer_id = s.customer_id
GROUP BY c.industry, c.company_size
ORDER BY total_mrr DESC;

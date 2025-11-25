-- ======================================================
-- MRR CHURN
-- ------------------------------------------------------
-- This query calculates churned MRR per month.
--
-- A subscription counts as churned in the month of its
-- end_date. MRR lost = sum of mrr for those subscriptions.
--
-- Used for:
--   • Churn dashboard cards
--   • Weekly reporting
--   • Monitoring alerts
-- ======================================================

SELECT
    DATE_TRUNC('month', end_date) AS month,
    SUM(mrr) AS churned_mrr
FROM subscriptions
WHERE end_date IS NOT NULL
GROUP BY 1
ORDER BY 1;

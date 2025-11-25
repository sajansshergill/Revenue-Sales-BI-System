-- ======================================================
-- UPSELL & CROSS-SELL ANALYSIS
-- ------------------------------------------------------
-- This query identifies customers with multiple plans or
-- higher total MRR, which suggests possible upsell/cross-sell
-- behavior. (Simplified for portfolio demo.)
--
-- Metrics:
--   • Number of subscriptions per customer
--   • Total MRR per customer
-- ======================================================

SELECT
    customer_id,
    COUNT(subscription_id) AS subscription_count,
    SUM(mrr) AS total_mrr
FROM subscriptions
GROUP BY customer_id
ORDER BY total_mrr DESC;

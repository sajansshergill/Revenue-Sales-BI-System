-- ======================================================
-- NET NEW MRR
-- ------------------------------------------------------
-- Net New MRR = New MRR + Expansion MRR - Churned MRR
--
-- Definitions:
--   • New MRR      = Customers starting a subscription
--   • Expansion    = Customers upgrading (Enterprise > Pro > Basic)
--   • Churned MRR  = Subscriptions ending in the month
--
-- Note: This is a simplified version for portfolio use.
-- ======================================================

WITH new_mrr AS (
    SELECT
        DATE_TRUNC('month', start_date) AS month,
        SUM(mrr) AS new_mrr
    FROM subscriptions
    GROUP BY 1
),

churn_mrr AS (
    SELECT
        DATE_TRUNC('month', end_date) AS month,
        SUM(mrr) AS churned_mrr
    FROM subscriptions
    WHERE end_date IS NOT NULL
    GROUP BY 1
),

-- No true expansion logic in our small dataset,
-- so expansion = 0 by default.
expansion_mrr AS (
    SELECT
        DATE_TRUNC('month', CURRENT_DATE) AS month,
        0 AS expansion_mrr
)

SELECT
    COALESCE(n.month, c.month) AS month,
    COALESCE(new_mrr, 0) AS new_mrr,
    COALESCE(expansion_mrr, 0) AS expansion_mrr,
    COALESCE(churned_mrr, 0) AS churned_mrr,
    COALESCE(new_mrr, 0) + COALESCE(expansion_mrr, 0) - COALESCE(churned_mrr, 0)
        AS net_new_mrr
FROM new_mrr n
FULL OUTER JOIN churn_mrr c USING(month)
LEFT JOIN expansion_mrr e USING(month)
ORDER BY month;

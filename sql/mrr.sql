-- ======================================================
-- MONTHLY RECURRING REVENUE (MRR)
-- ------------------------------------------------------
-- MRR is calculated as the sum of all active subscription
-- MRR values for each month.
--
-- A subscription is considered active in a month if:
--   start_date <= month_end
--   AND (end_date IS NULL OR end_date > month_start)
-- ======================================================

WITH months AS (
    SELECT
        DATE_TRUNC('month', start_date) AS month
    FROM subscriptions
    UNION
    SELECT
        DATE_TRUNC('month', COALESCE(end_date, CURRENT_DATE))
    FROM subscriptions
)

SELECT
    DISTINCT DATE_TRUNC('month', m.month) AS month,
    SUM(s.mrr) OVER (
        PARTITION BY DATE_TRUNC('month',
            GREATEST(s.start_date, m.month)
        )
    ) AS total_mrr
FROM months m
JOIN subscriptions s
    ON s.start_date <= m.month
   AND (s.end_date IS NULL OR s.end_date > m.month)
ORDER BY month;

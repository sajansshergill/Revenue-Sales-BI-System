-- ======================================================
-- SALES REP PERFORMANCE
-- ------------------------------------------------------
-- This query shows how each sales rep is performing based
-- on Closed Won opportunities.
--
-- Metrics:
--   • Count of deals won
--   • Total revenue won
--   • Average deal size
-- ======================================================

SELECT
    st.rep_name,
    st.region,
    COUNT(*) AS deals_won,
    SUM(p.amount) AS total_revenue_won,
    AVG(p.amount) AS avg_deal_size
FROM sales_pipeline p
JOIN sales_team st
    ON p.sales_rep_id = st.sales_rep_id
WHERE p.stage = 'Closed Won'
GROUP BY st.rep_name, st.region
ORDER BY total_revenue_won DESC;

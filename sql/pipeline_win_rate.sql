-- ======================================================
-- PIPELINE WIN RATE
-- ------------------------------------------------------
-- Win Rate = Closed Won Opportunities / All Closed Opportunities
--
-- Closed Lost + Closed Won = Total Closed Deals
-- ======================================================

SELECT
    st.rep_name,
    st.region,
    COUNT(*) FILTER (WHERE p.stage = 'Closed Won') 
        AS closed_won,
    COUNT(*) FILTER (WHERE p.stage IN ('Closed Won', 'Closed Lost'))
        AS total_closed,
    ROUND(
        COUNT(*) FILTER (WHERE p.stage = 'Closed Won') * 100.0 /
        NULLIF(COUNT(*) FILTER (WHERE p.stage IN ('Closed Won', 'Closed Lost')), 0),
        2
    ) AS win_rate_percent
FROM sales_pipeline p
JOIN sales_team st
    ON p.sales_rep_id = st.sales_rep_id
GROUP BY st.rep_name, st.region
ORDER BY win_rate_percent DESC;

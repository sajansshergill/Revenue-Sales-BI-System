-- ======================================================
-- PIPELINE FUNNEL
-- ------------------------------------------------------
-- This query summarizes how many opportunities sit in
-- each stage of the pipeline (Prospect → Negotiation → Closed).
--
-- Useful for:
--   • Funnel charts
--   • Forecasting
--   • Pipeline health monitoring
-- ======================================================

SELECT
    stage,
    COUNT(*) AS opportunity_count,
    SUM(amount) AS total_pipeline_value
FROM sales_pipeline
GROUP BY stage
ORDER BY opportunity_count DESC;

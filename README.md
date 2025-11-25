# Revenue-Sales-BI-System

---
## ⭐ 1. Project Folder Structure

<img width="631" height="563" alt="image" src="https://github.com/user-attachments/assets/7e0d5a57-f596-4a98-877c-6b0d3cb2b7a2" />

---

## ⭐ 2. Mock Database Schema (Postgres or BigQuery)

Design it LIKE a real SaaS revenue system:

🧩 Tables
i) customers
- customer_id
- signup_date
- industry
- company_size
- sales_rep_id

ii) subscriptions
- subscription_id
- customer_id
- start_date
- end_date
- plan (Basic/Pro/Enterprise)
- mrr

iii) revenue_daily
- date
- customer_id
- revenue

iv) sales_pipeline
- opportunity_id
- customer_id
- stage (Prospect → Closed Won/Lost)
- amount
- created_at
- closed_at

v) sales_team
- sales_rep_id
- rep_name
- region

---

## ⭐ 3. SQL Queries to Build 

🟦 i. Daily Revenue
SELECT date, SUM(revenue) AS total_revenue
FROM revenue_daily
GROUP BY date
ORDER BY date;

🟦 ii. MRR Churn
SELECT
    DATE_TRUNC('month', end_date) AS month,
    SUM(mrr) AS churned_mrr
FROM subscriptions
WHERE end_date IS NOT NULL
GROUP BY 1
ORDER BY 1;

🟦 iii. Pipeline → Win Conversion
SELECT
    sales_rep_id,
    COUNT(*) FILTER (WHERE stage = 'Closed Won') * 100.0 /
    COUNT(*) AS win_rate
FROM sales_pipeline
GROUP BY sales_rep_id;

🟦 iv. Sales Rep Performance
SELECT s.rep_name, COUNT(*) AS closed_won, SUM(amount) AS revenue_won
FROM sales_pipeline p
JOIN sales_team s USING(sales_rep_id)
WHERE p.stage='Closed Won'
GROUP BY s.rep_name;

🟦 v. Upsell & Cross-Sell
SELECT
    c.customer_id,
    COUNT(subscription_id) AS plans_owned,
    SUM(mrr) AS total_mrr
FROM subscriptions c
GROUP BY 1;

Create 8–10 SQL queries total.

--- 

## ⭐ 4. Dashboard (Looker Imitation)
Build in:
✔ Looker Studio (free)
✔ Power BI (more professional)

Dashboard Sections:

1️⃣ Revenue Overview
- Daily revenue
- MRR trend
- Churn trend
- Net new MRR

2️⃣ Sales Performance
- Win rate
- Pipeline stage funnel
- Sales rep leaderboard
- Regional performance

3️⃣ Customer Insights
- Industry heatmap
- Company size segmentation
- Plan distribution

This mirrors real Looker dashboards used in BI teams.

---


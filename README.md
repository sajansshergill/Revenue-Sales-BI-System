# 📊 End-to-End Revenue BI System

(SQL • Power BI/Looker Studio • Python • Excel • PPT)

---

This project simulates how a real Business Intelligence (BI) Analyst works inside a Revenue Analytics team. It covers SQL analysis, dashboard creation, on-call support, documentation, and simple automation.

---

## ✅ 1. Project Overview

This system analyzes a mock SaaS company’s revenue, churn, and sales pipeline.

You will:
- Query revenue data using SQL
- Build a dashboard (Power BI / Looker Studio)
- Create a Slack/JIRA-style “BI request workflow”
- Automate simple daily checks
- Document KPIs and definitions
- Generate weekly reporting slides

This makes the project a realistic BI Analyst portfolio piece.

---

## 📦 2. Project Structure

<img width="645" height="194" alt="image" src="https://github.com/user-attachments/assets/144e6692-d9e5-4ce1-b79e-c78a41ec15e1" />

---

## 🧩 3. Data Model (High-Level)

You will work with five core tables:
- customers – customer details
- subscriptions – plan + MRR
- revenue_daily – daily revenue
- sales_pipeline – opportunities + stages
- sales_team – rep info

This is structured in a simple star schema.

---

## 📘 4. SQL Analytics Included

You will build queries for:

- Daily Revenue
- Monthly Recurring Revenue (MRR)
- Churn
- Pipeline → Win Conversion
- Sales Rep Performance
- Upsell / Cross-sell
- Customer segmentation

These queries power the dashboard and weekly reporting.

---

## 📊 5. Dashboard (Looker-Style)

The dashboard contains:

Revenue KPIs
- Daily revenue trend
- MRR trend
- Churn analysis
  
Sales KPIs
- Win rate
- Sales rep leaderboard
- Pipeline funnel

Built using Power BI or Looker Studio.

---

## 🤖 6. Automation Scripts

Simple Python scripts simulate real BI workflows:

simulate_data_requests.py
- Mimics Slack/JIRA BI requests
- Returns SQL outputs
- Logs interactions

monitoring_script.py
- Detects missing data
- Flags revenue spikes/drops
- Creates daily alert messages

This demonstrates basic data operations automation.

---

## 📄 7. Documentation

The documentation/ folder includes:
- Data Dictionary
- Metric Definitions (MRR, Churn, ARR, Win Rate)
- Naming Conventions
- Star Schema Diagram
- KPI Tree

This matches real BI governance work.

---

## 🖼 8. Weekly Reporting (PPT)

A weekly report summarizing:

- KPI changes
- Churn/Revenue movements
- Sales performance
- Commentary & insights

Example insight:
“MRR dipped by 3.2% due to higher churn in SMB customers.”

---

## 🔧 9. Tools Used

- SQL (Postgres/BigQuery)
- Power BI or Looker Studio
- Python
- Excel
- PowerPoint
- GitHub

---

## 🚀 10. How to Run This Project

- Download the mock CSV files
- Import them into Postgres/BigQuery
- Run SQL queries from /sql
- Build dashboard using /dashboards
- Run Python scripts from /automation
- Export insights into weekly PPT

---

## 🎯 11. Purpose of This Project

This project is designed to showcase:
- BI analysis
- Dashboarding
- On-call support workflows
- SQL + Python
- Automation
- Metric governance
- Reporting

Everything aligns directly with real BI Analyst responsibilities.

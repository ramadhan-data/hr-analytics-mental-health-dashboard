# HR Analytics: Employee Mental Health & Retention Analysis

An end-to-end data analysis project examining burnout, work-life balance, and retention risk 
across 10,000 employees from 20 countries and 14 industries (2020-2024). Built using Python, 
SQL, and Power BI to simulate a real-world HR analytics consulting engagement.

![Dashboard Overview](images/DASHBOARD.png)

## Project Overview

**Client Brief**: A multinational company with 2,000+ employees requested an analysis of 
internal survey data to identify the key drivers of employee burnout and provide actionable 
recommendations for management.

**Objective**: Identify which factors most strongly predict burnout, compare burnout across 
employee groups, and evaluate whether existing interventions (manager support, mental health 
policies, EAP programs) are effective.

## Tools Used

- **Python** (pandas, matplotlib, seaborn) — data cleaning, exploratory data analysis, correlation analysis
- **SQL** (MySQL) — business-focused aggregate queries, including CTEs and window functions
- **Power BI** — interactive dashboard with KPI cards, charts, and filters

## Project Structure

- data/ — Raw and cleaned datasets
- notebooks/ — Python EDA notebook
- sql/ — SQL analysis queries
- powerbi/ — Power BI dashboard file
- images/ — Chart exports and dashboard screenshots
- RECOMMENDATIONS.md — Business recommendations

## Key Findings

1. **Burnout is driven by workload, not demographics.** Weekly work hours (r = 0.75) and 
   overtime (r = 0.75) are by far the strongest predictors of burnout — far stronger than age, 
   gender, or company size (all under 0.5-point variation).

2. **Industry reflects work culture, not inherent risk.** Finance & Banking, Consulting, 
   Technology, and Legal show the highest burnout — and also the highest average work hours 
   and overtime, confirming workload as the underlying driver.

3. **Manager support shows no measurable effect on burnout** (r = 0.003), even after testing 
   for non-linear relationships — a finding that challenges a common workplace assumption.

4. **Burnout does not predict intention to leave** (r = 0.0075). Retention and burnout should 
   be treated as separate problems with separate solutions.

5. **Mental health policies and EAP programs show no measurable impact** on employee wellbeing 
   — and 68% of employees with EAP access never use it, pointing to a utilization gap rather 
   than a policy gap.

6. **Remote work is associated with lower burnout** (3.82) compared to Hybrid (4.14) and 
   On-site (4.08), with no drop in productivity or satisfaction.

Full analysis and business recommendations: see [RECOMMENDATIONS.md](RECOMMENDATIONS.md)

## Supporting Visualizations

![Burnout by Industry](images/chart1_burnout_by_industry.png)
![Work Hours vs Burnout](images/chart2_workhours_vs_burnout.png)
![Burnout by Work Model](images/chart3_burnout_by_workmodel.png)
![Correlation Heatmap](images/chart4_correlation_heatmap.png)
![EAP Utilization](images/chart5_eap_utilization.png)

## SQL Analysis Example (CTE + Window Function)

![SQL Query](images/sql_code.png)
![Query Result](images/sql_result.png)

## Data Source

Synthetic HR survey dataset (10,000 records, 34 variables) covering demographics, work 
conditions, mental health indicators, and employer support metrics.

## Author

ramadhan-data — Data Analyst specializing in SQL, Power BI, and Python for business analytics.
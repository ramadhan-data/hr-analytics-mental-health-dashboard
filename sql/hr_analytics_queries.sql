-- ============================================
-- HR ANALYTICS: EMPLOYEE MENTAL HEALTH & RETENTION ANALYSIS
-- SQL Analysis
-- ============================================

-- 1. Average Burnout by Industry
SELECT 
    industry,
    ROUND(AVG(burnout_risk_score), 2) AS avg_burnout,
    COUNT(*) AS employee_count
FROM employee_survey
GROUP BY industry
ORDER BY avg_burnout DESC;


-- 2. Average Burnout by Country
SELECT 
    country,
    ROUND(AVG(burnout_risk_score), 2) AS avg_burnout,
    COUNT(*) AS employee_count
FROM employee_survey
GROUP BY country
ORDER BY avg_burnout DESC;


-- 3. Average Burnout by Job Role
SELECT 
    job_role,
    ROUND(AVG(burnout_risk_score), 2) AS avg_burnout,
    COUNT(*) AS employee_count
FROM employee_survey
GROUP BY job_role
ORDER BY avg_burnout DESC;


-- 4. Average Salary by Industry
SELECT 
    industry,
    ROUND(AVG(annual_salary_usd), 0) AS avg_salary,
    COUNT(*) AS employee_count
FROM employee_survey
GROUP BY industry
ORDER BY avg_salary DESC;


-- 5. Average Weekly Hours (Overall)
SELECT 
    ROUND(AVG(weekly_work_hours), 2) AS avg_weekly_hours,
    ROUND(AVG(weekly_overtime_hours), 2) AS avg_overtime_hours
FROM employee_survey;

-- 5b. Average Weekly Hours by Industry
SELECT 
    industry,
    ROUND(AVG(weekly_work_hours), 2) AS avg_weekly_hours,
    ROUND(AVG(weekly_overtime_hours), 2) AS avg_overtime_hours
FROM employee_survey
GROUP BY industry
ORDER BY avg_weekly_hours DESC;


-- 6. Top 10 Highest Burnout Industries
SELECT 
    industry,
    ROUND(AVG(burnout_risk_score), 2) AS avg_burnout
FROM employee_survey
GROUP BY industry
ORDER BY avg_burnout DESC
LIMIT 10;


-- 7. Employee Count per Work Model
SELECT 
    work_model,
    COUNT(*) AS employee_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employee_survey), 2) AS percentage
FROM employee_survey
GROUP BY work_model
ORDER BY employee_count DESC;


-- 8. Burnout vs Intention to Leave
SELECT 
    intention_to_leave,
    ROUND(AVG(burnout_risk_score), 2) AS avg_burnout,
    COUNT(*) AS employee_count
FROM employee_survey
GROUP BY intention_to_leave
ORDER BY avg_burnout DESC;


-- 9. BONUS: Industry Risk Ranking (CTE + Window Function)
WITH industry_stats AS (
    SELECT 
        industry,
        ROUND(AVG(burnout_risk_score), 2) AS avg_burnout,
        ROUND(AVG(weekly_overtime_hours), 2) AS avg_overtime,
        COUNT(*) AS employee_count
    FROM employee_survey
    GROUP BY industry
)
SELECT 
    industry,
    avg_burnout,
    avg_overtime,
    employee_count,
    RANK() OVER (ORDER BY avg_burnout DESC) AS burnout_rank,
    CASE 
        WHEN avg_burnout >= 4.5 THEN 'High Risk'
        WHEN avg_burnout >= 3.5 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM industry_stats
ORDER BY avg_burnout DESC;
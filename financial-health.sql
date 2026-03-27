-- Calculate debt-to-income ratios and identify high-risk customers.
SELECT
    COUNT(*) AS total_users,
    SUM(CASE WHEN (total_debt::numeric / NULLIF(yearly_income::numeric, 0)) > 0.5 THEN 1 ELSE 0 END) AS high_risk_count,
    ROUND(100.0 * SUM(CASE WHEN (total_debt::numeric / NULLIF(yearly_income::numeric, 0)) > 0.5 THEN 1 ELSE 0 END) 
        / COUNT(*), 2) AS high_risk_percentage
FROM users_data;

SELECT 
    yearly_income,
    total_debt,
    round(total_debt::numeric / NULLIF(yearly_income::numeric, 0),2) AS dti_ratio,
    CASE 
        WHEN (total_debt::numeric / NULLIF(yearly_income::numeric, 0)) >= 1.0 THEN 'Critical'
        WHEN (total_debt::numeric / NULLIF(yearly_income::numeric, 0)) >= 0.5 THEN 'High Risk'
        WHEN (total_debt::numeric / NULLIF(yearly_income::numeric, 0)) >= 0.35 THEN 'Moderate'
        ELSE 'Low Risk'
    END AS risk_level
FROM users_data
ORDER BY dti_ratio DESC;

--kpis
 --income
SELECT AVG(yearly_income) AS avg_annual_income, 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY yearly_income) AS median_income,
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY yearly_income) AS p25_income,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY yearly_income) AS p75_income,
  PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY yearly_income) AS p90_income
from users_data;

 --debt
SELECT AVG(total_debt) AS avg_total_debt, 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total_debt) AS median_debt,
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_debt) AS p25_debt,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_debt) AS p75_debt,
  PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY total_debt) AS p90_debt
from users_data;

--income index
SELECT
  AVG(yearly_income/ nullif(per_capita_income,0)) AS avg_income_index
FROM users_data;


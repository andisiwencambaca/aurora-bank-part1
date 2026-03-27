-- Credit Score Analysis: Explore the distribution of credit scores and 
-- the factors influencing them (e.g., income, debt, age).
SELECT
  id,
  credit_score,
  CASE
    WHEN credit_score < 580 THEN 'Poor'
    WHEN credit_score < 670 THEN 'Fair'
    WHEN credit_score < 740 THEN 'Good'
    ELSE 'Excellent'
  END AS credit_tier
from users_data;

select id, credit_score, yearly_income,
  CASE
    WHEN yearly_income < 30000 THEN 'Low'
    WHEN yearly_income < 70000 THEN 'Medium'
    ELSE 'High'
  END AS income_band
 from users_data;

select id, credit_score, total_debt,
  CASE
    WHEN total_debt < 5000 THEN 'Low'
    WHEN total_debt < 20000 THEN 'Medium'
    ELSE 'High'
  END AS debt_band
from users_data;

select id, credit_score,
CASE
    WHEN credit_score < 580 AND total_debt > 20000 THEN 'High Risk'
    WHEN credit_score < 670 THEN 'Moderate Risk'
    ELSE 'Low Risk'
  END AS risk_flag
from users_data;

SELECT
  CORR(credit_score, yearly_income) AS income_corr,
  CORR(credit_score, total_debt) AS debt_corr,
  CORR(credit_score, current_age) AS age_corr
FROM users_data;

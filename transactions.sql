--card usage trends by demographic
SELECT merchant_city, merchant_state, zip,
    SUM(amount) AS total_city_spend
FROM
    transactions_data td 
where  td.merchant_city != 'ONLINE'
GROUP by merchant_city, merchant_state, zip 
ORDER by total_city_spend  desc
limit 5;

SELECT  EXTRACT(YEAR FROM date) AS year,
        EXTRACT(QUARTER FROM date) AS quarter,
        COUNT(amount) AS number_of_transactions
FROM transactions_data
GROUP BY EXTRACT(YEAR FROM date), EXTRACT(QUARTER FROM date)
ORDER BY EXTRACT(YEAR FROM date) ASC, EXTRACT(QUARTER FROM date);

SELECT
  daily,
  card_type,
  SUM(daily_total) OVER (
    PARTITION BY card_type
    ORDER BY daily
  ) AS transaction_running_total
FROM (
  SELECT
    td.date::date AS daily,
    cd.card_type,
    SUM(td.amount) AS daily_total
  FROM transactions_data td
  JOIN cards_data cd
    ON td.card_id = cd.id
  WHERE td.date >= '2024-09-30'
    AND td.date <= '2024-10-31'
  GROUP BY td.date::date, cd.card_type
) t
ORDER BY daily;

SELECT
  daily,
  daily_sum,
  daily_sum - LAG(daily_sum) OVER (ORDER BY daily) AS daily_difference
FROM (
  SELECT
    td.date::date AS daily,
    SUM(amount) AS daily_sum
  FROM transactions_data td
  GROUP BY td.date::date
) sums
ORDER BY daily;

select case when td.merchant_city ='ONLINE' then 'Online' else 'Offline' end as location_type,
sum(amount) as transaction_value,
count(*) as volume
FROM transactions_data td
group by location_type 



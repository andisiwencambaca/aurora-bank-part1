--Assess the number of credit/debit cards per customer.
select ud.id, gender, current_age, latitude, longitude, card_type, ud.num_credit_cards 
from users_data as ud
join cards_data as cd
on ud.id = cd.client_id
join transactions_data td 
on ud.id = td.client_id
where latitude is not null;

select gender, sum(num_credit_cards) total_by_gender
from users_data
group by gender;

select gender, card_type, count(*) as total_cards
from users_data as ud
join cards_data as cd
on ud.id = cd.client_id
group by gender, card_type
order by gender;

SELECT card_brand, card_type, COUNT(*) AS total_cards
FROM cards_data
GROUP BY card_brand, card_type;

with distribution as (
  SELECT client_id, COUNT(*) AS cards_per_user
  FROM cards_data
  GROUP BY client_id
)
SELECT
  cards_per_user,
  COUNT(*) AS users
FROM distribution
GROUP BY cards_per_user
ORDER BY cards_per_user;


-- Customer Demographics: Analyse the age, gender, and geographical distribution of customers.

--KPIs
select count(*) as total_clients
from users_data;

select gender, count(*) total_clients
from users_data
group by gender; 

--distribution
select current_age,count(*) as total_clients
from users_data
group by current_age 
order by current_age;

select gender, current_age, count(*) total_clients
from users_data
group by gender, current_age
order by current_age;

select latitude, longitude,count(*) as total_clients
from users_data
where latitude is not null
group by latitude, longitude;



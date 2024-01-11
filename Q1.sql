select * from cars;
select * from salespersons;
select * from sales
where year(purchase_date) = '2022';

-- 1. What are the details of all cars purchased in the year 2022? 
select c.car_id,c.make,c.type,c.style,c.cost_$
from cars c
join sales s
on c.car_id = s.car_id
where year(purchase_date) = '2022';
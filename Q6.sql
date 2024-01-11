select * from cars;
select * from salespersons;
select * from sales
where salesman_id = 2 and year(purchase_date) = 2021;

--  6. What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?

with CTE1 as
(
select sp.name, year(s.purchase_date) as year_2021,s.salesman_id,c.car_id
from salespersons sp
join sales s
on sp.salesman_id = s.salesman_id
join cars c
on s.car_id = c.car_id
where sp.name = 'Emily Wong' and year(s.purchase_date) = 2021
)
select name, year_2021,c.car_id,c.make,c.type,c.style,c.cost_$
from CTE1
join cars c
on CTE1.car_id = c.car_id;
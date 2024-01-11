select * from cars;
select * from salespersons;
select * from sales
where year(purchase_date) = 2022;


-- 10. What is the name and age of the salesperson who generated the highest revenue in the year 2022?

with revenue as
(
select sp.name, sp.age, c.cost_$
from salespersons sp
join sales s
on sp.salesman_id = s.salesman_id
join cars c
on s.car_id = c.car_id
where year(purchase_date) = 2022
),
CTE2 as
(
select name, age, sum(cost_$) as highest_in_2022
from revenue
group by name,age
)
select name, age 
from CTE2
where highest_in_2022 = 
( select max(highest_in_2022) from CTE2);

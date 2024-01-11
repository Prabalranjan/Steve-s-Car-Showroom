select * from cars;
select * from salespersons;
select * from sales;

-- 3. What is the total revenue generated by each salesperson?
with CTE1 as
(select  sp.salesman_id, sp.name, s.car_id, c.cost_$
from sales s
join salespersons sp 
on s.salesman_id = sp.salesman_id
join cars c
on s.car_id = c.car_id)
select salesman_id,name, sum(cost_$) as Total_Revenue
from CTE1
group by name,salesman_id
order by Total_Revenue desc;
select * from cars;
select * from salespersons;
select * from sales;

-- 4. What are the details of the cars sold by each salesperson? 
with CTE1 as
(
select s.salesman_id, c.car_id
from sales s
join cars c
on s.car_id = c.car_id
order by s.salesman_id
)
select CT.salesman_id, CT.car_id, c.make, c.type, c.style, c.cost_$
from CTE1 CT
join cars c
on CT.car_id = c.car_id
order by CT.salesman_id;
 


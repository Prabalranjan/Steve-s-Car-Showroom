select * from cars;
select * from salespersons;
select * from sales;

-- 9. What is the name and city of the salesperson who sold the most number of cars in the year 2023?
 with CTE1 as 
 (
 select s.salesman_id, s.car_id, year(s.purchase_date) as sale, sp.name, sp.city,
dense_rank() over(order by s.salesman_id) as row_rank
 from sales s
 join salespersons sp
 on s.salesman_id  = sp.salesman_id
 where year(s.purchase_date) = 2023
 ),
CTE2 as
(
select cte1.name, city, count(row_rank) as highest_number_of_cars
from CTE1 cte1
group by name,city
)
select name,city
from CTE2
where highest_number_of_cars = 
(select max(highest_number_of_cars) from CTE2);

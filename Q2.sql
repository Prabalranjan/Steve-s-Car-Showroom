select * from cars;
select * from salespersons;
select * from sales
where salesman_id = 4;

-- 2. What is the total number of cars sold by each salesperson?
select s.salesman_id, sp.name, count(s.sale_id) as total_no_of_sales
from sales s
join salespersons sp
on s.salesman_id = sp.salesman_id
group by s.salesman_id
order by total_no_of_sales desc;

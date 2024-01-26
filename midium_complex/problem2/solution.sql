use sqldb;

select * from customer_orders;

with cte1 as (
select customer_id , min(order_date) as first_day_of_visit
from customer_orders
group by customer_id)
select co.order_date,
sum(case when co.order_date = cte1.first_day_of_visit then 1 else 0 end) first_visit_flag,
sum(case when co.order_date <> cte1.first_day_of_visit then 1 else 0 end) repeat_visit_flag
from customer_orders co
join cte1 
on co.customer_id = cte1.customer_id
group by co.order_date
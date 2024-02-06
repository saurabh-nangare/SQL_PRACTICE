SELECT * from sales;

with cte1 as(
select min(period_start) dates, max(period_end) max_dates from sales
union all
select DATEADD(DAY,1,dates) as dates, max_dates from cte1 where DATEADD(DAY,1,dates) <= max_dates
)select s.product_id, YEAR(dates) as years, sum(s.average_daily_sales) as total_sales
from cte1
join sales s 
on cte1.dates BETWEEN s.period_start and s.period_end
group by s.product_id, YEAR(dates)
order by s.product_id, YEAR(dates)
option(maxrecursion 1000);
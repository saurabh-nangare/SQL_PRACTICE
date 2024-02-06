select * from job_positions;
select * from job_employees;

with cte1 as(
    select id, title, groups, levels, payscale, totalpost, 1 as rn from job_positions
    union all
    select id, title, groups, levels, payscale, totalpost, rn+1 from cte1
    where rn+1 <= totalpost
),
cte2 as (
SELECT *, ROW_NUMBER() over(partition by position_id order by id) rn
from job_employees
)
select cte1.title, cte1.groups,cte1.levels,cte1.payscale,coalesce(cte2.name,'Vacant') as name
from cte1
left join cte2 
on cte1.id = cte2.position_id and cte1.rn = cte2.rn
order by cte1.groups;




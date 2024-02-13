create table hospital ( emp_id int
, action varchar(10)
, time datetime);

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

select *,(select max(time) 
from hospital) as max_time 
from hospital
where [action] = 'in';
select *,(select max(time) 
from hospital) as max_time 
from hospital
where [action] = 'in';

with cte1 as(
SELECT *,MAX(time) OVER (PARTITION BY emp_id  ORDER BY time) AS max_time
FROM hospital)
select * from cte1 where time >= max_time;

select * from hospital;


SELECT 
    *,
    max(time) OVER (PARTITION BY emp_id) AS max_time
FROM 
    hospital ;

--solution 1

with cte1 as(
select emp_id, MAX(time) as max_time
from hospital
group by emp_id
)
select hospital.* , cte1.max_time
from hospital
join cte1
on hospital.emp_id = cte1.emp_id
where hospital.time >= cte1.max_time and [action] = 'in'

--solution2
SELECT emp_id,
max(case when action = 'in' then time end) in_time,
max(case when action = 'out' then time end) out_time
from hospital
group by emp_id
having max(case when action = 'in' then time end) > max(case when action = 'out' then time end) 
or max(case when action = 'out' then time end)  is null;


--solution3
with cte1 as
(
select emp_id,action, max(time) as max_in_time from hospital where [action] = 'in' group by  emp_id,action ),
cte2 as(
select emp_id,action, max(time) max_out_time from hospital where [action] = 'out' group by  emp_id,action )
select cte1.emp_id, cte1.[action] 
from cte1 
full outer join cte2
on cte1.emp_id = cte2.emp_id
where max_in_time >= max_out_time or max_out_time is null;

select * from hospital;
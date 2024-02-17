create table employee 
(
emp_name varchar(10),
dep_id int,
salary int
);
delete from employee;
insert into employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);

select * from (
select * , DENSE_RANK() over(partition by dep_id order by salary) drnk
from employee) a 
where a.drnk = 1;

select * from employee where (dep_id, salary) in (

select dep_id, min(salary) as min_salary 
from employee
group by dep_id);

with cte1 as (
select dep_id, min(salary) as min_salary 
from employee
group by dep_id)
select *
from employee e 
join cte1 
on e.dep_id = cte1.dep_id and e.salary = cte1.min_salary

with cte1 as (
select dep_id, min(salary) min_salary
from employee
group by dep_id)
SELECT *
from employee e
join cte1
on e.dep_id = cte1.dep_id and e.salary = cte1.min_salary


create table sample1(
    name VARCHAR(10)
);

insert into sample1 VALUEs ('aaa');
insert into sample1 VALUEs ('');
insert into sample1 VALUEs (null);

insert into sample1 VALUEs (' ');

select * from sample1;


select *
from 
sample1 a 
left join sample1 b
on a.id = b.id


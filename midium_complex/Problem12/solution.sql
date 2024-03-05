Drop table if EXISTS employee;
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employee (employee_id, name, manager_id, salary)
VALUES 
    (3, 'Mila', 9, 60301),
    (12, 'Antonella', NULL, 31000),
    (13, 'Emery', NULL, 67084),
    (1, 'Kalel', 11, 21241),
    (9, 'Mikaela', NULL, 50937),
    (11, 'Joziah', 6, 28485);


select * from employee;


SELECT e1.employee_id
from employee e1 
left join employee e2 
on e1.manager_id = e2.employee_id
where e2.employee_id is null and e1.manager_id is not null  and e1.salary < 30000
order by e1.employee_id;


select *,
sum(salary) over(order by employee_id) from employee





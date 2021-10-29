-- Homework 1 --

-- Task 1 --
select   e1.name,
    e1.salary as employee_salary,
    e2.salary as chief_salary,
    d.name
from employee as e1
left join employee as e2 on e1.chief_id = e2.id
join department d on d.id = e1.department_id
where e1.salary > e2.salary
limit 10;

-- Task 2 --

select a.*
from   employee a
where  a.salary =
       (
    select max(salary)
    from employee b
    where  b.department_id = a.department_id
    limit 10
           );

-- Task 3 --

select department_id
from   employee e
group  by department_id
having count(*) <= 3
limit 10;

-- Task 4 --

select e1.*
from   employee e1
left join employee e2
on (e2.id = e1.chief_id and e2.department_id = e1.department_id)
where e2.id is null
limit 10;

-- Task 5 --

with salary as
    (
    select department_id,
    sum(salary) salary
    from employee
    group by department_id
    )
select department_id
from   salary s
where  s.salary =
    (
    select max(salary)
    from salary
    )
limit 10;
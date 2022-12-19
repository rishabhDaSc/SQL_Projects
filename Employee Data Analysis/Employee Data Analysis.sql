use sql_basics;

-- Write a query to create an employee table with the fields employee id, first name, last name, job id, salary, manager id, and department id.
create table employee(
id int not null,
f_name varchar(20) not null,
l_name varchar(20) not null,
job varchar(20) not null,
salary int not null,
manager_id int not null,
dept_id int null null);

-- Write a query to insert values into the employee table.
insert into employee values
(101,'ankit','jain','HP124',200000,2,24),
(102,'sarvesh','patel','HP123',150000,2,24),
(103,'krishna','gee','HP125',500000,5,44),
(104,'rana','gee','HP122',250000,3,54),
(105,'soniya','jain','HP121',400000,1,22),
(106,'nithin','kumar','HP120',300000,4,34),
(107,'karan','patel','HP126',300001,2,34),
(108,'shilpa','jain','HP127',300001,5,24),
(109,'mukesh','singh','HP128',300001,4,44);

-- Write a query to find the first name and salary of the employee 
-- whose salary is higher than the employee with the last name Kumar from the employee table.
select upper(f_name) First_name,salary from employee where salary > (select salary from employee where l_name = 'kumar');

-- Write a query to display the employee id and last name of the employee 
-- whose salary is greater than the average salary from the employee table.
select id,upper(l_name) Last_name from employee where salary > (select avg(salary) from employee);

-- Write a query to display the employee id, first name, and salary of the employees who earn a 
-- salary that is higher than the salary of all the shipping clerks (JOB_ID = HP122). 
-- Sort the results of the salary in ascending order.
select id,upper(f_name) First_name,salary
from employee where salary > (select salary from employee where job = 'HP122') order by salary;

-- Write a query to display the first name, employee id, and salary of the first three employees with highest salaries.
select concat(upper(substring(f_name,1,1)),lower(substring(f_name,2))) Name,id,salary 
from employee where salary >= (select salary from employee order by salary desc limit 1 offset 3);

-- Write query to display number different dept
select count(distinct(dept_id)) number_of_dept from employee;
select dept_id,count(dept_id) count from employee group by dept_id order by count(dept_id);
use sql_basics;
-- Write a query to create a students table with appropriate data types 
-- for student id, student first name, student last name, class, and age 
-- where the student last name, student first name, and student id should be a NOT NULL constraint, 
-- and the student id should be in a primary key.
create table students(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
class int,
age int,
primary key (id)
);
select * from students;
-- Write a query to create a marksheet table that includes score, year, ranking, class, and student id.
create table marksheet(
score int,
year int,
ranking int,
class int,
id int
);
select * from marksheet;
-- Write a query to insert values in students and marksheet tables.
insert into students values 
(1,'krishna','gee',10,18),
(2,'Stephen','Christ',10,17),
(3,'Kailash','kumar',10,18),
(4,'ashish','jain',10,16),
(5,'khusbu','jain',10,17),
(6,'madhan','lal',10,16),
(7,'saurab','kothari',10,15),
(8,'vinesh','roy',10,14),
(9,'rishika','r',10,15),
(10,'sara','rayan',10,16),
(11,'rosy','kumar',10,16);

insert into marksheet values
(989,2014,10,1,1),
(454,2014,10,10,2),
(880,2014,10,4,3),
(870,2014,10,5,4),
(720,2014,10,7,5),
(670,2014,10,8,6),
(900,2014,10,3,7),
(540,2014,10,9,8),
(801,2014,10,6,9),
(420,2014,10,11,10),
(970,2014,10,2,11),
(720,2014,10,12,12);

-- Write a query to display student id and student first name from the student table 
-- if the age is greater than or equal to 16 and the student's last name is Kumar.
select id,first_name from students where age >= 16 and last_name = 'kumar';

-- Write a query to display all the details from the marksheet table if the score is between 800 and 1000.
select * from marksheet where score between 800 and 1000;

-- Write a query to display the marksheet details from the marksheet table by adding 5 to the score and by naming the column as new score.
alter table marksheet 
add column new_score int
generated always as (score + 5) stored;

-- Write a query to display the marksheet table in descending order of the  score.
select * from marksheet order by score DESC;

-- Write a query to display details of the students whose first name starts with a.
select * from students where first_name like 'a%';

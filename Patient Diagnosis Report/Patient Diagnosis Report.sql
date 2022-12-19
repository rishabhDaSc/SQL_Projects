use sql_basics;
-- Write a query to create a patients table with the fields 
-- such as date, patient id, patient name, age, weight, gender, location, phone number, disease, doctor name, and doctor id.
create table patients(
date date,
id varchar(20),
name varchar(20),
age int,
weight int,
gender char(10),
location varchar(20),
phone_no int,
disease varchar(20),
doctor_name varchar(20),
doctor_id int
);

-- Write a query to insert values into the patients table.
insert into patients values
('2019-06-15','AP2021','Sarath',67,76,'Male','chennai',5462829,'Cardiac','Mohan',21),
('2019-02-13','AP2022','John',62,80,'Male','banglore',1234731,'Cancer','Suraj',22),
('2018-01-08','AP2023','Henry',43,65,'Male','Kerala',9028320,'Liver','Mehta',23),
('2020-02-04','AP2024','Carl',56,72,'Female','Mumbai',9293829,'Asthma','Karthik',24),
('2017-09-15','AP2025','Shikar',55,71,'Male','Delhi',7821281,'Cardiac','Mohan',21),
('2018-07-22','AP2026','Piysuh',47,59,'Male','Haryana',8912819,'Cancer','Suraj',22),
('2017-03-25','AP2027','Stephen',69,55,'Male','Gujarat',8888211,'Liver','Mehta',23),
('2019-04-22','AP2028','Aaron',75,53,'Male','Banglore',9012192,'Asthma','Karthik',24);

-- Write a query to display the total number of patients in the table.
select count(name) as `total number of patients` from patients;

-- Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.
select id,name,gender,disease,age from patients order by age desc limit 1;

-- Write a query to display patient id and patient name with the current date.
select id,name,curdate() as `current_date` from patients;

-- Write a query to display the old patient’s name and new patient's name in uppercase.
select upper(name) as new_patient_name,date from patients order by date desc limit 1;
select upper(name) as old_patient_name,date from patients order by date limit 1;

-- Write a query to display the patient’s name along with the length of their name.
select name,length(name) as name_lenght from patients; 

-- Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F.
select name,Left(gender,1) as Gender from patients;

-- Write a query to combine the names of the patient and the doctor in a new column. 
alter table patients add patient_doctor varchar(20) as (concat_ws('-',name,doctor_name));
select name,doctor_name,patient_doctor from patients;

-- Write a query to display the patients’ age along with the logarithmic value (base 10) of their age.
select name,age,log10(age) log_base_10 from patients;

-- Write a query to extract the year from the given date in a separate column.
select date,year(date) `year` from patients;

-- Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.
select nullif(name,doctor_name) from patients;

-- Write a query to return Yes if the patient’s age is greater than 40 else return No.
select age,if(age > 40,'Yes','No') as above40 from patients;

-- Write a query to display the doctor’s duplicate name from the table.
select doctor_name,count(doctor_name) count from patients group by doctor_name having count(doctor_name)>1;

-- Write a query to display patients from banglore
select * from patients where location = 'banglore';

-- Write a query to display number of patients with similar disease
select disease,count(disease) num_of_patients from patients group by disease;

-- write a query to display patients with weight less then 60
select * from patients where weight < 60;

-- write a query with number each year
select year(date) year,count(year(date)) as num_of_patients from patients group by year(date) order by year(date);
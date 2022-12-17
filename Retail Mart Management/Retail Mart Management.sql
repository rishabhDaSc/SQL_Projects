-- Write a query to create a database named SQL basics.
Create Database SQL_basics;
-- Write a query to select the database SQL basics. 
use SQL_Basics;
-- Write a query to create a 
-- product table with fields as product code, product name, price, stock and category, 
-- customer table with the fields as customer id, customer name, customer location, and customer phone number and, 
-- sales table with the fields as date, order number, product code, product name, quantity, and price.
 create table product_table(
p_code int,
p_name varchar(20),
price int,
stock int,
category varchar(20)
 );
create table customer_table(
c_id int,
c_name varchar(20),
c_location varchar(20),
c_phone_num	int
);
create table sales_table(
date date,
order_no varchar(10),
c_id int,
c_name varchar(20),
s_code int,
p_name varchar(20),
quantity int,
price int
);

-- Write a query to insert values into the tables.
insert into product_table values (1,'tulip',198,5,'perfume'),
(2,'cornoto',50,21,'icecream'),
(3,'Pen',10,52,'Stationary'),
(4,'Lays',10,20,'snacks'),
(5,'mayanoise',90,10,'dip'),
(6,'jam',105,10,'spread'),
(7,'shampoo',5,90,'hair product'),
(8,'axe',210,4,'perfume'),
(9,'park avenue',901,2,'perfume'),
(10,'wattagirl',201,3,'perfume'),
(11,'pencil',4,10,'Stationary'),
(12,'sharpener',5,90,'Stationary'),
(13,'sketch pen',30,10,'Stationary'),
(14,'tape',15,30,'Stationary'),
(15,'paint',60,12,'Stationary'),
(16,'chocolate',25,50,'snacks'),
(17,'biscuts',60,26,'snacks'),
(18,'mango',100,21,'fruits'),
(19,'apple',120,9,'fruits'),
(20,'kiwi',140,4,'fruits'),
(21,'carrot',35,12,'vegetable'),
(22,'onion',22,38,'vegetable'),
(23,'tomato',21,15,'vegetable'),
(24,'serum',90,4,'hair product'),
(25,'conditioner',200,5,'hair product'),
(26,'oil bottle',40,2,'kitchen utensil');

Insert into sales_table values ('2016-07-24','HM06',9212,'Jessica',11,'pencil',3,30),
('2016-07-19','HM09',3921,'Mukesh',17,'biscuits',10,600),
('2016-10-30','HM10',9875,'Stephen',2,'cornoto',10,500),
('2018-04-12','HM03',1212,'Oliver',20,'kiwi',3,420),
('2018-05-02','HM05',1910,'Mohan',20,'kiwi',2,280),
('2018-09-20','HM08',5334,'Chirsty',16,'chocolate',2,50),
('2019-01-11','HM07',1246,'Vignesh',19,'apple',5,600),
('2019-03-15','HM01',1910,'Mohan',5,'mayanoise',4,360),
('2021-02-10','HM04',1111,'Nisha',25,'conditioner',5,1000),
('2021-02-12','HM02',2123,'Biyush',3,'Pen',2,20);


insert into customer_table values
(1111,'Nisha','kerala',8392320),
(1212,'Oliver','kerala',4353891),
(1216,'Nila','delhi',3323242),
(1246,'Vignesh','chennai',1111212),
(1313,'shiny','Maharastra',5454543),
(1910,'Mohan','mumbai',9023941),
(2123,'Biyush','Bombay',1253358),
(3452,'Alexander','West Bengal',1212134),
(3921,'Mukesh','Manipur',4232321),
(5334,'Christy','pakistan',2311111),
(9021,'Rithika','Kashmir',1121344),
(9212,'Jessica','banglore',1233435),
(9875,'Stephen','chennai',1212133);

-- Write a query to add two new columns such as S_no and categories to the sales table.
alter table sales_table
add S_no int,
add categories varchar(20);

-- Write a query to change the column type of stock in the product table to varchar.
alter table product_table
modify stock varchar(20);

-- Write a query to change the table name from customer-to-customer details.
rename table customer_table to customer_details;

-- Write a query to drop the columns S_no and categories from the sales table.
alter table sales_table
drop column S_no,
drop column categories;

-- Write a query to display order id, customer id, order date, price, and quantity from the sales table.
select order_no,c_id,date,price,quantity from sales_table;

-- Write a query to display all the details in the product table if the category is stationary.
select * from product_table where category = 'stationary';

-- Write a query to display a unique category from the product table.
select distinct category from product_table;

-- Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.
select * from sales_table where quantity > 2 and price < 500;

-- Write a query to display the customer’s name if the name ends with a.
select c_name from customer_details where c_name like '%a';

-- Write a query to display the product details in descending order of the price.
select * from product_table order by price DESC;

-- Write a query to display the product code and category from similar categories that are greater than or equal to 2.
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT p_code,category FROM product_table GROUP BY category HAVING COUNT(category)>=2;


-- Write a query to display the order number and the customer name to combine the results of the order 
-- and the customer tables including duplicate rows.
select order_no,c_name from sales_table left join product_table on sales_table.s_code = product_table.p_code
union all
select order_no,c_name from sales_table right join product_table on sales_table.s_code = product_table.p_code;
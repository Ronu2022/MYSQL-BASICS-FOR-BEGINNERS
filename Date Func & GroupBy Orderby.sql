CREATE DATABASE ineuron_Sales;
USE ineuron_Sales;

DROP TABLE sales1;

CREATE TABLE sales1 
(
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL /* Here 38 is the lnght of the integer before decimal, and 0 is the  length after decimal*/
) ;


-----------------------------------------------------------------------------------------------------------------------------------------------------
SET SESSION sql_mode = '' ; /* USED SO THAT IF THERE IS ANY ERROR IN ANY OF THE DATA SQL CAN AUTO ADJUST IT*/
-----------------------------------------------------------------------------------------------------------------------------------------------------


show global variables like 'local_infile';
set global local_infile = 1; 


load data  infile 'D:/files/sales_data_final.csv'
into table sales1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;




SELECT * FROM sales1; /* Observe here the Date coloumn is in MM,DAY, YEar format*/



SET SQL_SAFE_UPDATES = 0;




/* VARCHAR -> (Variable-Length Character String) -> VARCHAR(10) -> 10 is the maximum Length -> sol let's say you put 'ABC' in it - it would store just ABC
(no extra Space). 

/*CHAR -> fixed-size box where you always allocate a specific amount of space, regardless of what you put in it.*/
/*CHAR(5) -> and you store 'abc' - it is stored by abc followed by 2 spaces*/

/*String : Sequence of Characters. Sequence of Collection of Characters*/
/*Characters : Basic unit of Text - can include letters, numbers, symbols, spaces, and other special characters.*/

/* "Hello, World!" is a string.*/ 
/* "12345" is a string of numeric characters.*/ 
/*"abc123" is a string that includes both letters and numbers.*/

----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                         /* TOPIC 1 : STR_TO_DATE*/
----------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT str_to_date (order_date, '%m/%d/%Y')FROM sales1 /*Change the string format to date format-- but here we have just selected , what if we want to add a colum and put the changed formt of days in it*/

/*(HERE %m/%d/%Y or %Y/%m/%d would depend on the entries in order_date column and based on that the str_to_date func would work)*/

SELECT str_to_date(order_date, '%m/%d/%Y') FROM sales1;





/* DATE_FORMAT() - used to format a date into a specific string format.*/

SELECT DATE_FORMAT('2023-10-12', '%d-%m-%Y'); /*Check for Output*/ 
SELECT date_format('2023-10-13', '%d/%m/%Y'); 


/* takes a date and a format string as arguments and returns a formatted date string based on the provided format.*/
/* In str_to_date - the format was based on the format of the entries, but here it is the format that you want*/ 

SELECT date_format('2023-11-10', '%d-%m-%Y') ;



select date_format(current_date(),'%d/%m/%Y');

----------------------------------------------------------------------------------------------------------------------------------------------------------


select to_varchar(current_date(),'DD-MM-YYYY'); -- (SNOWFLAKE) but, it is in varchar format



----------------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------------
                                      /*TOPIC 2 : ALTER TABLE; ADD COLUMN; DATE AFTER; UPDATE*/
----------------------------------------------------------------------------------------------------------------------------------------------------------



ALTER TABLE sales1  -- adding new column => alter table
ADD COLUMN order_date_new DATE AFTER order_date; /*Here DATE - is the Data type*/



SELECT * FROM sales1;

UPDATE sales1 -- populating the new column =>update
SET order_date_new = str_to_date (order_date, '%m/%d/%Y');





ALTER TABLE xyg 
ADD COLUMN a DATE AFTER order_date; 



SELECT * FROM sales1

ALTER TABLE sales1
ADD COLUMN ship_date_new DATE AFTER ship_date

UPDATE sales1
SET ship_date_new = str_to_date (ship_date,'%m/%d/%Y')

Select * from sales1

select * from sales1 where ship_date_new = '2011-01-05'
select * from sales1 where ship_date_new > '2011-01-05'
select * from sales1 where ship_date_new < '2011-01-05'
select * from sales1 where ship_date_new between '2011-01-06' and '2011-08-25'

 Select * from sales1






SELECT * FROM sales1 WHERE country <> 'Hungary';  /* <> is Not equals to ; you could also use != */
SELECT * FROM sales1 WHERE country != 'Hungary';


SELECT * FROM sales1 WHERE country IN ('sweden','Australia', 'New Zealand'); 

SELECT * FROM sales1 WHERE country NOT IN ('sweden','Australia', 'New Zealand'); 


----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            /* SOME MORE STRING RELATED FUNCTIONS*/
----------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                /*CONCAT()*/
----------------------------------------------------------------------------------------------------------------------------------------------------------

/*used to concatenate (join together) two or more strings into a single string.*/

SELECT CONCAT('Hello', ' ', 'World') AS concatenated_string; 

SELECT CONCAT('Hello','World') AS concatenated_string;

SELECT CONCAT('hey', '' , 'there') AS concatenated_string;

SELECT CONCAT('HEY', ' ', 'there') ; 

SELECT CONCAT('Hey', ' ', 'how', ' ', 'are', ' ', 'you''?'); 


select concat('Hey', ' ', 'world'); 
select concat('Hey','world'); 




/* SUBSTRING()*/

/* used to extract a portion of a string. 
It takes three arguments: the string in its extract from, the starting position, and the length of the substring to extract.*/

SELECT SUBSTRING('OpenAI', 2, 3) AS extracted_substring; /* 2 is 2nd position - 1 is A here, 3 is the length of the Character required*/

SELECT SUBSTRING('HELLO WORLD', 2,6);  /* 2 is the position, in MYSQL it starts with 1 here, 2 6 is the total characters all inclusive*/ 

SELECT SUBSTRING('I AM AN ENGINEER', 3,6); 

SELECT CONCAT('HELLO', ' ', 'WORLD!'); 

SELECT SUBSTRING(CONCAT('HELLO', ' ', 'WORLD!'), 2,6); 

select substring('ARE YOU READY', 1,3); 

select CONCAT(substring('ARE YOU READY', 1, 7));







----------------------------------------------------------------------------------------------------------------------------------------------------------
                                       /* TOPIC 3: NOW(); YEAR; CURDATE(); DATE_SUB() ;  DAYNAME()  */
----------------------------------------------------------------------------------------------------------------------------------------------------------
 
SELECT NOW(); /*Gives the current Date and Time of the system*/
SELECT CURDATE();/*Gives the current Date */
SELECT YEAR(NOW());
SELECT YEAR(CURDATE()); 
SELECT DAYNAME(NOW());
SELECT DAYOFWEEK(NOW()); 








/*Let's say we are to find last week's data so it has to be substracted from the Currrent Date*/

SELECT DATE_SUB(NOW(), INTERVAL 1 WEEK);
SELECT DATE_SUB(CURDATE(),INTERVAL 1 WEEK);
 







SELECT NOW(); 

SELECT DATE_SUB(NOW(), INTERVAL 2 DAY); 
SELECT DATE_SUB(CURDATE(), INTERVAL 3 DAY) ; 


/*LET's SAY WE NEED TO FIND RECORDS WHICH HAPPEND before A WEEK's TIME i.e LAST 7 days*/

SELECT * FROM sales1 WHERE ship_date_new < DATE_SUB(NOW(), INTERVAL 1 WEEK);




SELECT * FROM sales1 WHERE ship_date_new > DATE_SUB(NOW(), INTERVAL 1 WEEK);
SELECT * FROM sales1 WHERE ship_date_new = DATE_SUB(NOW(), INTERVAL 1 WEEK);


SELECT DATE_SUB(NOW(), INTERVAL 3 DAY);

SELECT DAYNAME('2022-07-22 21:30:00');




SELECT NOW(); 

SELECT DAYNAME('2023-11-29 03:52:30'); 


/* DATEDIFF() : Returns the difference between two dates.*/ 

SELECT DATEDIFF('2023-10-15', '2023-10-12');




/* DATE_ADD() Adds a specified time interval to a date.*/ 

SELECT DATE_ADD('2023-10-12', INTERVAL 3 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 3 DAY);




SELECT DATE_SUB(NOW(), INTERVAL 1 WEEK);
SELECT DATE_ADD(NOW(), INTERVAL 1 WEEK);
select date_add(current_date(),interval 4 month);
select date_sub(current_date(),interval 4 month);

-----------------------------------------------------------------------------------------------------------------------------------------------------
SELECT ADD_MONTHS(current_date, 4) AS date_after_4months; -- addition of 4 months (SNOWFLAKE)
SELECT ADD_MONTHS(current_date,-4) AS date_beforer_4months; -- substraction of 4 months (SNOWFLAKE)
-----------------------------------------------------------------------------------------------------------------------------------------------------


SELECT DATEDIFF(CURDATE(),DATE_SUB(CURDATE(), INTERVAL 4 DAY)); 











/* EXTRACT(unit FROM date) Extracts a specified part (year, month, day, etc.) from a date.*/

SELECT EXTRACT(YEAR FROM '2023-10-12');
SELECT EXTRACT(YEAR FROM NOW()); 
SELECT EXTRACT(DAY FROM NOW());
SELECT YEAR(NOW()); 

SELECT NOW(); 
SELECT EXTRACT(HOUR FROM NOW()); 
SELECT EXTRACT(MINUTE FROM NOW()); 
SELECT EXTRACT(SECOND FROM NOW()); 
SELECT EXTRACT(HOUR FROM '2023-11-29 04:07:27'); 
SELECT EXTRACT(QUARTER FROM NOW()); 
SELECT EXTRACT(QUARTER FROM CURDATE()); 
SELECT EXTRACT(QUARTER FROM (SELECT CURDATE())) AS extracted_quarter;





------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE date_table 
(
    d DATETIME
);


INSERT INTO date_table (d) VALUES
    ('2024-03-16 12:00:00'),
    ('2024-03-16 13:00:00'),
    ('2024-03-16 14:00:00'),
    ('2024-03-16 15:00:00'),
    ('2024-03-16 16:00:00'),
    ('2024-03-16 17:00:00'),
    ('2024-03-16 18:00:00'),
    ('2024-03-16 19:00:00'),
    ('2024-03-16 20:00:00'),
    ('2024-03-16 21:00:00');


select * from date_table; 

alter table date_table
add column m int; 

select * from date_table; 

update date_table
set m = month(d); 

select * from date_table; 

------------------------------------------------------------------------------------------------------------------------------------------------------






SELECT EXTRACT(QUARTER FROM (SELECT CURDATE());  /*This should have worked but in some MYSQL versions giving an Alias Name to subquery works*/ 
SELECT EXTRACT(QUARTER FROM (SELECT CURDATE());






/* DAYOFWEEK(date) Returns the day of the week as an integer (1 for Sunday, 2 for Monday, and so on).*/

SELECT DAYOFWEEK('2023-10-12');

SELECT DAYNAME('2022-07-22 21:30:00');

SELECT EXTRACT(DAY FROM '2023-10-12');

SELECT DAYOFWEEK(NOW()); 
SELECT EXTRACT(DAY FROM NOW()); 

/* LAST_DAY(date)Returns the last day of the month for the given date.*/

SELECT LAST_DAY('2023-10-12');

SELECT LAST_DAY(NOW()); 

SELECT LAST_DAY(CURDATE()); 
SELECT EXTRACT(DAY FROM LAST_DAY(CURDATE())); 
SELECT EXTRACT(DAY FROM LAST_DAY(CURDATE())); 
SELECT DAYNAME(CURDATE()); 
SELECT DAYNAME(NOW()); 
SELECT DAYOFWEEK(NOW()); 


select last_day(current_date); 
select last_day(curdate());  -- note both curdate() and currebt_date() are same





select datediff('','');
select timestampdiff(day, 'ld','hd');



/* TIMESTAMPDIFF(unit, start_date, end_date) Returns the difference between two date or datetime expressions.*/

SELECT TIMESTAMPDIFF(DAY, '2023-10-12', '2023-10-15');

SELECT TIMESTAMPDIFF(MONTH, '2023-10-12', '2023-10-15');
SELECT TIMESTAMPDIFF(MONTH, '2023-04-12', '2023-10-15');

select datediff('2023-10-15', '2023-10-12');  #Note; datediff would give in days , thatswhere timestampdiff comes in picture

select date_sub(curdate(), interval  3 day);






-------------------------------------------------------------------------------------------------------------------------------------------------------------


/* LETS SAY WE NEED TO ADD A COLUMN WHICH RECORDS THE DATE OF ENTRY*/

ALTER TABLE sales1
ADD COLUMN flag DATE AFTER order_id   

UPDATE sales1
SET flag = NOW()

SELECT * FROM sales1

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   /* PROCEDURE TO CHECK ENTIRE SALES RECORDS BETWEEN DATE RANGE*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------


DELIMITER $$
CREATE PROCEDURE sales_report8(IN d1 DATE, IN d2 DATE) 
BEGIN
SELECT COUNT(*) AS total_orders, SUM(sales) AS total_revenue FROM OCT8 WHERE order_date_new  BETWEEN d1 AND d2; 
END $$

CALL sales_report8('2011-01-01', '2011-02-04');




SELECT * FROM sales1;

DELIMITER $$
CREATE PROCEDURE check_records(IN d1 DATE, IN d2 DATE) 
BEGIN 
SELECT COUNT(*) AS total_records, SUM(sales) AS total_sales FROM sales1 
WHERE ship_date BETWEEN d1 AND d2; 
END $$

CALL check_records('1/6/2011', '1/30/2011');  /*NOT EXECUTED becaues teh dates were in string at present*/ 


DELIMITER $$
CREATE PROCEDURE check_records2(IN d1 DATE, IN d2 DATE) 
BEGIN 
SELECT COUNT(*) AS total_records, SUM(sales) AS total_sales FROM sales1 
WHERE ship_date BETWEEN str_to_date(d1,'%m/%d/%Y') AND str_to_date(d2,'%m/%d/%Y');
END $$

CALL check_records2('1/6/2011', '1/30/2011');  /*not executed because the format of date here is not matching*/ 

DELIMITER $$
CREATE PROCEDURE check_records4(IN d1 VARCHAR(10), IN d2 VARCHAR(10)) 
BEGIN 
    SELECT COUNT(*) AS total_records, SUM(sales) AS total_sales 
    FROM sales1 
    WHERE ship_date BETWEEN str_to_date(d1, '%m/%d/%Y') AND str_to_date(d2, '%m/%d/%Y');
END $$
DELIMITER ;

CALL check_records4('01/06/2011', '01/30/2011'); /*EXECUTED  -> Check the format now matches*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------


/* IF WE WISH TO MODIFY THE YEAR COLUMN - without creating a different column*/

/* In MySQL, you cannot directly change the data type of a column from DECIMAL(10,2) to YEAR without creating a new column. 

This is because DECIMAL and YEAR are different data types and have different storage requirements and representations.

To achieve the desired result, you would need to follow these steps:*/

/*Step 1 - Add a New Column*/

ALTER TABLE your_table
ADD COLUMN new_column YEAR;



/*Step 2- Update the Column*/

/*Update the New Column:

/*You'll need to convert the DECIMAL(10,2) values to a year format. 
How you do this will depend on the specific data in your DECIMAL(10,2) column. 
For example, you might round the decimal value and use it as a year.*/

UPDATE your_table
SET new_column = ROUND(old_decimal_column);

/*--------------------------------------------*/
 UPDATE sales1
 SET orderyear_new = YEAR (order_date_new) /*This is above's example wrt present table*/
/*--------------------------------------------*/

/* Please replace your_table and old_decimal_column with your actual table and column names.*/


/* Step - 3 : Drop the Old Column*/ 

/*Once you've verified that the new column contains the correct data, you can drop the old column.*/

ALTER TABLE your_table
DROP COLUMN old_decimal_column;

/*Again, make sure to replace your_table and old_decimal_column with your actual table and column names.*

/* To rename a column in MySQL, you can use the ALTER TABLE statement with the CHANGE clause. Here's the basic syntax:*/

ALTER TABLE table_name
CHANGE old_column_name new_column_name new_data_type;







/*EXAMPLE*/

ALTER TABLE xyg 
ADD COLUMN Year1 YEAR AFTER year; 

SET SQL_SAFE_UPTDATES = 0;

UPDATE xyg 
SET Year1 = YEAR(`Year`);

ALTER TABLE XYG 
DROP COLUMN `Year`;

ALTER TABLE XYG 
CHANGE year1 `Year` YEAR;

/*OR*/

ALTER TABLE xyg 
ADD COLUMN year1 YEAR AFTER `year`; 


UPDATE xyg 
SET year1 = `year`; 

ALTER TABLE xyg 
DROP COLUMN `year`; 

ALTER TABLE xyg 
CHANGE year1 `year` YEAR; 




-------------------------------------------------------------------------------------------------------------------------------------------------------------
        /* TASK CHECK ORDER_DATE_NEW : CREATE 3 COLOUMNS FOR MONTH , DAY, YEAR, AND TAKE INPUTS FROM ORDER_DATE_NEW AND PLACE IT IN THESE 3 COLUMS*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------


ALTER TABLE sales1
ADD COLUMN year_new INT;

ALTER TABLE sales1
ADD COLUMN month_new INT;

ALTER TABLE sales1
ADD COLUMN day_new INT; 

SELECT * FROM sales1

UPDATE sales1
SET month_new = MONTH(order_date_new) 

SELECT * FROM sales1

UPDATE sales1
SET day_new = DAY(order_date_new)

SELECT * FROM sales1

UPDATE sales1
SET year_new = YEAR(order_date_new)

SELECT * FROM sales1

/* FINDING AVERAGE SALES IN 2011*/

SELECT AVG(sales) FROM sales1 where year_new = 2011 

/* TOPIC 5: GROUP BY*/
/* LETS FIND OUT AVERAGE SALES YEAR WISE*/


SELECT year_new , AVG(sales) FROM sales1 GROUP BY year_new

SELECT ROUND(AVG(sales),2) AS average_sales, year_new FROM sales1 GROUP BY year_new; /*USING Round() Function - 2 is the Place of Decimal*/ 

SELECT year_new, SUM(sales) FROM sales1 GROUP BY year_new

SELECT year_new, MAX(sales) FROM sales1 GROUP BY year_new

SELECT year_new, MIN(sales) FROM sales1 GROUP BY year_new

SELECT month_new, SUM(sales) FROM sales1 GROUP BY month_new

SELECT day_new, SUM(quantity) FROM sales1 GROUP BY day_new

 /*TOPIC 6: ADDITION OF TWO COLUMNS*/
 
 select * from sales1 limit 5
 
 SELECT SUM(discount+shipping_cost) FROM sales1 
 
 SELECT year_new,  SUM(discount+shipping_cost) FROM sales1 GROUP BY year_new
 
 SELECT discount * shipping_cost AS x from sales1; /*Similarly * could be used for Multiplication*/
 
 
select sum(discount+shipping_cost) from sales1; 





 
 
 SELECT year_new,  SUM(discount+shipping_cost) AS CTC FROM sales1  GROUP BY year_new /*ALIAS NAME*/
 /* BUT HERE DISCOUNT IS GIVEN IN PERCENTAGES*/
 
 SELECT year_new, SUM(sales*discount+shipping_cost) AS CTC FROM sales1 GROUP BY year_new
 
 
 SET SESSION sql_mode = '' /*this has to be executed to ensure the below command gets executed once*/
 
 SELECT year_new, ROUND(SUM((sales*discount)+shipping_cost)) AS CTC FROM sales1 GROUP BY year_new
 

-----------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    order_date,
    MONTHNAME(STR_TO_DATE(SUBSTRING_INDEX(order_date, '/', 1), '%m')) AS month_name,
    DAYNAME(STR_TO_DATE(SUBSTRING_INDEX(order_date, '/', 2), '%d')) AS day_name, -- Note substring_index is equivalent to split_part in snowflake
    YEAR(STR_TO_DATE(SUBSTRING_INDEX(order_date, '/', 3), '%Y')) as record_year
FROM sales1;

SELECT 
    order_date,
    MONTHNAME(STR_TO_DATE(SUBSTRING_INDEX(order_date, '/', 1), '%m')) AS month_name, -- Note substring_index is equivalent to split_part in snowflake
    DAYNAME(STR_TO_DATE(order_date,'%m/%d/%Y')) AS day_name, 
    YEAR(STR_TO_DATE(SUBSTRING_INDEX(order_date, '/', 3), '%Y')) as record_year
FROM sales1;
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------

        
 select order_date, str_to_date(order_date,'%m/%d/%Y') AS dated_order_date FROM sales1; 
 


 select curdate();
 select current_date();
 select current_timestamp();
 select now();
 select current_time();
 
 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  /* TOPIC 7: Using IF*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------



 SELECT order_id, IF(discount > 0 , 'no' , 'yes') AS profit FROM sales1
 
 SELECT order_id,discount, IF(discount > 0 , 'no' , 'yes') AS profit FROM sales1
 
 SELECT order_id,discount,product_id, IF(discount > 0 , 'no' , 'yes') AS profit FROM sales1







 SELECT order_id, IF(discount > 0, 'no','yes') AS PROFIT from sales1; 
 
 SELECT * FROM sales1
 
 ALTER TABLE sales1
 ADD COLUMN discount_flag VARCHAR(30)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
 
SELECT count(quantity) FROM sales1 IF (discount > 0) ;  /* WONT WORK, need to use CASE - LEARN AFTER YOU LEARN CASE*/
 
SELECT COUNT(CASE WHEN discount > 0 THEN quantity END) AS discounted_quantity
FROM sales1;





-------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   /*---GROUP BY CLAUSE - INTERVIEW RELATED*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

 
 /*Evaluating Sales Performance*/ 
 
 CREATE TABLE SalesData4
 (
 sales_id VARCHAR(30), 
 revenue_generated DEC(10,2), 
 courses_sold INT, 
 customer_retention_rate DEC(3,0),
 customer_id INT
 )
 
 SET  sql_safe_updates = 0;
 
 INSERT INTO SalesData4 VALUES (101, 5000.23, 30, 80.22, 201),
 (102,6000.24,40,75.62,202), 
 (101, 7000.88, 50, 85.12, 203), 
 (103, 55000.12,35,70.77, 204),
 (102, 6500.44, 45,80.24,205),
 (101, 8000.12, 60, 90.22,206),
 (103, 6000.44, 40, 75.88, 207)
 
 SELECT * FROM SalesData4;
 
 SELECT
 sales_id, SUM(revenue_generated) AS total_revenue, 
 SUM(courses_sold) AS total_course_sold, 
 AVG(customer_retention_rate) AS avg_ret_rate, 
 COUNT(DISTINCT customer_id) AS total_customers, 
 SUM(revenue_generated)/ COUNT(DISTINCT customer_id) AS revenue_per_customer, 
 (SUM(courses_sold)/COUNT(DISTINCT customer_id)*100) AS conversion_rate
 
FROM salesData4 GROUP BY sales_id;







SELECT sales_id, SUM(revenue_generated) AS total_revenue, COUNT(DISTINCT customer_id) AS total_Customers FROM Salesdata4  
GROUP BY sales_id HAVING sales_id > 101;

-------------------------------------------------------------------------------------------------------------------------------------------------------------

 USE Sales;
 
SELECT * FROM sales1
SELECT  state, country , SUM(sales) AS total_sales FROM sales1 GROUP BY state,country
SELECT  state, country , SUM(sales) AS total_sales FROM sales1 GROUP BY country
SELECT  state, country , SUM(sales) AS total_sales FROM sales1 GROUP BY state

SELECT  country, state , SUM(sales) AS total_sales FROM sales1 GROUP BY country ORDER BY country asc
SELECT state, country , SUM(sales) AS total_sales FROM sales1 GROUP BY state ORDER BY state asc

SELECT country,state, SUM(sales) AS total_sales FROM sales1 GROUP BY country,state ORDER BY country,state


/* USING GROUP BY, ORDER BY AND HAVING clause*/


SELECT country, state, SUM(sales) AS total_sales FROM sales1 GROUP BY country, state HAVING sales > 200 ORDER BY country, state 
/*note - the above code won't be executed - why? because mark Having speaks of Sales column,
but in SELECT it is SUM(sales) not 'sales'*/

SELECT country, state, SUM(sales) AS total_sales FROM sales1 GROUP BY country, state HAVING SUM(sales) > 200 ORDER BY country, state /*executed*/

/*Check this*/

SELECT country, state , SUM(sales) AS total_sales FROM sales1
WHERE sales > 100
GROUP BY country, state
ORDER BY country, state



/*USING where , Group by, having and Orderby */

SELECT country, state, SUM(sales) AS total_sales FROM sales1
WHERE sales > 100
GROUP BY country, state
HAVING sum(sales) > 200
ORDER BY country, state

-------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Using a stored Procedure*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER &&
CREATE PROCEDURE country_sales2(IN country_name VARCHAR(30), OUT total_sales DEC(10,2))
SELECT SUM(sales) INTO total_sales FROM sales1 WHERE country = country_name; 
END &&

CALL country_sales2('Sweden', @total_sales);
SELECT @total_sales

-------------------------------------------------------------------------------------------------------------------------------------------------------------


/*Code 1: Here , if you Run for every COuntry there is a state - shown Randomly, so there is no correctness in result al though total_sales is Correct*/

SELECT country, state, SUM(sales) AS total_sales FROM sales1 GROUP BY country ORDER BY country;

/*Code 2: Here, I need to find state for Each country and the Total_sales*/ 

SELECT country, state, SUM(sales) AS total_sales FROM sales1 GROUP BY country, state ORDER BY country, state;

/*CAN YOU USE 'WHERE' and 'HAVING' Clause in the Same COde*/

CREATE TABLE groupby4(
employee_id INT, 
department_id INT, 
salary VARCHAR(30))

INSERT INTO groupby4 VALUES
(1,101,60000),
(2,101, 55000),
(3,102, 70000), 
(4,102, 48000), 
(5, 101, 52000),
(6,103, 65000),
(7, 103, 58000), 
(8,104, 51000),
(9, 104, 62000),
(10, 104, 59000)

SELECT * FROM groupby4;

SELECT department_id, COUNT(*) AS employee_count FROM groupby4 WHERE salary >60000
GROUP BY department_id HAVING COUNT(*) >1; 


/* What is the difference between COUNT(*) and COUNT(column_name) in combination with GROUP BY?*/

/* COUNT(*):  total number of rows in a group, regardless of whether there are null values*/
/*counts all the rows, including those with NULL values*/

/*Don't Run*/

SELECT department_id, COUNT(*) AS total_employees FROM employees
GROUP BY department_id;

/* COUNT(column_name): counts the number of non-null values in the specified column within a group.*/

/*excludes rows where the specified column has a NULL value.*/

/*Don't Run*/

SELECT department_id, COUNT(salary) AS employees_with_salary FROM employees
GROUP BY department_id;


/*Above code in an example- You may run this*/

CREATE TABLE groupby8(
employee_id INT, 
department_id INT, 
salary VARCHAR(30) NULL)

INSERT INTO groupby8 VALUES
(1,101,60000), 
(4,102, 48000), 
(5, 101, 52000),
(6,103, 65000),
(9, 104, 62000),
(10, 104, 59000)

INSERT INTO groupby8(employee_id,department_id) VALUES
(11,102),
(12,103),
(13,101),
(14,104)

SELECT * FROM groupby8

SELECT department_id, COUNT(salary) AS employees_with_salary FROM groupby8 GROUP BY department_id

/* Develop a procedure that processes a batch of orders. The procedure should update inventory, calculate total cost, and generate invoices.*/

/*Check this after learning Joins*/ 















CREATE DATABASE ineuron_windowfunction; 
use ineuron_windowfunction;

/* TOPIC WINDOW FUNCTION*/ 
/* IT TRIES TO WORK ON THE SUBSET OF A DATASET*/ 
/* WINDOW FUNCTIONS - DIVIDED AGREGATED WINDOWING FUNCTION and ANALYTICAL WINDOWING FUNCTION*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             # AGGREGATE FUNCTION
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--  functions in SQL that perform a calculation on a set of values and return a single value.
-- Examples : SUM, AVG, COUNT, MAX, and MIN
-- They are often used with the GROUP BY clause to summarize data within groups.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             # WINDOW FUNCTION
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- special functions in SQL that allow you to perform calculations across a set of rows related to the current row.
-- without collapsing those rows into a single result.
-- They are used with the OVER clause to define the window or set of rows over which the calculation should be performed.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             # Window Vs Non-Window Function()
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--  same aggregate functions that are typically used with the GROUP BY clause can also be used as window functions with the OVER clause. 
--  When used with the OVER clause, they are referred to as window functions.
--  When used without the OVER clause, they are used in their traditional, non-window function manner.

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                           # EXAMPLES OF AGGREGATE FUNCTION 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE example_table 
(
    id INT PRIMARY KEY,
    value INT
);


INSERT INTO example_table (id, value) VALUES
(1, 10),
(2, 20),
(3, 30),
(4, 40),
(5, 50);


select * from example_table; 

# AVG():
SELECT AVG(value) FROM example_table; -- This will return the average of the 'value' column in 'example_table'.



# COUNT(): Counts the number of rows.
SELECT COUNT(*) FROM example_table;

#MAX(): Finds the maximum value in a column.
SELECT MAX(value) FROM example_table;

#MIN(): Finds the minimum value in a column.
SELECT MIN(value) FROM example_table;

# SUM(): Calculates the sum of values in a column.
SELECT SUM(value) FROM example_table;



#  VARIANCE():
select variance(value) from example_table; 









-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*SYNTAX OF WINDOW FUNCTION*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------


/* <window function> OVER (PARTITION BY <partition_column(s)> ORDER BY <order_column(s)>) */ 

/* <window function> is the window function you want to use.
PARTITION BY is optional and allows you to break down the window into partitions based on certain column values.
ORDER BY defines the order of rows within the window.*/


SELECT
    product,
    quantity,
    sales_date,
    ROW_NUMBER() OVER (ORDER BY quantity DESC) AS row_num
FROM
    sales;



-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                        # WINDOW FUNCTION TYPES
-------------------------------------------------------------------------------------------------------------------------------------------------------------

# RANK():
-- Assigns a rank to each row in the result set based on the value of a specified column.

SELECT id, value, RANK() OVER (ORDER BY value) AS ranking FROM example_table;


# DENSE_RANK():
-- Similar to RANK(), but it assigns consecutive ranks without any gaps.

select id, value, dense_rank() over(order by value) as dense_ranking from example_table; 

# NTILE():
-- Divides the result set into a specified number of equally-sized groups, assigning a bucket number to each row.

SELECT id, value, NTILE(3) OVER (ORDER BY value) AS bucket FROM example_table;
--  will divide the rows in the example_table into three equally-sized groups based on the value column, and assign a bucket number to each row.







# LEAD():
--  to access the value of a column from the next row in the result set.


SELECT * FROM example_table;

select id, value, lead(id) over(order by id) as next_id from example_table; 
SELECT id, value, LEAD(value) OVER (ORDER BY id) AS next_value FROM example_table;
select id, value, lead(id) over(order by value desc) as next_id from example_table; 


# LAG():

-- Allows you to access the value of a column from the previous row in the result set.

SELECT id, value, LAG(value) OVER (ORDER BY id) AS prev_value FROM example_table;


# FIRST_VALUE():
-- Returns the first value in a sorted partition of the result set.

SELECT id, value, FIRST_VALUE(value) OVER (ORDER BY id) AS the_first_value FROM example_table;
---------------------------------------------------------------------------------------------------------------------------------------------------


CREATE  TABLE TOP_SCORERS AS
SELECT
 'James Harden' AS player,
 2335 AS points,
 2020 AS season
UNION ALL
(SELECT
 'Damian Lillard' AS player,
 1978 AS points,
 2020 AS season)
UNION ALL
(SELECT
 'Devin Booker' AS player,
 1863 AS points,
 2020 AS season)
UNION ALL
(SELECT
 'James Harden' AS player,
 2818 AS points,
 2019 AS season)
UNION ALL
(SELECT
 'Paul George' AS player,
 1978 AS points,
 2019 AS season)
 UNION ALL
(SELECT
 'Kemba Walker' AS player,
 2102 AS points,
 2019 AS season)
UNION ALL
(SELECT
 'Damian Lillard' AS player,
 2067 AS points,
 2019 AS season)
UNION ALL
( SELECT 
'Richard Bartner' AS player,
 2067 AS points,
 2019 AS season)
UNION ALL
(SELECT
 'Devin Booker' AS player,
 1700 AS points,
 2019 AS season)
UNION ALL
(SELECT
 'Paul George' AS player,
 1033 AS points,
 2020 AS season)
UNION ALL
(SELECT
 'Kemba Walker' AS player,
 1145 AS points,
 2020 AS season)
UNION ALL
(SELECT
 'Adam Gilchrist' AS player,
 1145 AS points,
 2020 AS season);


 SELECT * FROM TOP_SCORERS ORDER BY points ASC;


select player, points,season,
first_value(points) over (order by season ) as first_season_2019,
last_value(points) over (order by season ) as last_season_2020
FROM top_scorers; 


create table TOP_SCORERS2 AS
(
SELECT * FROM TOP_SCORERS ORDER BY player
); 

select * FROM TOP_SCORERS2;

select player,
points, season,
first_value(points) over (order by season) as point_first_2019,
last_value(points) over (order by season) as point_last_2020
from TOP_SCORERS2;





# LAST_VALUE():
-- Returns the last value in a sorted partition of the result set.

select id, value, last_value(value) over(order by id) as the_last_value from example_table; 


# NTH_VALUE():
-- Returns the value of the expression from the nth row in the window frame.

select id, value, nth_value(value,3) over (order by  id) as the_nth_value from example_table; 
-- This query will return the value of the value column from the third row in the window frame for each row, ordered by the id column.




# PERCENT_RANK():
-- Calculates the relative rank of each row in the window as a percentage.

select id, value, percent_rank() over(Order by id) as the_percent_rank from example_table; 









/*Don't Run - EXAMPLE PURPOSE*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                               /*Example - ROW_NUMBER()*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------


use ineuron_windowfunction;

CREATE TABLE employees
( 
   employee_id INT,
   employee_name VARCHAR(30), 
   department_id int
 ); 
 
 INSERT INTO employees VALUES
    (1, 'John Doe', 101),
    (2, 'Jane Smith', 102),
    (3, 'Bob Johnson', 101),
    (4, 'Alice Brown', 103),
    (5, 'Charlie Green', 102);
 
SELECT 
employee_id, 
employee_name, 
department_id,
ROW_NUMBER () OVER ( ORDER BY employee_id) AS row_num 

FROM 
  employees; 


select * from
(
select employee_id, employee_name, department_id, row_number() over(order by employee_id) as row_num from employees
) as alias_table where row_num = 1; #think if it aasks for the 1st rank holder 



-------------------------------------------------------------------------------------------------------------------------------------------------------------
												 /* EXAMPlE - DENSE_RANK()*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Rows with the same values get the same rank.*/
/* There are no gaps in the ranks. If two rows have the same rank, the next row gets the next integer rank without skipping any numbers.*/ 

SELECT * FROM employees; 

SELECT 
  employee_id,
  employee_name, 
  department_id, 
  DENSE_RANK() OVER(ORDER BY department_id) AS rank_dense
FROM 
  employees; 
  

SELECT 
employee_id, 
employee_name, 
department_id, 
DENSE_RANK() OVER(ORDER BY department_id) AS rank_dense 
FROM employees ORDER BY rank_dense LIMIT 3; 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
												 /* EXAMPlE - RANK()*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employees2 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2)
);

INSERT INTO employees2 VALUES
    (1, 'John Doe', 50000.00),
    (2, 'Jane Smith', 55000.00),
    (3, 'Bob Johnson', 50000.00),
    (4, 'Alice Brown', 60000.00),
    (5, 'Charlie Green', 55000.00);

SELECT * FROM employees2; 

SELECT 
  employee_id, 
  employee_name, 
  salary,
  RANK() OVER (ORDER BY salary) AS ranking,
  DENSE_RANK() OVER ( ORDER BY salary) AS ranking_dense
FROM employees2; 

/* Run the above code -> RANK() assigns a unique rank to each distinct salary value, 
for ties -> receive the same rank, and the next rank is skipped.*/ 

/* DENSE_RANK() -> also assigns a unique rank  unlike RANK(), there are no gaps in the ranking for tied values*/
/*If two employees have the same salary, they get the same rank, and the next rank is not skipped.*/ 


/* ROW_NUMBER() gives a unique sequential number to each row, regardless of the contents of the row, lets say 2 students in two rows 
same marks -> so both rows have different row numbers, unique row numbers*/

/*rank() is a windowing function it ranks , 
in case of ties skips and the will assign the same rank to all tied rows and then leave gaps in the ranking sequence for the next row.*/

SELECT 
  employee_id, 
  employee_name, 
  salary,
  RANK() OVER (ORDER BY salary DESC) AS ranking,
  DENSE_RANK() OVER ( ORDER BY salary DESC) AS ranking_dense
FROM employees2; 



SELECT 
	employee_id,
    employee_name, 
    salary, 
DENSE_RANK() OVER ( ORDER BY salary DESC) AS dense_ranking,
SUM(salary) OVER ( ORDER BY employee_id) AS CTC
FROM employees2; 



-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                 /*SUM()*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

/* running total, also known as a cumulative sum*/ 
/* calculation that shows the running sum of values in a sequence.*/ 
/* It adds up the values in a specified order, and at each step, it displays the cumulative total up to that point.*/ 
/* Running totals are often used to analyze trends and understand the overall accumulation of a quantity over time or in a specific order.*/ 

CREATE TABLE sales (
  order_date DATE,
  sales_amount INT
);

INSERT INTO sales VALUES
  ('2023-01-01', 100),
  ('2023-01-02', 150),
  ('2023-01-03', 120),
  ('2023-01-04', 200),
  ('2023-01-05', 180);


select * from sales; 

/*Calculate the running total of Sales Amount*/ 

  
  select
   order_date,
   sales_amount, 
   sum(sales_amount) over(order by sales_amount) as running_total, 
   dense_rank() over(order by sales_amount) as dense_ranking
   from sales; 
   
  
  

SELECT running_total 
FROM
(
	SELECT SUM(sales_amount) OVER (ORDER BY order_date) AS running_total 
	FROM sales 
	WHERE order_date BETWEEN "2023-01-01" AND "2023-01-03"
    
) AS subquery_alias; 


select * from
(
  select
   order_date,
   sales_amount, 
   sum(sales_amount) over(order by sales_amount) as running_total, 
   dense_rank() over(order by sales_amount) as dense_ranking
   from sales) as alias_name
   where order_date < date_sub('2023-01-05', interval 1 day); 
   



   


-------------------------------------------------------------------------------------------------------------------------------------------------------------
    






CREATE DATABASE win_fun
USE win_fun

CREATE TABLE students(
student_id INT, 
student_batch VARCHAR(40), 
student_name VARCHAR(40), 
student_stream VARCHAR(40), 
students_marks INT, 
student_mailid VARCHAR(40))

INSERT INTO students VALUES (100, 'fsda', 'saurabh', 'cs', '80', 'saurabh@gmail.com'),
(101, 'fsda', 'kashyap', 'ETC', '70', 'kashyap@gmail.com'),
(102, 'fsda', 'sunny', 'EEE', '60', 'sunny@gmail.com'),
(103, 'fsde', 'kashyap', 'Mech', '50', 'kashyap@gmail.com'),
(104, 'fsde', 'sunny', 'civil', '40', 'sunny@gmail.com'),
(105, 'fsde', 'Bimal', 'Mech', '30', 'Bimal@gmail.com'),
(106, 'fsml', 'sunny', 'ETC', '20', 'sunny@gmail.com'),
(107, 'fsml', 'kashyap', 'EEE', '20', 'kashyap@gmail.com'),
(108, 'fsml', 'Bimal', 'Mech', '30', 'Bimal@gmail.com'),
(109, 'fsda', 'Bimal', 'EEE', '40', 'Bimal@gmail.com'),
(110, 'fsda', 'kashyap', 'ETC', '50', 'kashyap@gmail.com'),
(111, 'fsde', 'Sumit', 'cs', '60', 'Sumit@gmail.com'),
(112, 'fsde', 'sunny', 'Mech', '70', 'sunny@gmail.com'),
(113, 'fsml', 'kashyap', 'ETC', '80', 'kashyap@gmail.com'),
(114, 'fsml', 'Munaf', 'civil', '90', 'Munaf@gmail.com')

SELECT * FROM students

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            /*AGGREGATE BASED WINDOWING FUNCTION*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT avg(students_marks),student_batch FROM students GROUP BY student_batch;  
SELECT avg(students_marks), student_stream FROM students GROUP BY student_stream;
SELECT min(students_marks), student_stream FROM students GROUP BY student_stream;
SELECT count(student_name), student_stream FROM students GROUP BY student_stream;
SELECT count(student_name) AS `Count`, student_stream FROM students GROUP BY student_stream;
SELECT count(DISTINCT student_batch) FROM students;
SELECT count(DISTINCT student_name),student_batch FROM students GROUP BY student_batch;
SELECT student_batch, count(student_stream) FROM students GROUP BY student_batch;

/* In above statements you are actually creating groups - Window  kind of things */

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             /*ANALYTICAL BASED WINDOWING FUNCTION*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

SET sql_safe_updates = 0;

ALTER TABLE students

UPDATE students SET students_marks = 84 WHERE student_mailid = 'saurabh@gmail.com'

ALTER TABLE students
UPDATE students SET student_name = 'AJAY' WHERE student_id = 102;

UPDATE students SET student_mailid = 'ajay@gmail.com' WHERE student_id = 102;

SELECT * FROM students

DELETE FROM students WHERE student_id = 101;
UPDATE students SET students_marks = 38 WHERE student_id = 107;
UPDATE students SET students_marks = 98 WHERE student_id = 108;

UPDATE students SET students_marks = 68 WHERE student_id = 109;

UPDATE students SET students_marks = 55 WHERE student_id = 110;

UPDATE students SET students_marks = 61 WHERE student_id = 111;

UPDATE students SET students_marks = 77 WHERE student_id = 112;

UPDATE students SET students_marks = 99 WHERE student_id = 113;

UPDATE students SET students_marks = 96 WHERE student_id = 111;
SELECT * FROM students


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                     /* To find the Student with Maximum Marks from each of the Batch*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------



SELECT student_name FROM students WHERE students_marks IN (SELECT MAX(students_marks) FROM students WHERE student_batch = 'fsda')

SELECT student_name FROM students WHERE students_marks = (SELECT MAX(students_marks) FROM students WHERE student_batch = 'fsda')


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             /* To find out 2nd Highest in FSDA batch*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC limit 2 /*Normal Method*/

/* Using windowing function DENSE_RANK()*/ 

SELECT 
   student_id, 
   student_batch, 
   student_name, 
   student_stream, 
   students_marks, 
   student_mailid,
   DENSE_RANK() OVER (ORDER BY students_marks DESC) AS ranking 
FROM 
   students LIMIT 2; 
   
  
   
/*But the second approach is the Windowing Approach*/


SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC; /*Total - 4 Records*/ 

SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC limit 1,1; 
/* Mark this what 1,1 does is out of the ordering operation we would be getting the second one in the sort*/
/*Thehe first number after LIMIT (in this case, 1) indicates the offset, or how many records to skip. 
The second number (in this case, 1) indicates how many records to retrieve after the offset.*/

SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC limit 4,1; /* No record coz skipped 4 no more records after skipping*/ 

/* if you want to skip the first record and retrieve the second record, you would use LIMIT 1,1. */
/* . If you wanted to skip the first two records and retrieve the third record, you would use LIMIT 2,1*/

/*To find the third Entry*/

SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC limit 2,1;


SELECT student_name, students_marks FROM students WHERE student_batch = 'fsda' ORDER BY students_marks DESC LIMIT 2,2; /* there for 1st number - from 0 uptil which level - here it is 3rd entry - and the 2nd number
= the number up enrtries after the required entry here after 3rd entry,we needed total 2 entries*/

/* All these approaches will work if marks are identical, what if 3 People in fsda batch have same marks*/ 


/*Thus we have to use Windowing Function - Row Number, Rank, etc*/

SELECT 
   student_id, 
   student_batch, 
   student_name, 
   student_stream, 
   students_marks, 
   student_mailid,
   ROW_NUMBER() OVER (ORDER BY student_id) AS SL_NO, 
   DENSE_RANK() OVER (ORDER BY students_marks DESC) AS ranking 
FROM 
   students ; 


/*Tried Other ways*/

SELECT  student_batch, student_name, MAX(students_marks) FROM  students GROUP BY student_batch, student_name;

SELECT MAX(students_marks) AS max_marks, student_batch, student_name AS Topper FROM students GROUP BY student_batch,student_name;


SELECT MAX(students_marks), student_batch, student_name AS Topper FROM students GROUP BY student_batch



SELECT * FROM students


SELECT student_batch, MIN(students_marks) AS Least_marks, MIN(student_name) AS Student_name FROM students GROUP BY student_batch;

SELECT student_stream, MAX(students_marks) AS Topper, MAX(student_name) AS Student_name  FROM students GROUP BY student_stream;



/* This is just for a random Table not part of current class*/ 


CREATE TABLE sql_problem(
customer_id INT NOT NULL,
customer_name VARCHAR(30), 
billing_id VARCHAR(30), 
billing_creation_date VARCHAR(50), 
billing_amount VARCHAR(30))

INSERT INTO sql_problem VALUES (1,'A','id1','10-10-2020','100$'),
(1,'A', 'id2','11-11-2020','150$'),
(1, 'A','id3','12-11-2021', '100$'),
(2, 'B','id4', '10-11-2019', '150$'),
(2, 'B', 'id5', '11-11-2020', '200$'),
(2, 'B', 'id6', '12-11-2021', '250$'),
(3, 'C', 'id7', '01-01-2018', '100$'),
(3, 'C', 'id8', '05-01-2019', '250$'),
(3, 'C', 'id9', '06-01-2021', '300$')

SELECT * FROM sql_problem;

SELECT customer_id,customer_name, avg(billing_amount) FROM sql_problem WHERE customer_name IN ('A','B','C') GROUP BY customer_name,customer_id;

SELECT customer_id,customer_name, avg(billing_amount) FROM sql_problem  GROUP BY customer_name,customer_id;


------------------------------------------------------------------------------------------------------------------------------------------------------
                                           # INDUSTRY SPECIFIC QUESTION - IMPORTANT - GO THORUGH
------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE student_progress 
(
    student_id INT, -- Unique identifier for the student.
    course_id INT, --  Unique identifier for the course.
    date DATE, --  Date of the progress update.
    completed_lessons INT, -- Number of lessons completed by the student on that date.
    cumulative_lessons INT -- Cumulative number of lessons completed by the student up to that date.
);


INSERT INTO student_progress (student_id, course_id, date, completed_lessons, cumulative_lessons)
VALUES
    (1, 101, '2024-01-01', 2, 2),
    (1, 101, '2024-01-02', 1, 3),
    (1, 101, '2024-01-03', 3, 6),
    (1, 101, '2024-01-04', 2, 8),
    (2, 102, '2024-01-01', 1, 1),
    (2, 102, '2024-01-02', 2, 3),
    (2, 102, '2024-01-03', 1, 4),
    (2, 102, '2024-01-04', 3, 7);
    
 -- Your task is to identify students who are consistently progressing in their courses by calculating the weekly average of completed lessons for each student. 
-- This will help the company identify high-performing students and tailor engagement strategies accordingly.
 
 select * FROM student_progress;


SELECT student_id, `date`, 
round(avg(completed_lessons) over (partition by student_id order by date rows between 6 preceding and current row),2) as weekly_avg_lessons,
sum(cumulative_lessons) over (partition by student_id order by date rows between 6 preceding and current row) AS total_lessons_7days
from
student_progress; 

-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE student_progress2 
(
    student_id INT,
    progress_date DATE,
    quiz_score INT
);

INSERT INTO student_progress2 (student_id, progress_date, quiz_score)
VALUES
    (1, '2024-01-01', 80),
    (1, '2024-01-02', 85),
    (1, '2024-01-03', 90),
    (1, '2024-01-04', 88),
    (1, '2024-01-05', 92),
    (1, '2024-01-06', 85),
    (1, '2024-01-07', 88),
    (2, '2024-01-01', 75),
    (2, '2024-01-02', 78),
    (2, '2024-01-03', 80),
    (2, '2024-01-04', 82),
    (2, '2024-01-05', 85),
    (2, '2024-01-06', 90),
    (2, '2024-01-07', 92);

# Problem Statement:

-- In an online learning platform, we have a table named student_progress that tracks the daily progress of students. 
-- Each row represents a student's progress for a particular day. 
-- We want to identify students where there is a decline in score in comparision to the previous day's score 
-- consistently improved their quiz scores over the past 7 days. 

select  * from  student_progress2; 

select student_id, progress_date, quiz_score,
lag(quiz_score) over (partition by student_id order by progress_date) AS  previous_quiz_score from student_progress2;



# this flags the score based on improved or declined 

select * ,
	CASE WHEN previous_score IS NULL or quiz_score > previous_score THEN 'Improved' ELSE 'Declined' END AS score_status
	FROM
	(
	select student_id, progress_date, quiz_score,
	lag(quiz_score) over (partition by student_id order by progress_date) as previous_score
	from student_progress2
	) as alias_table;


# Let's check for those where there has been only improvement 

select * FROM
(
	select * ,
	CASE WHEN previous_score IS NULL or quiz_score > previous_score THEN 'Improved' ELSE 'Declined' END AS score_status
	FROM
	(
	select student_id, progress_date, quiz_score,
	lag(quiz_score) over (partition by student_id order by progress_date) as previous_score
	from student_progress2
	) as alias_table
) as alias_table2 
WHERE score_status = 'Improved'; 




------------------------------------------------------------------------------------------------------------------------------------------------------





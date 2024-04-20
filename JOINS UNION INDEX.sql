CREATE DATABASE ineuron_join;
USE ineuron_join;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                             /* NATURAL JOIN*/ 
                                     /*combines rows from two tables based on columns with the same name and the same data type.*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

drop table employees; 
CREATE TABLE employees 
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);
                                  /* Here in both the tables, department_id -> Same name and Same data type*/
INSERT INTO employees VALUES
    (1, 'John Doe', 101),
    (2, 'Jane Smith', 102),
    (3, 'Bob Johnson', 101),
    (4, 'Ajay', 103); 

drop table departments; 

CREATE TABLE departments 
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
    (101, 'HR'),
    (102, 'IT');

SELECT * FROM employees; 
SELECT * FROM departments; 

SELECT * FROM employees NATURAL JOIN departments; 

select * from employees join departments;  /* note - this would give different results*/



select * from employees natural join departments
/* INNER JOIN requires you to explicitly specify the condition in the ON clause, usually based on related columns.*/
/* NATURAL JOIN automatically matches columns with the same name, and you don't need to specify the condition explicitly.*/ 







 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

drop table course; 

CREATE TABLE IF NOT EXISTS course
(
  course_id INT, 
  course_name VARCHAR(50),
  course_desc VARCHAR(60),
  course_tag VARCHAR(50)
  ); 

INSERT INTO course VALUES
(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


drop table student; 

CREATE TABLE IF NOT EXISTS student
(
  student_id INT,
  student_name VARCHAR(30),
  student_mobile INT,
  student_course_enroll VARCHAR(30),
  student_course_id INT 
  );
  
  INSERT INTO student VALUES
(301 , 'sudhanshu', 3543453,'yes', 101),
(302 , 'Akshay', 3543453,'yes', 102),
(301 , 'Aditya', 3543453,'yes', 105),
(302 , 'Raj', 3543453,'yes', 106),
(303 , 'Santosh', 3543453,'yes', 101),
(304 , 'Swaraj', 3543453,'yes', 103),
(305 , 'Akshay', 3543453,'yes', 105),
(306 , 'Raj', 3543453,'yes', 107),
(306 , 'Santosh', 3543453,'yes', 103);

SELECT * FROM course; 
SELECT * FROM student;

SELECT * FROM course NATURAL JOIN student;  /*See here we are trying to do a natural join without any match with the column names*/
/*so - it does gives a result but with error*/
/*recommendation is to give a condition*/

SELECT * FROM course JOIN student ON course.course_id = student.student_course_id;  /*Example of Equi join*/ /*Check Below*/ 
SELECT * FROM course INNER JOIN student ON course.course_id = student.student_course_id; /*Here the results remain same*/ 





SELECT * FROM course; 
SELECT * FROM student;
SELECT * FROM course INNER JOIN student ON course.course_id = student.student_course_id; 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /* 1. INNER JOIN*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Inner Join- used  to retrieve information that is spread across multiple tables and is connected through a common column.*/
/* In summary, an inner join retrieves rows from both tables that satisfy the join condition, */
/*discarding rows that do not have matching values in the specified columns.*/

SELECT c.course_id, c.course_name, c.course_desc FROM course c
INNER JOIN student s ON c.course_id = s.student_course_id; 

SELECT c.course_id, c.course_name, c.course_desc,c.course_tag, s.student_name, s.student_course_id FROM course C
INNER JOIN student s ON c.course_id = s.student_course_id; 

SELECT c.course_id, c.course_name, c.course_desc,c.course_tag, s.student_name FROM course C
INNER JOIN student s ON c.course_id = s.student_course_id;  
-- mark in the above course_id 109,108,106 etc not present because they are not common with student_courseid in student table.
-- thus, an inner join retrieves rows from both tables that satisfy the join condition, */
-- /*discarding rows that do not have matching values in the specified columns.*/


SELECT c.course_id, c.course_name, c.course_desc FROM course c
INNER JOIN student s ON c.course_id = s.student_course_id; 

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag,s.student_name, s.student_course_id FROM course c
INNER JOIN student s ON c.course_id = s.student_course_id; 


SELECT * FROM course c INNER JOIN student s ON c.course_id = s.student_course_id; 

SELECT * FROM student s INNER JOIN course c ON s.student_course_id = c.course_id; 


SELECT * FROM course; 
SELECT * FROM student;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  /*2. Equi Join*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT course_id, course_name, course_desc, student_course_id FROM course JOIN student ON course.course_id = student.student_course_id; 

SELECT course_id, course_name, course_desc, student_course_id FROM course INNER JOIN student ON course.course_id = student.student_course_id; 



/*If you see the above two codes the result remain same -> Equi Join is specific type of join where the condition is based on equality. */
/* Equi join is interchangeably used with the term Inner Join*/ 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  /* 3. LEFT JOIN*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM course; 
SELECT * FROM student; 


SELECT * FROM course INNER JOIN student ON course.course_id = student.student_course_id; 

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_id,s.student_name,s.student_mobile,s.student_course_enroll,s.student_course_id
FROM course c  
LEFT JOIN 
student s ON c.course_id = s.student_course_id; 


-- select all teh codes and run at once to see the difference. 

#inferences: 

-- inner join will depict the common results only the mismatch items and its rows are eliminated in the inner join,
-- check course_id = 104 is missing ininner join , but present   


 SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name,s.student_course_id FROM course C
 LEFT JOIN student s ON c.course_id = s.student_course_id; /* If you run this you will find it took entire left hand side cloumns of course table and for every*/
 /*record in the course table it matched the from the second table*/ 
 
 


SELECT * FROM course c LEFT JOIN student s ON c.course_id = s.student_course_id; 
 
 /*RUN THE ABOVE RECORD AND LET's SAY I WANT TO FIND ONLY THOSE RECORDS WHERE student_course_id =NULL*/
 /* I can use a derived table here*/
 
SELECT *
FROM (
    SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id
    FROM course c
    LEFT JOIN student s ON c.course_id = s.student_course_id
) AS derived
WHERE student_course_id IS NULL;




 
 

SELECT *  FROM (SELECT * FROM course LEFT JOIN student ON course.course_id = student.student_course_id) AS table_1 WHERE student_course_id IS NULL; 


/*2nd Way*/

SELECT c.course_id, c.course_name,c.course_desc,c.course_tag, s.student_name,s.student_course_id FROM course c
LEFT JOIN student s ON c.course_id = s.student_course_id WHERE student_course_id IS NULL;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM course; 
SELECT * FROM student; 

SELECT * FROM course LEFT JOIN student ON course.course_id < student.student_course_id; /*so it's not always the = operator, other conditions could also be used*/ 




 

/*check the result - first the left side 
table is placed as it is for the first dpartment_id in employees table - 101 , the condition it checks is there something in Department_id for 
Departments table which is Less than 101 - No so 1st row is Null and for that department_name is Null. 
2nd is 102 - is there something which is Less than 102 in departments column - yes 101 - so 2nd row is 101 and departement_name - HR
3rd is 101 - is there something which is less than 101 - No -> so Null and NUll.*/



SELECT * FROM employees LEFT JOIN departments ON employees.department_id < departments.department_id; 
SELECT * FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id;  /*Here it checks let's say 
it should atch that is empoyee*/

select * from employees; 
select * from departments; 


-----------------------------------------------------------------------------------------------------------------------------------------------------
                                                             /* 3. RIGHT JOIN*/
------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name,s.student_course_id FROM course c
RIGHT JOIN student s ON c.course_id = s.student_course_id;

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c 
RIGHT JOIN student s ON c.course_id = s.student_course_id WHERE c.course_id IS NULL; 



------------------------------------------------------------------------------------------------------------------------------------------------------
                                                           /* 4. CROSS JOIN*/
------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c 
INNER JOIN student s ON c.course_id = s.student_course_id;

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c 
CROSS JOIN student s ON c.course_id = s.student_course_id;

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c
CROSS JOIN  student s ON c.course_id = s.student_course_id; 

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c
CROSS JOIN student s ;

/*Note in the above code with condition a Cross join operates like an inner Join*/ 
/* But without condition - it just gives the product of both the Tables*/ 

/*Cross join -> Gives complete combination of all rows from both tables.*/

/*INNER JOIN gives you rows where there's a match based on a specified condition, typically involving a third table that links the two.*/





# collectively run 

SELECT * FROM course; 
SELECT * FROM student; 

SELECT * FROM course INNER JOIN student ON course.course_id = student.student_course_id;  -- remember : only matched elements

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_id,s.student_name,s.student_mobile,s.student_course_enroll,s.student_course_id
FROM course c  
LEFT JOIN 
student s ON c.course_id = s.student_course_id;  -- left side placed and against same the ccorresponding right is matched and placed, null if the right is absent.

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name,s.student_course_id FROM course c
RIGHT JOIN student s ON c.course_id = s.student_course_id; -- right side placed and against same the ccorresponding left is matched and placed, null if the left is absent.

SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name, s.student_course_id FROM course c 
CROSS JOIN student s ON c.course_id = s.student_course_id;
------------------------------------------------------------------------------------------------------------------------------------------------------

/* WHERE TO USE INNER JOIN AND WHERE TO uSE CROSS JOIN*/


drop table students1; 

CREATE TABLE students1
(
  student_id  INT PRIMARY KEY, 
  student_name VARCHAR(30), 
  age INT
); 


drop table courses1; 
CREATE TABLE courses1
(
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50),
  `level` VARCHAR(10)
  ); 

select * from students1;
select * from courses1;

INSERT INTO students1 VALUES (1, 'Alice', 22), (2, 'Bob', 24), (3, 'Charlie', 23);
INSERT INTO courses1 VALUES (101, 'Math', 'Inter'), (102, 'English', 'Advanced'), (103, 'History', 'Beginner');

SELECT * FROM students1; 
SELECT * FROM courses1; 

/* Let's say you want to analyze which students are enrolled in which courses based on their IDs -> INNER JOIN*/ 

 SELECT s.student_id,s.student_name, s.age,c.course_id,c.course_name,c.`level` FROM students1 s
 INNER JOIN courses1 c ON s.student_id = c.course_id;  /*See there is no match -> could be due to a misalignment in the IDs 
 or a different design for student-course relationships.*/
 
 
 /*you want to analyze all possible combinations of students and courses to see the potential interest level of each student in each course ->> CROSS JOIN*/
 
SELECT s.student_id,s.student_name, s.age,c.course_id,c.course_name,c.`level` FROM students1 s
CROSS JOIN courses1 c ON s.student_id = c.course_id;


drop table students2;

CREATE TABLE students2 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);
INSERT INTO students2 VALUES (1, 'Alice', 22), (2, 'Bob', 24), (3, 'Charlie', 23);

drop table courses2;

CREATE TABLE courses2 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    `level` VARCHAR(40)
);

INSERT INTO courses2 VALUES (1, 'Math', 'Intermediate'), (2, 'English', 'Advanced'), (3, 'History', 'Beginner');

SELECT * FROM students2;
SELECT * FROM courses2; 


/*INNER JOIN*/

SELECT * FROM students2;
SELECT * FROM courses2; 

SELECT s.student_id, s.student_name, s.age, c.course_id, c.course_name, c.`level` FROM students2 s
INNER JOIN courses2 c ON s.student_id = c.course_id;

SELECT s.student_id, s.student_name, s.age, c.course_id, c.course_name, c.`level` FROM students2 s
CROSS JOIN courses2 c ON s.student_id = c.course_id; 

SELECT s.student_id, s.student_name, s.age, c.course_id, c.course_name, c.`level`
FROM students2 s
CROSS JOIN courses2 c; /* This the most widely used format for a cross join,  you don't need to specify a condition like ON s.student_id = c.course_id 
because it automatically combines every row from the first table with every row from the second table, creating a Cartesian product.*/


SELECT * FROM students2 CROSS JOIN courses2; 


/*-----CROSS JOIN  -> to combine every row in one table with every row in another table.
For example, if you have a table of customers and a table of orders, 
a CROSS JOIN would return every customer paired with every order, 
even if the customer did not place that order----*/


SELECT * FROM customers
CROSS JOIN orders;

/*this would  return a result set with 100 rows However, in reality, there might only be 50 matching customer-order pairs.
A more efficient way to get the same result would be to use an INNER JOIN.*/

---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /*HASH JOIN*/
---------------------------------------------------------------------------------------------------------------------------------------------------------
/* Hashing -> process of converting data (like a row in a table) into a numerical value (called a hash). 
hash acts like a unique identifier for that piece of data.*/

/*Hash Table->  a data structure that allows for fast data retrieval. Think of it like an index in a book. 
Instead of going through each page to find a topic, you use the index to quickly locate the pages where the topic is discussed.*/



drop table employees_hash;

CREATE TABLE employees_hash (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);


drop table employees_hash;

CREATE TABLE departments_hash (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employees_hash VALUES (1, 'John Doe', 1);
INSERT INTO employees_hash VALUES (2, 'Jane Smith', 2);

INSERT INTO departments_hash VALUES (1, 'HR');
INSERT INTO departments_hash VALUES (2, 'IT');

SELECT * FROM employees_hash; 
SELECT * FROM departments_hash; 

SELECT employee_id,employee_name, department_name
FROM employees_hash
JOIN departments_hash USING (department_id);

select empolyee_id,employee_name,department_id,department_name from employees_hash
join department_hash using(department_id); 





 


/* Recall -> SELECT * FROM employees NATURAL JOIN departments;  In case of Natural join no explicit mentioning of cloumns was nit required
it feteched results -> by checking the common names by default*/




drop table employees; 

CREATE TABLE employees
( 
employee_id INT, 
employee_name VARCHAR(40)
); 



drop table bank_details; 

CREATE TABLE bank_details
( 
employee_id_details INT, 
bank_name VARCHAR(40), 
bank_ifsc INT
);


select * from employees;
select * from bank_details;


SELECT employee_id, employee_name,bank_name, bank_ifsc FROM employees JOIN bank_details USING (employee_id_details); 

SELECT employee_id, employee_name,bank_name,bank_ifsc FROM employees e
INNER JOIN bank_details b ON e.employee_id = b.bank_details ; 




/*if the coloumn Name in Bank_ details was employee_id i.e same as employees -> then Natural Join*/ 

SELECT employee_id,employee_name, bank_name FROM employees NATURAL JOIN bank_details ;
SELECT * FROM employees NATURAL JOIN bank_details ;


---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                           /*EXECUTION PLAN*/ 
---------------------------------------------------------------------------------------------------------------------------------------------------------

EXPLAIN SELECT employee_id,employee_name, department_name
FROM employees_hash
JOIN departments_hash USING (department_id);


SET optimizer_trace = 'enabled=on'; /*For the execution Plan to put it on*/ 
SELECT * FROM information_schema.optimizer_trace; /*then select the execution plan*/


SET optimizer_trace = 'enabled=on'; 
SELECT * FROM information_scehema.optimizer_trace; 

SET optimizer_trace = 'enabled=on'; 
SET optimizer_trace = 'enabled=on'; 

SET optimizer_trace = 'enabled=on'; 


/*`optimizer_trace` is a system variable in MySQL 
that controls whether the server should collect detailed information about how it makes decisions regarding query optimization.*/

/*Putting it all together, the statement is instructing MySQL to start collecting detailed information about the optimization process for queries*/


SET optimizer_trace = 'enabled=on'; 
SELECT * FROM information_schema.optimizer_trace; 


set optimizer_trace = 'enabled=on';
select * from information_schema.optimizer_trace;






------------------------------------------------------------------------------------------------------------------------------------------------------
select partition_name, table_name, table_rows from information_schema.partitions where table_name = 'departments_hash';

-- Recall!!



------------------------------------------------------------------------------------------------------------------------------------------------------



SET optimizer_trace = 'enabled=on'; 
SELECT * FROM information_schema.optimizer_trace; 


SET optimizer_trace = 'enabled=on'; 
SELECT * FROM information_schema.optimizer_trace; 


---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                  /*MERGE JOIN*/ 
---------------------------------------------------------------------------------------------------------------------------------------------------------

/* - similar to hash join
   - it involves explicitly sorting the datasets based on the join key and then merging them  
   -> more evident when you have an orderby clause in the query.
*/ 
  
  
  drop table employees_merge;
  
  CREATE TABLE employees_merge
  ( 
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
  ); 
  
  CREATE TABLE departments_merge
  (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
  );
   
   
INSERT INTO employees_merge VALUES 
(1, 'John Doe', 1),
(2, 'Jane Smith', 2),
(3, 'Bob Johnson', 1); 

INSERT INTO departments_merge VALUES 
(1, 'HR'),
(2, 'IT');


SELECT * FROM employees_merge;
SELECT * FROM departments_merge; 


/*The goal is to retrieve employees along with their corresponding department names.*/
 
SELECT employee_id, employee_name, department_name
FROM employees_merge
JOIN departments_merge USING (department_id) ;  /*here, the result is executed, lets say post this we specified something explicitly*/ 



SELECT e.employee_name, e.department_id, d.department_name FROM employees_merge e 
LEFT JOIN departments_merge d ON e.department_id = d.department_id;  /*above result could come in through this as well*/ 


SELECT employee_id, employee_name, department_name
FROM employees_merge
JOIN departments_merge USING (department_id)
ORDER BY department_id, employee_id;   -- Explicit sort


SELECT employee_id, employee_name, department_name
FROM employees_merge
JOIN departments_merge USING (department_id)
ORDER BY department_id; 

/*ORDER BY clause explicitly sorts the result based on the join key (department_id) and, 
if needed, on other columns (here, we include employee_id)*/ 

/*same goes with inner join as well*/ 

SELECT employee_id,employee_name, department_name FROM employees_merge e 
INNER JOIN departments_merge d ON e.department_id = d.department_id; 
 
SELECT employee_id,employee_name, department_name FROM employees_merge e 
INNER JOIN departments_merge d ON e.department_id = d.department_id ORDER BY employee_id DESC;  /*Executed no conflict in Names*/ 
 
SELECT employee_id,employee_name, department_name,department_id AS department_ide FROM employees_merge e 
INNER JOIN departments_merge d ON e.department_id = d.department_id ORDER BY department_id DESC; /* Not getting executed for department_id is ambigious*/

SELECT 
    e.employee_id,
    e.employee_name,
    e.department_id AS id_e, /*so here alias names are used*/ 
    d.department_id AS id_d,
    d.department_name
    
FROM 
    employees_merge e
    
INNER JOIN 
    departments_merge d ON e.department_id = d.department_id
ORDER BY
    e.department_id DESC; 
    
    
    
INSERT INTO employees_merge VALUES 
(4, 'bobby', 1),
(5, 'jackson', 2),
(6, 'sammar', 1), 
(8, 'aquib', 2) ,
(9, 'samarth', 4),
(10, 'Vinay',3), 
(11, 'Ajay', 4),
(12, 'Dimple', 3),
(13, 'Akshay', 4) ,
(14, 'Rajpal', 4),
(15, 'Ramesh', 2);

INSERT INTO departments_merge VALUES 
(3, 'DA'),
(4, 'MBBS');

SELECT * FROM employees_merge;
SELECT * FROM departments_merge; 

/*now let's say we need to count the number of students in each departments*/

SELECT department_name,COUNT(DISTINCT employee_name) AS total_students FROM
(
SELECT e.employee_name,e.department_id,d.department_name FROM employees_merge e 
LEFT JOIN  departments_merge d 
ON e.department_id = d.department_id
) AS table_2
GROUP BY department_name


WITH count_cte AS
(
SELECT employee_id, department_name 
FROM employees_merge e
INNER JOIN departments_merge d ON e.department_id = d.department_id
)
SELECT department_name, COUNT(employee_id) AS total_employees FROM count_cte  GROUP BY department_name ORDER BY total_employees DESC; 

/* Now lets say, we want only those sets where employee count > 4*/ 

WITH count_cte AS
(
SELECT employee_id, department_name 
FROM employees_merge e
INNER JOIN departments_merge d ON e.department_id = d.department_id
)
SELECT department_name,COUNT(employee_id) AS total_employees FROM  count_cte 
GROUP BY department_name
HAVING count(employee_id) > 2; 






---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            /*INDEX*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------

/*special data structure that stores information about the contents of a table.*/

drop table course8; 

CREATE TABLE IF NOT EXISTS course8
(
 course_id INT, 
 course_name VARCHAR(50) CHECK(course_name IS NOT NULL) , 
 course_desc VARCHAR(60), 
 course_tag VARCHAR(50), 
 INDEX(course_id)
 );
 
 
INSERT INTO course8 VALUES
(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');


 SELECT * FROM course8; /*From user side it is always same, but fro the query side it reduces time*/ 
 SHOW INDEX FROM course8;  /*Look here the index_type is BTREE = Binary Tree*/ 
 
 /*Why Index is uded let's say I am using a where operation lets say selecting all where course_id = 101 and there are 1M records, 
 indexing reduces the time because it stores data in BTREE so 101 would fall to the right of 100 so it will take less time to bring, 
 ideally it would have searched all the records in 1M and gave you the result -> Time consuming*/ 
 
 
 /*2 Columns- MULTI COLUMN INDEXING*/ 
 
 
drop table curse10; 

create table if not exists course10 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name)
);
 
insert into course10 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');



SHOW INDEX FROM course10;


EXPLAIN ANALYZE SELECT * FROM course10 WHERE  course_id = 106 OR course_name = 'fsds';

(SELECT * FROM course10 WHERE course_id = 106)
UNION
(SELECT * FROM course10 WHERE course_name = 'fsds');


---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /*UNIQUE INDEX*/ 
---------------------------------------------------------------------------------------------------------------------------------------------------------


/*enforces the uniqueness of a particular column or set of columns in a table.*
/*no two rows in the table can have the same value for the indexed columns.*/
/* used to prevent duplicate data from being inserted into a table.*/ 
/*An index should be used when you want to improve the performance of queries that filter or sort the data by a particular column.*/
/*A unique index should be used when you want to prevent duplicate data from being inserted into a table.*/
 
 drop table course11; 
 
create table if not exists course11
(
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc,course_name)
);
show index from course11;






-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             /* 3. UNION*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

 /* combines the results of two or more SELECT statements into a single result set*/
 /*eliminates duplicate rows by default, ensuring that each row appears only once in the combined result.*/
 /*primarily used to combine data from tables that have the same structure and compatible data types in corresponding columns.*/
 
 SELECT * FROM student; 
 SELECT * FROM course;
 
 
 SELECT course_id,course_name FROM course
 UNION
 SELECT student_id,student_course_enroll FROM student;
 
 /* if you see it just did a vertical apend operation*/ 
 
SELECT course_id,course_name FROM course
UNION
SELECT student_name,student_course_enroll FROM student;


/*so different column tyoes are also possible but just the number of columns in both the Tables must match when doing union operation*/

SELECT course_id,course_name FROM course
UNION
SELECT student_course_enroll FROM student; /*Not working becaus edifferent number of columns*/


SELECT course_id,course_name FROM course
UNION ALL
SELECT student_name,student_course_enroll FROM student; /*UNION ALL _ doesn't remove duplicates by default*/ 


SELECT course_id, course_name FROM course;


/*UNION: Use when you need a combined set of rows without duplicates.*/
/*UNION ALL: Use when you want all rows, including duplicates, which can be faster especially in large datasets.*/




SELECT 1 AS col1, 2 AS col2
UNION ALL
SELECT 3,4 ; 


SELECT 1 AS col1, 2 AS col2
UNION ALL 
SELECT 3 AS col3,4 AS col4;  /*this also give sthe same result*/ 

SELECT 1 AS col1, 2 AS col2
UNION ALL 
SELECT 3 AS COL3, 4 AS col4;



SELECT 1 AS col1, 2 AS col2
UNION ALL 
SELECT 3,4; 


SELECT 1 AS col1, 2 AS col2
UNION ALL 
SELECT 'Ronu' AS name_bar, 'Ajay' AS old_bar; 



/*UNION- combines the result sets of two or more SELECT statements and returns only distinct rows.*/
/*UNION ALL - combines the result sets of two or more SELECT statements but does not remove duplicate rows. 
It includes all rows, even if there are duplicates.*/

SELECT 1 AS first_num, 2 AS sec_num
UNION
SELECT 2,3;

SELECT 1 AS first_num, 2 AS sec_num
UNION ALL
SELECT 2,3;

/* NO duplicate ROWS-> (remember only rows, not talking about duplicate entries)*/

SELECT 1 AS first_num, 2 AS sec_num
UNION
SELECT 1,2;  /*See duplicate rows eliminated*/ 

SELECT 1 AS first_num, 2 AS sec_num
UNION ALL
SELECT 1,2; /*Duplicate ROws Present*/ 

SELECT NULL AS first_col, Not_null AS sec_column;




     
------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  /* 4. COMMON TABLE EXPRESSION -CTE*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

/* Let's say i have 2 tables and the data I am searching in Table no 1 - will give an Alias and based on that I should be able to search 
something else from the same table*/ 

/* CTEs are named temporary result set within a SQL query that you can reference within the scope of that query.*/
/* you can reference within a SELECT, INSERT, UPDATE, or DELETE statemen*/
/*particularly useful for recursive queries and situations where you need to reference the same subquery multiple times.*/



SELECT * FROM student;
SELECT * FROM course; 

SELECT * FROM course WHERE course_id IN(101,102,103); /*Let's say out of these I have to filter out some more data*/ 


WITH sample_course AS
( 
  SELECT * FROM course WHERE course_id IN(101,102,103)
) 
SELECT * FROM sample_course WHERE course_tag = 'java'; 



  

WITH course_details AS
(
SELECT * FROM course WHERE course_id IN(101,102,103) 
) 
SELECT * FROM course_details WHERE course_tag IN ('Analytics','DS'); 


/*Or using derived table concept*/ 

SELECT * FROM 
(
  SELECT * FROM course WHERE course_id IN (101,102,103) 
  ) AS sample_1
  WHERE course_tag = 'java'; 

SELECT * FROM 
(
  SELECT *
  FROM course
  WHERE course_tag IN (101, 102, 103)
) AS sample_1
ORDER BY course_id DESC
LIMIT 1;


SELECT * FROM 
(
  SELECT * FROM course WHERE course_id IN (101,102,103) 
  ) AS sample_1
  WHERE course_tag = 'java'; 


------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE numbers
(
 n int
 ); 
 
 INSERT INTO numbers VALUES
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7);
SELECT * FROM numbers; 

WITH number_square AS
(
SELECT n , n*n AS squares FROM numbers
) 
SELECT * FROM number_square;  


 

/*In the above example the same results we could have gotten using SELECT n , n*n AS squares FROM numbers*/
/* So why using a CTE? */ 
/*Answer is -> Not required here but its advantages are seen when complex queries come in picture*/ 

------------------------------------------------------------------------------------------------------------------------------------------------------


/*Suppose you have a table of employees with their salaries, 
and you want to find employees whose salaries are above the average salary.*/

drop table employees_salary; 

CREATE TABLE employees_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT
);

INSERT INTO employees_salary VALUES
    (1, 'John Doe', 50000),
    (2, 'Jane Smith', 60000),
    (3, 'Bob Johnson', 55000),
    (4, 'Alice Brown', 70000),
    (5, 'Charlie Green', 80000);


select * from employees_salary;



SELECT * FROM employees_salary WHERE salary > (SELECT AVG(salary) FROM employees_salary); /*WITHOUT A CTE*/

select * employees_slary where salary > (select avg(salary) from employees_salary); 


                                                                                                                                                                                                                              

WITH avg_salary AS
(
SELECT AVG(salary) AS avg_sal FROM employees_salary
)
SELECT * FROM employees_salary WHERE salary > (SELECT avg_sal FROM avg_salary); 


WITH avg_salary1 AS
( 
SELECT AVG(salary) AS salary_avg FROM employees_salary
)
SELECT * FROM employees_salary WHERE salary > (SELECT salary_avg FROM avg_salary1); 



------------------------------------------------------------------------------------------------------------------------------------------------------

/*Left for other time*/ 

CREATE TABLE employees6 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees6 VALUES
    (1, 'John Doe', NULL),
    (2, 'Jane Smith', 1),
    (3, 'Bob Johnson', 2),
    (4, 'Alice Brown', 2),
    (5, 'Charlie Green', 3);
    
WITH RecursiveHierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        0 AS level
    FROM employees6
    WHERE manager_id IS NULL -- Start with the CEO

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        rh.level + 1 AS level
    FROM employees6 e
    JOIN RecursiveHierarchy rh ON e.manager_id = rh.employee_id
)
SELECT *
FROM RecursiveHierarchy;

------------------------------------------------------------------------------------------------------------------------------------------------------

/* USING CTE WITH JOIN*/

WITH cte_join AS
(
SELECT c.course_id, c.course_name, c.course_desc, c.course_tag,s.student_name, s.student_course_id 
FROM course c
INNER JOIN student s ON c.course_id = s.student_course_id
) 
SELECT course_id, course_tag FROM cte_join GROUP BY course_id,course_tag; 



with alias_table as
(
select c.course_id,c.course_name,c.course_desc,c.course_tag,s.student_name,s.student_course_id from course c left join student s
on c.course_id = s.student_course_id
)
select * from alias_table where student_name is null and student_course_id is null; 



WITH cte_join AS
(
SELECT c.course_id, c.course_name, c.course_desc, c.course_tag,s.student_name, s.student_course_id 
FROM course c
INNER JOIN student s ON c.course_id = s.student_course_id
) 
SELECT course_desc,COUNT(student_course_id) AS total_ids FROM cte_join GROUP BY course_desc;


WITH cte_join AS
(
 
 SELECT c.course_id, c.course_name, c.course_desc, c.course_tag,s.student_name,s.student_course_id
 FROM course c 
 INNER JOIN student s ON c.course_id = s.student_course_id
 ) 
 SELECT course_desc, COUNT(DISTINCT student_course_id) AS total_ids FROM cte_join GROUP BY course_desc ORDER BY total_ids DESC;



WITH xyg AS
(
SELECT c.course_id, c.course_name, c.course_desc, c.course_tag, s.student_name,s.student_course_id
FROM course c 
INNER JOIN student s ON c.course_id = s.student_course_id
)
SELECT course_tag , COUNT(DISTINCT student_course_id)  FROM xyg  GROUP BY course_tag;


WITH cte_test AS
(SELECT 1 AS col1, 2 AS col2
UNION ALL
SELECT 3,4) 
SELECT * FROM cte_test;  



 -------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*Recursive CTE*/
---------------------------------------------------------------------------------------------------------------------------------------------------------

WITH RECURSIVE cte(n) AS
(
SELECT 1 
UNION ALL 
SELECT n+1 FROM cte where n < 5) 
SELECT * FROM cte;


WITH RECURSIVE CTE(n) AS
(
SELECT 1
UNION ALL 
SELECT n+1 FROM CTE WHERE n<5)
SELECT * FROM CTE;

WITH RECURSIVE CTE(n) AS
(
  SELECT 1
  UNION ALL 
  SELECT n+1 FROM CTE WHERE n<5)
  


SELECT RECURSIVE recursive_sample AS
(
SELECT 1 AS n, 1 AS p, 1 AS q
UNION ALL
SELECT n+1, q+2, p+4 FROM recursive_sample WHERE n<5
)
SELECT * FROM recursive_sample




/*Same ouput using a stored Procedure*/ 

DELIMITER //
CREATE PROCEDURE generate_numbers2(IN max_value INT) 
BEGIN
 DECLARE i INT DEFAULT 1; 
 CREATE TEMPORARY TABLE IF NOT EXISTS temp_table 
 (
 n INT
 ) ; 
 
 WHILE i <= max_value 
 DO 
 INSERT INTO temp_table(n) VALUES (i) ; 
 SET i = i +1; 
 END WHILE; 
 SELECT * FROM temp_table; 
 END //
 DELIMITER ; 
 
 CALL generate_numbers2(5); 



  



 DELIMITER $$
 CREATE PROCEDURE xsample2(IN m INT) 
 BEGIN
 DECLARE i INT DEFAULT 1;
 CREATE TEMPORARY TABLE sample_table
 (
    n INT 
  ); 
  WHILE i < m DO 
   INSERT INTO sample_table(n) VALUES (i);
   SET i = i+1; 
   END WHILE; 
   SELECT * FROM sample_table; 
END $$

 CALL xsample2(4); 
 
 
DELIMITER $$
CREATE PROCEDURE n_value(IN max_value INT) 
BEGIN
    DECLARE i INT DEFAULT 1; 
	CREATE TEMPORARY TABLE table2
    ( 
      n INT
	); 
    
    WHILE i < max_value DO
    INSERT INTO table2(n) VALUES (i); 
    SET i = i+1; 
    END WHILE;
  SELECT * FROM table2; 
END $$

CALL n_value(6); 


------------------------------------------------------------------------------------------------------------------------------------------------------
 /*--Can Partitioning and indexing used together*/

CREATE TABLE orders
( 
   order_id INT PRIMARY KEY, 
   customer_id INT NOT NULL, 
   order_date DATE NOT NULL, 
   order_amount DECIMAL(10,2) NOT NULL, 
   INDEX(customer_id)
   )
   PARTITION BY RANGE (order_date) 
     ( 
       partition p2022 values less than ('2023-01-01'),
       partition p2023 values less than (MAXVALUE)
	 ); 
      /* The above code would give you an error because the vales for P2022 must have int type, and the Date type for order_date is DATE Type
      so we need to convert it to numerical value then*/
  
  
CREATE TABLE orders
( 
   order_id INT PRIMARY KEY, 
   customer_id INT NOT NULL, 
   order_date DATE NOT NULL, 
   order_amount DECIMAL(10,2) NOT NULL, 
   INDEX(customer_id)
   )
   PARTITION BY RANGE (order_date) 
     ( 
       partition p2022 values less than (UNIX_TIMESTAMP('2023-01-01')),
       partition p2023 values less than (MAXVALUE)
	 ); 

/*This still doesnt execute because Range partitioning is allowed only for numeric data type, such as INT, BIGINT, DECIMAL, or DATETIME.*/ 

CREATE TABLE orders
( 
   order_id INT PRIMARY KEY,  /*This would still not execute because note Primary key and Partition columns are yet different*/
   customer_id INT NOT NULL, 
   order_year INT NOT NULL, 
   order_amount DECIMAL(10,2) NOT NULL, 
   INDEX(customer_id)
   )
   PARTITION BY RANGE (order_year) 
     ( 
       partition p2022 values less than (2023),
       partition p2023 values less than (MAXVALUE)
	 ); 


CREATE TABLE orders
( 
   order_id INT,  
   customer_id INT NOT NULL, 
   order_year INT NOT NULL, 
   order_amount DECIMAL(10,2) NOT NULL, 
   INDEX(customer_id)
   )
   PARTITION BY RANGE (order_year) 
     ( 
       partition p2022 values less than (2023),
       partition p2023 values less than (MAXVALUE)
	 ); 
     
SELECT * FROM orders WHERE customer_id = 1234 AND order_year >= 2024; /*Don't run*/ 

/*here indexing on customer_id help to quickly find the rows that match the customer_id condition.
partitioning on the order_date column will help to quickly narrow down the search to the relevant partition.*/ 



------------------------------------------------------------------------------------------------------------------------------------------------------
             /* NESTED SUBQUERY and CORELATED SUBQUERY*/ 
------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS customers
(
  customer_id INT PRIMARY KEY, 
  customer_name VARCHAR(60)
); 

INSERT INTO customers(customer_id, customer_name) VALUES
(1, 'Customer X'),
(2, 'Customer Y');

SELECT * FROM customers; 




CREATE TABLE IF NOT EXISTS orders2
(
  order_id INT PRIMARY KEY, 
  customer_id INT,
  product_name VARCHAR(60), 
  quantity INT, 
  price DEC(10,2),
  FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
); 

INSERT INTO orders2 (order_id, customer_id, product_name, quantity, price) VALUES
(1, 1, 'Product A', 5, 10.00),
(2, 1, 'Product B', 3, 15.00),
(3, 2, 'Product C', 2, 20.00);


SELECT * FROM customers; 
SELECT * FROM orders2; 



/*Let's find out order values for each customer*/ 


/*1st way*/ 

SELECT customer_id,customer_name,
(
      SELECT SUM(quantity * price) FROM orders2
      WHERE
      customers.customer_id = orders2.customer_id /*This step is required because we are selecting from two different tables, else you could use Joins*/
)AS total_orders_value
FROM customers; 



SELECT * FROM customers; 
SELECT * FROM orders2; 




/*2nd Way*/

WITH join_cte AS
(
SELECT * FROM customers c
INNER JOIN orders2 o ON c.customer_id = o.customer_id
) 
SELECT cutomer_id, customer_name, (quantity*price) AS price_details FROM join_cte; 
/* The above wont be executed because there is a misunderstanding for Cutomer_id is the same name in both the tables,
so which Customer_id to chose*/
/*thus alias names has to be given*/

SELECT * FROM customers; 
SELECT * FROM orders2; 


WITH join_cte AS 
(
    SELECT 
        c.customer_id AS customer_id1,c.customer_name,
        o.customer_id AS customer_id2, o.quantity, o.price 
        
    FROM customers c
    INNER JOIN orders2 o ON c.customer_id = o.customer_id
)
SELECT  
    customer_name,
    customer_id1,
    SUM(quantity * price) AS price_details 
FROM join_cte
GROUP BY customer_name, customer_id1;



/*3rd Way - Usage of Derived Table and CTE*/ 

SELECT * FROM customers; 
SELECT * FROM orders2; 

WITH customer_price AS
(
SELECT c.customer_id, c.customer_name, o.quantity,o.price FROM customers c 
LEFT JOIN orders2 o ON c.customer_id = o.customer_id
) 
SELECT customer_name, SUM(price) AS total_price FROM 
(SELECT (quantity * price) AS price , customer_name FROM customer_price) AS table_2 /*Usage of Derived Table*/
GROUP BY customer_name;



SELECT * FROM customers; 
SELECT * FROM orders2; 


WITH customer_price2 AS
(
SELECT c.customer_id, c.customer_name, o.quantity,o.price FROM customers c 
LEFT JOIN orders2 o ON c.customer_id = o.customer_id
) 
SELECT customer_name, SUM(price) AS total_price FROM 
(
SELECT customer_name, (quantity*price) AS price 
FROM customer_price2
) AS table_2
GROUP BY customer_name; 

SELECT * FROM customers; 
SELECT * FROM orders2; 


------------------------------------------------------------------------------------------------------------------------------------------------------

                               /* USING 3 TABLES JOINS - ADDA Specific Content*/ 
------------------------------------------------------------------------------------------------------------------------------------------------------

drop table students; 

CREATE TABLE students 
(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO students VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Bob Johnson'),
    (4, 'Alice Brown'),
    (5, 'Charlie Green'),
    (6, 'David Lee'),
    (7, 'Eva White'),
    (8, 'Frank Black');


drop table courses; 

CREATE TABLE courses 
(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses VALUES
    (101, 'Mathematics'),
    (102, 'English'),
    (103, 'Science'),
    (104, 'History'),
    (105, 'Programming'),
    (106, 'Economics'),
    (107, 'Marketing'),
    (108, 'Physics');


drop table enrollments;

CREATE TABLE enrollments
 (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);




INSERT INTO enrollments VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 105),
    (4, 3, 103),
    (5, 4, 104),
    (6, 5, 106),
    (7, 6, 105),
    (8, 7, 107);

-------------------------------------------------------------------------------------------------------------------------------------------------------
-- RUN ALL TOGETHER FOR EASY COMPARISION

SELECT * FROM students; 
SELECT * FROM courses; 
SELECT * FROM enrollments; 

# using inner join:

SELECT 
     s.student_name, 
     e.enrollment_id, 
     c.course_name, 
     c.course_id
     
FROM students s

INNER JOIN 
      enrollments e ON s.student_id = e.enrollment_id
INNER JOIN 
      courses c ON  e. course_id = c.course_id;  


# Using Left join
select 
 s.student_name,
 e.enrollment_id,
 c.course_name,
 c.course_id
 
from 

 students s
 
left join
  enrollments e on s.student_id = e.enrollment_id

left join 
  courses c on e.course_id = c.course_id; 
  
 




------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------------------
/*Practise Question from Intellipat*/
------------------------------------------------------------------------------------------------------------------------------------------------------

drop table customer_intellipat2;

CREATE TABLE IF NOT EXISTS customer_intellipat2
(
   customer_id INT PRIMARY KEY,
   first_name VARCHAR(30),
   last_name VARCHAR(30), 
   amount INT, 
   order_date DATETIME, 
   category VARCHAR(30), 
   gender VARCHAR(30)
); 

INSERT INTO customer_intellipat2 VALUES
(110, 'Ajeet', 'Mishra', 2000, '2022-10-18 16:10:30', 'Cosmetics', 'male'), 
(111, 'Rana', 'sharma', 5000, '2000-11-11 12:19:26', 'Clothing', 'male'), 
(112, 'Divya', 'jain', 3000, '2021-10-05 17:30:56', 'Cosmetics', 'female'), 
(113, 'Vikas', 'Kohli', 1500, '2019-05-07 01:12:23', 'Clothing', 'Male'), 
(114, 'Rimi', 'Kumari', 8000, '2010-02-14 10:35:45', 'Jewellery', 'female');
     

SELECT * FROM customer_intellipat2; 


drop table product_intellipat2;

CREATE TABLE IF NOT EXISTS product_intellipat2
(
  product_id INT, 
  customer_id INT, 
  product_name VARCHAR(30)
  
); 

INSERT INTO product_intellipat2 VALUES
(1001,112, 'Skin Gel'),
(1002, 110, 'Face Cleanser'),
(1003, 114, 'Earings'), 
(1004, 120, 'Headphone'), 
(1008, 111, 'Jeans') 

SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2; 


/* Q. Get customer name and product name order by first name Using INNER JOIN */ 



SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2; 

#1st type

with alias_table as
(
select c.first_name, c.last_name, p.product_name
from customer_intellipat2 c inner join product_intellipat2 p
on c.customer_id = p.customer_id
) select * from alias_table order by first_name; 



# 2nd type

SELECT 
  c.first_name, p.product_name
FROM 
 customer_intellipat2 c
INNER JOIN product_intellipat2 p ON c.customer_id = p. customer_id ORDER BY first_name; 



/* Q. Get customer name and product name order by first name Using LEFT JOIN */ 



SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2;

select c.first_name,c.last_name, p.product_id, p.product_name from customer_intellipat2 c
left join product_intellipat2 p on  c.customer_id = p. customer_id  order by first_name; 



SELECT 
  c.first_name, p.product_name
FROM 
 customer_intellipat2 c
LEFT JOIN product_intellipat2 p ON c.customer_id = p. customer_id ORDER BY first_name;  
/*see the result - here for vikas - no products, thus Product_name is Null*/ 


/* Get the Customer name and product name order by firstname Check for all first_name when there is no product mention '-No products found'*/


SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2;

select c.first_name, ifnull(p.product_name,'No Products found')
from customer_intellipat2 c
left join product_intellipat2 p on c.customer_id = p.customer_id ORDER BY first_name; 


SELECT c.first_name, IFNULL(p.product_name, '-No Products found') 
FROM customer_intellipat2 c
LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id ORDER BY first_name; 

SELECT c.first_name, IFNULL(p.product_name, '-No products found')
FROM customer_intellipat2 c
LEFT JOIN product_intellipat2 p ON c.customer_id = p.customer_id ORDER BY first_name; 


/* Get the Customer name and product name order by firstname Check for all first_name when there is no Customer mention '-No CX found'*/



SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2;

SELECT IFNULL(c.first_name, '-No CX found'), p.product_name 
FROM customer_intellipat2 c
RIGHT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id ORDER BY first_name; 



/* Get the complete record(Customer name, product name) from both tables([CustomerDetail],[ProductDetail]), 
if no match is found in any table then show NULL.*/ /* IMPORTANT CONCEPT HERE*/ 


SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2;

SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
FULL OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id ORDER BY first_name;  /*This doesn't gets executed*/ 

/*because MYSQL doesnt support FULL OUTER JOIN-> You could achieve the same result by UNION Operator- Using LEFT and RIGHT JOIN*/ 


SELECT * FROM customer_intellipat2; 
SELECT * FROM product_intellipat2;

SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id

UNION 
SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
RIGHT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
ORDER BY first_name;


/* Q. Write a query to find out the Customer name who has not been assigned any product, and display*/


WITH cte_right_join AS
(
   SELECT c.first_name, p.product_name FROM customer_intellipat2 c 
   LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
) 
SELECT first_name, product_name FROM cte_right_join WHERE product_name IS NULL; 



WITH cte_right_join AS
(
   SELECT c.first_name, IFNULL(p.product_name,'no products found') FROM customer_intellipat2 c /*see this ->  wont get executed becaue you have not given an alias name, so in the outer query product_name is not accessible*/
   LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
) 
SELECT first_name, product_name FROM cte_right_join WHERE product_name IS NULL; 




WITH cte_right_join AS
(
   SELECT c.first_name, IFNULL(p.product_name, 'no products found') AS product_name /*here we named it as Product_name*/ 
   FROM customer_intellipat2 c
   LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
) 
SELECT first_name, product_name FROM cte_right_join WHERE product_name = 'no products found'; /*Executed*/ 


/* Q. Write a query to find out the Customer name who has not been assigned any product, and display*/

WITH cte_join_2 AS
( 
   SELECT IFNULL(c.first_name, '-No Cx found') AS first_name, p. product_name FROM customer_intellipat2 c
   RIGHT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
)

SELECT first_name, product_name FROM cte_join_2 WHERE first_name = '-No Cx found'; 


WITH CTE_3 AS
(
SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id

UNION 
SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
RIGHT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id
ORDER BY first_name;
) 
SELECT first_name , COUNT(product_name) FROM CTE_3 GROUP BY first_name
HAVING COUNT(product_name) > 1;  /*this is not executed - Order by should be placed outside of the CTE*/ 


WITH CTE_3 AS
(
SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
LEFT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id

UNION 
SELECT c.first_name, p.product_name
FROM customer_intellipat2 c
RIGHT OUTER JOIN product_intellipat2 p ON c.customer_id = p.customer_id

) 
SELECT first_name , COUNT(product_name) AS product_count  FROM CTE_3 
GROUP BY first_name
HAVING product_count > 1
ORDER BY first_name;  /*Executed but blank because no such condition*/ 




------------------------------------------------------------------------------------------------------------------------------------------------------


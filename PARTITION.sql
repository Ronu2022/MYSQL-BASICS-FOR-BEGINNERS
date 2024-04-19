CREATE DATABASE ineuron_partition; 
USE ineuron_partition; 

drop table ineuron_course; 

create table ineuron_course
(
course_name varchar(50) ,
course_id int(10) , 
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
);

INSERT INTO ineuron_course VALUES

('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;

SELECT * FROM ineuron_course; 

/*Let's say you are asked to find the data of the courses launched in 2022*/

SELECT * FROM ineuron_course WHERE course_launch_year = '2022'; 

SELECT * FROM ineuron_course WHERE course_launch_year BETWEEN '2020' AND '2022'; 

/*But in above ways, each time, MYSQL has to go through the entire set of Records to Match the Year of 2022 and then give the output*/ 

/*What if We store the Contents based on Years internally such that it stops the necessity of going through the entire list of the Table*/ 

/# 1. PARTITION BY RANGE#/


DROP TABLE ineuron_courses2;

CREATE TABLE IF NOT EXISTS ineuron_courses2
(
   course_name varchar(50),
   course_id int(10),
   course_title varchar(60),
   course_desc varchar(80),
   launch_date date,
   course_fee int,
   course_mentor varchar(60),
   course_launch_year int
)

partition by range(course_launch_year) 
  (
   partition p0 values less than (2019),
   partition p1 values less than (2020),
   partition p2 values less than (2021),
   partition p3 values less than (2022),
   partition p4 values less than (2023)
   );





  
insert into ineuron_courses2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ;



select * from ineuron_courses2 where course_launch_year = '2022'; /*See this got executed in 0.0016 Secs*/

SELECT * FROM ineuron_course WHERE course_launch_year = '2022';  /*this took 0.0083 Sec- there wasn't any Partiion*/

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses2';












----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                     /# 2. PARTITION BY HASH #/
----------------------------------------------------------------------------------------------------------------------------------------------------------


Drop table ineuron_courses4;

CREATE TABLE IF NOT EXISTS ineuron_courses4
(
   course_name varchar(50),
   course_id int(10),
   course_title varchar(60),
   course_desc varchar(80),
   launch_date date,
   course_fee int,
   course_mentor varchar(60),
   course_launch_year int
)

PARTITION BY HASH(course_launch_year) 
PARTITIONS 10;






  
SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses4'; 
/*Check - 10 Partitions already created and Named by default- In case of Partition by Range we had to name these individually*/


insert into ineuron_courses4 values

('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 
;



select * from ineuron_courses4;

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses4'; 

/* IF you see this there has been 4 under Table_rows for P0 , 3 for P1 - How does that Happen?*/ 
/*What it does is lets say for 2019 - 2019 % 10 - Reminder is 9 -> SO it goes under P9*/


---------------------------------------------------------------------------------------------------------------------------------------------

SELECT ic.course_launch_year, p.PARTITION_NAME, p.TABLE_NAME, p.TABLE_ROWS
FROM ineuron_courses4 ic
CROSS JOIN INFORMATION_SCHEMA.PARTITIONS p 
WHERE p.TABLE_NAME = 'ineuron_courses4';

---------------------------------------------------------------------------------------------------------------------------------------------

drop table adda_247_4;

CREATE TABLE IF NOT EXISTS adda_247_4
( 
  Course_ID INT, 
  Launch_year YEAR, 
  course_type VARCHAR(30)
)
PARTITION BY HASH (Launch_year) PARTITIONS 10; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'adda_247_4';



SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'adda_247_4'; 







--/* INTERVIEW QUESTION */---
--/* #Can you share an experience where you optimized a database schema for a real-world scenario?# */---

/* Initially Adda 247 used to have Key based partitioning ->*/ 
/* as the dataset grew, we noticed uneven distribution and challenges with querying courses within specific date ranges.*/
/* decided to switch to range-based partitioning using the launch date. */ 
/* better data distribution*/ 
 
 /*EXAMPLE*/ 
 
 -- Initial Attempt with Key-Based Partitioning
 
CREATE TABLE IF NOT EXISTS courses_key_partitioned
 (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    launch_date DATE
   )
PARTITION BY KEY(course_id)
PARTITIONS 5; 
    

INSERT INTO courses_key_partitioned (course_id, course_name, launch_date)
VALUES
    (1, 'Machine Learning', '2022-01-01'),
    (2, 'Data Science', '2022-02-01'),
    (3, 'Web Development', '2022-03-01'); 
 
 
 SELECT * FROM courses_key_partitioned; 
 
 SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'courses_key_partitioned'; 


 -- Improved Version with Range-Based Partitioning
 
CREATE TABLE IF NOT EXISTS courses_range_partitioned2 
(
    course_id INT,
    course_name VARCHAR(50),
    launch_date DATE,
    PRIMARY KEY (course_id, launch_date)
)
PARTITION BY RANGE (YEAR(launch_date))
(
    PARTITION p0 VALUES LESS THAN (2021),
    PARTITION p1 VALUES LESS THAN (2022),
    PARTITION p2 VALUES LESS THAN (2023),
    PARTITION p3 VALUES LESS THAN (2024),
    PARTITION p4 VALUES LESS THAN (2025)
);


INSERT INTO courses_range_partitioned2 (course_id, course_name, launch_date)
VALUES
    (1, 'Machine Learning', '2022-01-01'),
    (2, 'Data Science', '2022-02-01'),
    (3, 'Web Development', '2022-03-01');



SELECT * FROM courses_range_partitioned2 ; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'courses_range_partitioned2'; 


/*-----------------------------------------------------------------------------------------------------------------------------------*/

/* NEXT EXAMPLE*/ 

drop table partition_sample14; 

CREATE TABLE partition_sample14
(
  canditates_name VARCHAR(30) UNIQUE, 
  candidates_age INT, 
  candidates_phone INT
)  
PARTITION BY RANGE COLUMNS(canditates_name)  /* Look here for Non Numeric partition value- COLUMNS keyword is used */
(  
  PARTITION po VALUES LESS THAN ('L'),
  PARTITION p1 VALUES LESS THAN('P'),
  PARTITION p2 VALUES LESS THAN ('V'),
  PARTITION p3 VALUES LESS THAN ('Z'),
  PARTITION P4 VALUES LESS THAN (MAXVALUE) /*Note the range in Partition are exclusive - example Less than z doesnt involve z with it. */
); /*so, p4 is used such that let's say a Name starting with Z cold be accomodated*/ 




INSERT INTO partition_sample14 VALUES
('Ajay', 20, 8456),
('Leema', 22,8458),
('Monica', 32,8688), 
('Parody',30, 8888),
('Uber', 32, 6888),
('Zebra', 36,7888),
('Violin', 38, 8888);



select partition_name,table_name, table_rows from information_schema.partitions where table_name = 'partition_sample14';
  

---------------------------------------------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS adda_247
( 
   course_id INT, 
   launch_year INT, 
   course_category VARCHAR(30)
)
PARTITION BY RANGE(launch_year) 
(
   PARTITION p0 VALUES LESS THAN (1990),
   PARTITION p1 VALUES LESS THAN (2000),
   PARTITION p2 VALUES LESS THAN (2010),
   PARTITION p3 VALUES LESS THAN (2013),
   PARTITION p4 VALUES LESS THAN (2023),
   PARTITION p5 VALUES LESS THAN (MAXVALUE) /*Note this so for any value beyond 2023, should be stored in this*/
); 






INSERT INTO adda_247(course_id,launch_year,course_category) VALUES
(1,1989,'Data Science'),
(2,1999,'Algo'),
(3,2001,'Astro'),
(4,2008,'Geo'),
(5,2014, 'Maths'),
(6,2024,'DSA'),
(7,2024,'Electrical'),
(8, 2026, 'Civil');

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'adda_247'; 

  



SELECT * FROM partition_sample14; 

SELECT PARTITION_NAME,TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'partition_sample14'; 


-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             /# 3. PARTITION BY KEY #/
-------------------------------------------------------------------------------------------------------------------------------------------------------

drop table ineuron_courses8;

CREATE TABLE IF NOT EXISTS ineuron_courses8
(
   course_name varchar(50),
   course_id int(10) PRIMARY KEY, 
   course_title varchar(60),
   course_desc varchar(80),
   launch_date date,
   course_fee int,
   course_mentor varchar(60),
   course_launch_year int
)
PARTITION BY KEY()
PARTITIONS 10; 


INSERT INTO ineuron_courses8 VALUES
('machine_learning', 101, 'ML', 'this is ML course', '2019-07-07', 3540, 'sudhanshu', 2019),
('aiops', 102, 'AIOPS', 'this is aiops course', '2019-07-07', 3540, 'sudhanshu', 2019),
('dlcvnlp', 103, 'DLCVNLP', 'this is DLCVNLP course', '2020-07-07', 3540, 'sudhanshu', 2020),
('aws_cloud', 104, 'AWS Cloud', 'this is AWS Cloud course', '2020-07-07', 3540, 'sudhanshu', 2020),
('blockchain', 105, 'Blockchain', 'this is Blockchain course', '2021-07-07', 3540, 'sudhanshu', 2021),
('RL', 106, 'Reinforcement Learning', 'this is RL course', '2022-07-07', 3540, 'sudhanshu', 2022),
('DL', 107, 'Deep Learning', 'this is DL course', '2022-07-07', 3540, 'sudhanshu', 2022),
('interview_prep', 108, 'Interview Preparation', 'this is Interview Prep course', '2019-07-07', 3540, 'sudhanshu', 2019),
('big_data', 109, 'Big Data', 'this is Big Data course', '2020-07-07', 3540, 'sudhanshu', 2020),
('data_analytics', 110, 'Data Analytics', 'this is Data Analytics course', '2021-07-07', 3540, 'sudhanshu', 2021),
('fsds', 111, 'FSDS', 'this is FSDS course', '2022-07-07', 3540, 'sudhanshu', 2022),
('fsda', 112, 'FSDA', 'this is FSDA course', '2021-07-07', 3540, 'sudhanshu', 2021),
('fabe', 113, 'FABE', 'this is FABE course', '2022-07-07', 3540, 'sudhanshu', 2022),
('java', 114, 'Java', 'this is Java course', '2020-07-07', 3540, 'sudhanshu', 2020),
('MERN', 115, 'MERN Stack', 'this is MERN Stack course', '2019-07-07', 3540, 'sudhanshu', 2019);

SELECT * FROM ineuron_courses8; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses8'; 

/* Here the Logic of allocation is bit complex- the Server follows HASH Partition logic but allocats through MD5- MD5 is a number allocated*/
/*to each and every string for example in the above insertion 'MERN' will have a unique MD5 number , 'Java ' a different */

SELECT MD5('MERN'); 
/# MD5, which stands for Message Digest Algorithm 5,#/
/#is a widely used hash function that produces a 128-bit hash value (32 hexadecimal characters) from an arbitrary amount of input data.#/

/* You could use mutiplie like Unique, Primary key in same*/









 



 



CREATE TABLE IF NOT EXISTS ineuron_courses10
(
   course_name varchar(50),
   course_id int(10) PRIMARY KEY, 
   course_title varchar(60) UNIQUE,
   course_desc varchar(80),
   launch_date date,
   course_fee int,
   course_mentor varchar(60),
   course_launch_year int
)
PARTITION BY KEY(course_id)
PARTITIONS 10; /*This is not executed because there is a conflict here between Primary key and UNique*/
/* So, a Seoarate unique Key could be created*/



CREATE TABLE IF NOT EXISTS ineuron_courses10
(
   course_name varchar(50),
   course_id int(10) PRIMARY KEY,
   course_title varchar(60),
   course_desc varchar(80),
   launch_date date,
   course_fee int,
   course_mentor varchar(60),
   course_launch_year int,
   UNIQUE(course_title) -- Separate unique key for course_title /*But in MYSQL this would still give error*/
)
PARTITION BY KEY(course_id)
PARTITIONS 10;









/* LESSON : UNIQUE KEY AND PRIMARY KEY there would be at conflict wrt partition*/


CREATE TABLE sales_data 
(
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    sale_amount DECIMAL(10, 2)
)
PARTITION BY KEY(product_id) /*Note - this wouldnt be created because Primary Key and Partition By column has different Column*/
PARTITIONS 5;





CREATE TABLE sales_data 
(
    sale_id INT,
    product_id INT,
    sale_date DATE,
    sale_amount DECIMAL(10, 2),
    PRIMARY KEY (sale_id, product_id) 
)
PARTITION BY KEY(product_id)
PARTITIONS 5;




INSERT INTO sales_data (sale_id, product_id, sale_date, sale_amount)
VALUES
(1, 101, '2023-01-01', 150.50),
(2, 105, '2023-01-02', 200.25),
(3, 103, '2023-01-03', 100.75),
(4, 102, '2023-01-04', 75.20),
(5, 104, '2023-01-05', 300.00),
(6, 101, '2023-01-06', 120.80),
(7, 105, '2023-01-07', 250.30),
(8, 103, '2023-01-08', 180.90),
(9, 102, '2023-01-09', 90.60),
(10, 104, '2023-01-10', 400.50);


SELECT * FROM sales_data; 

SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'sales_data'; 

SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION,SUBPARTITION_NAME, TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'sales_data'; 

------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                 /# PARTITION BY LIST#/
------------------------------------------------------------------------------------------------------------------------------------------------------

drop table ineuron_course6; 

CREATE TABLE ineuron_course6
(
    course_name VARCHAR(30), 
    course_id INT(30),
    course_title VARCHAR(60),
    course_desc VARCHAR(80), 
    launch_date DATE,
    course_fee INT, 
    course_mentor VARCHAR(60), 
    course_launch_year INT
)
    
   PARTITION BY LIST(course_launch_year) 
   (
     PARTITION p0 VALUES IN (2019,2020),
     PARTITION p1 VALUES IN (2022,2021)
	);




INSERT INTO ineuron_course6 
VALUES
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);




SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME =  'ineuron_course6'; 

SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION, SUBPARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM
INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_course6'; 


SELECT partition_name, partition_ordinal_position, subpartition_name, table_name, table_rows FROM 
INFORMATION_schema.partitions WHERE table_name = 'ineuron_course6'; 

SELECT partition_name, partition_ordinal_position, subpartition_name, table_name, table_rows
FROM information_schema.partitions WHERE Table_name = 'ineuron_course6'; 



  

-------------------------------------------------------------------------------------------------------------------------------------------------------


create table ineuron_courses6
(
course_name varchar(50) ,
course_id int(10) ,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)

partition by list(course_launch_year) /*NOTE HERE - the vlues are Numerical - Hnece Partition by List COLUMN for Cardinal - non numerical values - use  lIST COLUMNS - row 562*/ 
(
partition p0 values in(2019,2020),
partition p1 values in(2022,2021)
);

insert into ineuron_courses6 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);

SELECT * FROM ineuron_courses6; 

SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses6'; 



-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*PArtition By Range COLUMNS*/
-------------------------------------------------------------------------------------------------------------------------------------------------------
/*DON't Run*/ /* some Mysql versions may not support multiple columns partitioning by ranges*/

drop table monthly_sales; 

CREATE TABLE monthly_sales 
(
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    `year` INT NOT NULL,
    `month` INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
)
PARTITION BY RANGE COLUMNS(year, month) 
(
    PARTITION p0 VALUES LESS THAN (2020, 1),
    PARTITION p1 VALUES LESS THAN (2020, 7),
    PARTITION p2 VALUES LESS THAN (2021, 1),
    PARTITION p3 VALUES LESS THAN (2021, 7),
    PARTITION p4 VALUES LESS THAN (MAXVALUE)
);


   



CREATE TABLE ineuron_courses8
(
course_name VARCHAR(50) ,
course_id INT(10) ,
course_title VARCHAR(60),
course_desc VARCHAR(80),
launch_date DATE,
course_fee INT,
course_mentor VARCHAR(60),
course_launch_year INT
)

PARTITION BY RANGE COLUMNS(course_name ,course_id,course_launch_year )
(
  PARTITION p0 VALUES LESS THAN ('aiops',105,2019),
  PARTITION p1 VALUES LESS THAN ('fsds' ,110,2021),
  PARTITION p2 VALUES LESS THAN ('MERN',116,2023) /*IF there are total 18 Records for some if it doesnt match under the criteria, they wont be part of the partition*/
);

SELECT ('aiops',105,2019) < ('fsds' ,110,2021); /*the output is 1 - True*/ 
SELECT ('a') > ('b');  /*this is how it sorts in the above aprtition*/ 





CREATE TABLE abc
(
x INT,
y VARCHAR(30), 
z VARCHAR(30),
m INT
)

PARTITION BY RANGE COLUMNS(z) 
(
  PARTITION po VALUES LESS THAN ('m'),
  PARTITION p1 VALUES LESS THAN ('s'),
  PARTITION p2 VALUES LESS THAN ('z')
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                         /*PARTITION BY LIST COLUMNS*/ 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*PARTITION BY LIST*/ 

-- table will be partitioned based on a list of discrete values.
-- It's a way of telling MySQL, "I want to group rows into partitions based on specific values

/*COLUMNS*/

-- specifies that the partitioning will be based on the values of one or more columns. 
-- In traditional LIST partitioning, you can only partition based on a single column.
-- LIST COLUMNS allows for partitioning based on multiple columns if needed.


drop table employee_records; 

CREATE TABLE employee_records
(
   employee_id INT, 
   employee_name VARCHAR(100), 
   department VARCHAR(50),
   region VARCHAR(50),
   salary DECIMAL(10,2)
)
PARTITION BY LIST COLUMNS (department,region) 
(
   PARTITION P1 VALUES IN (('Sales','North'),('Marketing','North')),
   PARTITION p2 VALUES IN(('Sales','South'),('Marketing', 'South')),
   PARTITION p3 VALUES IN(('HR','East'),('Finance','East'))
) 




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															 /*LIST Partitioning*/ 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Based on Expressions: Traditional LIST partitioning is based on the evaluation of expressions, typically involving a single column's value.
-- Single Column: It's generally used with a single column, and the partition is determined by matching the column's value  against a list of discrete values.
-- Example: If you have a table with a status column that can have values like 1, 2, 3, etc., 
-- you could use LIST partitioning to create a partition for each status value.


CREATE  TABLE ineuron_courses9
(
course_name VARCHAR(50) ,
course_id INT(10) ,
course_title VARCHAR(60),
course_desc VARCHAR(80),
launch_date DATE,
course_fee INT,
course_mentor VARCHAR(60),
course_launch_year INT
)
PARTITION BY LIST COLUMNS(course_name)
(
  partition p0 values  in('aiops','data analytics','Dl','RL'),
  partition p1 values  in('fsds' ,'big data','blockchain'),
  partition p2 values  in('MERN','java','interview prep','fsda')
);



INSERT IGNORE  INTO ineuron_courses9 VALUES

('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105, 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 1011 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 1012 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 1013 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 1014 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 1015 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019);


SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'ineuron_courses9';





---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                               /*INSERT IGNORE INTO*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* variation of the regular INSERT statement*/
/*Handling Errors: Normally, if an INSERT operation encounters an error (like a duplicate key error in a table with a unique constraint), 
it stops and throws an error. However, when you use INSERT IGNORE, MySQL ignores these errors.*/
/*Duplicate Key Entries: If the error is due to a duplicate key entry (for a column with a UNIQUE constraint or a PRIMARY KEY), 
the row is not inserted, 
but the rest of the rows (if you're inserting multiple rows) will continue to be processed.*/

drop table ineuron_courses9; 

CREATE TABLE if not exists ineuron_courses9 
(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255)
);

INSERT IGNORE INTO ineuron_courses9 (course_id, course_name) VALUES
(1, 'Course A'),
(2, 'Course B'),
(1, 'Course C'), -- This has a duplicate course_id
(3, 'Course D');

/*In this case:*/

-- The rows with course_id 1, 2, and 3 will be inserted.
-- The second occurrence of course_id 1 (with 'Course C') will be ignored because of the duplicate key conflict.
-- No error will be thrown, and the insertion of 'Course D' will proceed normally.


select * from ineuron_courses9; /*Duplicates not inserted */ 







---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE  TABLE ineuron_courses10
(
course_name VARCHAR(50),
course_id INT(10),
course_title VARCHAR(60),
course_desc VARCHAR(80),
launch_date DATE,
course_fee INT,
course_mentor VARCHAR(60),
course_launch_year INT
)
PARTITION BY RANGE(course_launch_year)
   SUBPARTITION BY HASH(course_launch_year)
      SUBPARTITIONS 5 
      (
         partition p0 values less than (2019) ,
		 partition p1 values less than (2020) ,
		 partition p2 values less than (2021) ,
         partition p3 values less than (2022) 
	  );
   
   
      

 -------------------------------------------------------------------------------------------------------------------------------------------------------     
                                                  /*Altering the partions created in the Table*/
 -------------------------------------------------------------------------------------------------------------------------------------------------------     

/* How to alter an already created Table with Partitions*/ 

/* Ans - No direct way*/ 

/* Step- 1 : Create a new table with the desired partitioning scheme.*/
/*Step- 2: Insert data from the existing table into the new table.*/
/*Step- 3: ename the new table to the original table.*/
/* Step- 1 : Create a new table with the desired partitioning scheme.*/

drop table original_courses;

CREATE TABLE original_courses
( 
  course_id INT, 
  course_name VARCHAR(60), 
  course_launch_year DATE,
  course_duration INT,
  course_type VARCHAR(60)
  )
PARTITION BY RANGE(YEAR(course_launch_year))
(
   PARTITION p1990 VALUES LESS THAN (1990),
   PARTITION p2000 VALUES LESS THAN (2000),
   PARTITION p2010 VALUES LESS THAN (2010), 
   PARTITION p2020 VALUES LESS THAN (2020),
   PARTITION p2023 VALUES LESS THAN (2023),
   PARTITION p_current VALUES LESS THAN (MAXVALUE)
  ); 




   
SELECT PARTITION_NAME, PARTITION_ORDINAL_POSITION, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'original_courses';



INSERT INTO original_courses(course_id, course_name, course_launch_year,course_duration,course_type) VALUES
(101,'FSDA','2012-02-03',12,'professional'),
(102,'FSWD','2010-01-10',8,'professional'),
(103,'UPSC','2013-08-06',12,'Test prep');

select * from original_courses;


 /*Step- 2: Insert data from the existing table into the new table.*/

CREATE TABLE original_courses2
( 
  course_id INT, 
  course_name VARCHAR(60), 
  course_launch_year DATE,
  course_duration INT,
  course_type VARCHAR(60)
  )
PARTITION BY RANGE(YEAR(course_launch_year))
(
   PARTITION p1990 VALUES LESS THAN (1990),
   PARTITION p2000 VALUES LESS THAN (2000),
   PARTITION p2010 VALUES LESS THAN (2010), 
   PARTITION p2020 VALUES LESS THAN (2020),
   PARTITION p2023 VALUES LESS THAN (2023),
   PARTITION p_current VALUES LESS THAN (MAXVALUE)
  ); 

SELECT * FROM original_courses2; 

INSERT INTO original_courses2 SELECT * FROM original_courses; /*copied contents of a table and inserted it into a different table*/
SELECT * FROM original_courses2;



/*Step- 3: Rename the new table to the original table.*/

RENAME TABLE original_courses TO no_courses; /*1st Renamed the 1st table to a random name*/

RENAME TABLE original_courses2 TO original_courses; /*Then renamed the 2nd table as the first table*/

/* RENAME original_courses TO no_courses, original_courses2 TO orginal_courses; /*If you wish to do it in one Line*/ /*don't RUN*/



------------------------------------------------------------------------------------------------------------------------------------------------------
                                        /*--Can Partitioning and indexing used together*/
------------------------------------------------------------------------------------------------------------------------------------------------------

drop table orders; 
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
                                                                         /*INDEX*/
------------------------------------------------------------------------------------------------------------------------------------------------------

/*used to create an index on one or more columns of a table.*/
/*Indexes are special lookup tables that the database search engine can use to speed up data retrieval.*/

CREATE TABLE example_table (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (id),
    INDEX (age)
);

/*Adding an Index to an Existing Table:*/

ALTER TABLE example_table
ADD INDEX idx_name (column_name_of_the_table);

/*Creating a Composite Index:*/

CREATE INDEX idx_name_age ON example_table (column_name1_of_the_table, column_name2_of_the_table); 
/*Create Index is used after the Creation of table*/





/*Removing an Index:*/

ALTER TABLE example_table
DROP INDEX idx_name;


ALTER TABLE example3
ADD INDEX idx_name(column_name_of_the_table) 
CREATE INDEX idx_name ON example_table(column1, column2 ) ; 

CREATE INDEX idx ON example_table(column1, column2) 

------------------------------------------------------------------------------------------------------------------------------------------------------
                                                           /*AUTO_INCREMENT*/
------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE example3
(
   a INT AUTO_INCREMENT DEFAULT 1, 
   b INT, 
   c VARCHAR(30), 
   d INT CHECK (d>100), 
   e INT, 
   f INT,
   PRIMARY KEY (b)
);  /*Note this won't work because default value at auto_ncrement -> auto_increment does that by default*/


CREATE TABLE example3
(
   a INT AUTO_INCREMENT, 
   b INT, 
   c VARCHAR(30), 
   d INT CHECK (d>100), 
   e INT, 
   f INT,
   PRIMARY KEY (b)
); /*Note - this won't work as well because auto_icrement and Primary Key are both different*/


CREATE TABLE example3
(
   a INT AUTO_INCREMENT, 
   b INT, 
   c VARCHAR(30), 
   d INT CHECK (d>100), 
   e INT, 
   f INT,
   PRIMARY KEY (a)
); /*Executed*/ 

ALTER TABLE example3 AUTO_INCREMENT = 2;  /* So for auto_icrement default is set after the creation of Table*/




------------------------------------------------------------------------------------------------------------------------------------------------------



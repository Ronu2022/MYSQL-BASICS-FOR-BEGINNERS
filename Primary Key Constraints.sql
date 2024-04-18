CREATE DATABASE ineuron_dress_data;
USE ineuron_dress_data;

CREATE TABLE dress 
(
`Dress_ID` VARCHAR(30) ,
`Style` VARCHAR(30) ,
`Price` VARCHAR(30) ,
`Rating` VARCHAR(30) ,
`Size` VARCHAR(30) ,
`Season` VARCHAR(30) ,
`NeckLine` VARCHAR(30) ,
`SleeveLength` VARCHAR(30) ,
`waiseline` VARCHAR(30) ,
`Material` VARCHAR(30) ,
`FabricType` VARCHAR(30) ,
`Decoration` VARCHAR(30) ,
`Pattern Type` VARCHAR(30) ,
`Recommendation` VARCHAR(30) 
)


select * from dress; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                               /*TOPIC 1: INSERTING RECORDS IN BULK*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AttributeDataSet.csv'
INTO TABLE dress
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; /*this wont work would showacess restriction*/

----------------------------------------------------------------------------------------------------------------------------------------------------
#solution

-- file must be in d drive,
-- file must be in a a folder name should be without spaces. that is the folder name
-- remove local from the above

----------------------------------------------------------------------------------------------------------------------------------------------------

select @@secure_file_priv; 

show global variables like 'local_infile';
set global local_infile = 1;

load data infile 'D:/files/AttributeDataSet.csv' #removed local
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows; 

select * from dress; 


-----------------------------------------------------------------------------------------------------------------------------------------------------
# NOTE FOR SOME REASON THE ABOVE CODES NOT WORKING SHOWNG RESTRICTION ACCESS ERROR*/
# I THUS DIRECTLY IMPORTED AND CREATED DRESS2 table;
-----------------------------------------------------------------------------------------------------------------------------------------------------


SELECT * from dress2;

/*There is one more way */ 

CREATE TABLE test_load
 (
`Dress_ID` VARCHAR(30) ,
`Style` VARCHAR(30) ,
`Price` VARCHAR(30) ,
`Rating` VARCHAR(30) ,
`Size` VARCHAR(30) ,
`Season` VARCHAR(30) ,
`NeckLine` VARCHAR(30) ,
`SleeveLength` VARCHAR(30) ,
`waiseline` VARCHAR(30) ,
`Material` VARCHAR(30) ,
`FabricType` VARCHAR(30) ,
`Decoration` VARCHAR(30) ,
`Pattern Type` VARCHAR(30) ,
`Recommendation` VARCHAR(30) 
);

SELECT * FROM test_load; /*SEE DATA LOADED -> How -> Go to Database (HERE dress_data)  -> Right click -> Table Data import Wizard*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*COPYING OF A TABLE*/ - /*LIKE KEYWORD*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE test_load_copy LIKE test_load; /*See - a copy of the table os created*/ 





/*In real case scenarios it is always advisable to ccopy the table and then play with it, never tamper original Table*/ 

INSERT INTO test_load_copy SELECT * FROM test_load;
SELECT * FROM test_load_copy; /*Copied the entire Content*/ 



drop table sample_table; 

create table sample_table as select * from dress;  -- Copies Content and structure from the table. 
select * from sample_table; 


drop table sample_table2; 

create table sample_table2 as select Dress_ID, Style,Price from dress; -- Copies Content and structure from the table. 
select * from sample_table2; 


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                 /*TOPIC 2: AUTO INCREMENT */
-------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE test0
(
test_id INT AUTO_INCREMENT,
test_name VARCHAR(30) ,
test_mailid VARCHAR(30) ,
test_adress VARCHAR(30)
) /*Note : IF WE EXECUTED This = spoke of Incorrect Table defination and there could be 1 auto column and must be defined as a key*/

CREATE TABLE test(
test_id INT AUTO_INCREMENT ,
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) ,
PRIMARY KEY (test_id))



SELECT * from test. /* IF I am selecting - there is no record - lets insert some*/

insert into test values ('sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
('krish','krish@gmail.com', 'bengalore' , 30000),
('hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
('shubahm' , 'shudham@gmail.com', 'jaipur',20000) /* IF I am executing this - Error - says incorrect integer value - Let's try other way */

insert into test values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
(2,'krish','krish@gmail.com', 'bengalore' , 30000),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur',20000) /*again - error= Column count doesn't match Why?? note - we had 4 columns but here data for 5 so mismatch- lets try chnaging*/

insert into test values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore'),
(2,'krish','krish@gmail.com', 'bengalore'),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore'),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur') /*Look - this is fixed - but what about auto incrfement ? here we had to insert numbers, let's change for auto increment */
SELECT * FROM test


CREATE TABLE test2(
test_id INT NOT NULL AUTO_INCREMENT ,
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) ,
PRIMARY KEY (test_id))

insert into test2 values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore'),
(2,'krish','krish@gmail.com', 'bengalore'),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore'),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur')

insert into test2 values ('sudhanshu','sudhanshu@ineuron.ai','benglaore'),
('krish','krish@gmail.com', 'bengalore'),
('hitesh' ,'hitesh@ineuron.ai','bengalore'),
('shubahm' , 'shudham@gmail.com', 'jaipur') /*SEE HERE THE COLUMN DOESNT MATCH ROW COUNT - ERROR */ /*BECAUSE THERE WAS NO MAPPING*/


insert into test2(test_name, test_mailid,test_address)  values ('sudhanshu','sudhanshu@ineuron.ai','benglaore'),
('krish','krish@gmail.com', 'bengalore'),
('hitesh' ,'hitesh@ineuron.ai','bengalore'),
('shubahm' , 'shudham@gmail.com', 'jaipur') /*SEE HERE THE COLUMN DOESNT MATCH ROW COUNT - ERROR */

SELECT * FROM test2  /*CHECK WE DIDNT INSERT ANY RECORD FOR test_id but still done*/



-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                    /*ANAND's CLASS CONTENT ON AUTO_INCREMENT*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE class_database; 
USE class_database; 

CREATE TABLE airlines
(
  id INT AUTO_INCREMENT PRIMARY KEY, 
  `name` VARCHAR(50)
) AUTO_INCREMENT = 500; 

INSERT INTO airlines(`name`) VALUES
('Ajay'), 
('Shipra'), 
('Subhra'),
('Raktim'); 

SELECT * FROM airlines; 



-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                    /*TO CHECK LAST INERTED ID*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT LAST_INSERT_ID();  /*CHECKS THE LAST INSERTED ID*/ 






 



-------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE airlines AUTO_INCREMENT = 600;  /*If we need to change the value of Auto_increments*/ 

create table


-- Only 1 Auto_increment Per table allowed 
-- Primary Key or Unique Must be specified. 
-- DEFAULT keyword not allowed.
-- You can't reset auto_increment Counter to the value less or equal to the current maximum value. /*VERY IMP*/ 
-- AFTER you have deleted all rows the counter is not automatically set to the start value; 




 
-------------------------------------------------------------------------------------------------------------------------------------------------------
                    /*To generate the auto_incremented value You could Ommit the column from the Insert Statement or simply add NULL or Zero*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------



INSERT INTO airlines(`name`) VALUES ('Nitish'); 
INSERT INTO airlines VALUES(NULL, 'Sonia'); 
INSERT INTO airlines VALUES(0,'Rajat'); 

SELECT * FROM airlines; 


INSERT INTO airlines(`name`) VALUES('RAJAT'); 
INSERT INTO airlines VALUES(NULL, 'Rajat'); 
INSERT INTO airlines VALUES(NULL, 'Sophia'); 

SELECT * FROM airlines; 

INSERT INTO airlines VALUES
(1000,'Dimpy');  /*This will be executed and the very moment auto_increment sequence would break and the next entries would start from there itself*/ 

SELECT * FROM airlines; /*mark after 506 it sets with 1000*/ 

INSERT INTO airlines(`name`) VALUES('Jeeva'); 
INSERT INTO airlines VALUES(NULL, 'Abhay'); 
INSERT INTO airlines VALUES(0, 'Rojalin'); 

SELECT * FROM airlines;  /*mark afyer 1000 it gain starts with 1001,then 1002 and so on*/ 



INSERT INTO airlines VALUES(NULL, 'Kheera'); 
INSERT INTO airlines VALUES(NULL, 'Bishnu'); 

SELECT * FROM airlines; 
INSERT INTO airlines VALUES(NULL, 'Jivika'); 

INSERT INTO airlines VALUES(508,'Dhoni'); 
INSERT INTO airlines VALUES(NULL,'Sampoorna'); 
INSERT INTO airlines Values(0, 'Virat'); 

SELECT * FROM airlines; 


-------------------------------------------------------------------------------------------------------------------------------------------------------
-- You can't reset auto_increment Counter to the value less or equal to the current maximum value. /*VERY IMP*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT LAST_INSERT_ID(); /*so it is 1008*/ 














ALTER TABLE airlines AUTO_INCREMENT = 600; /*this would be executed bu won't show up any results, next insertion would make the counter 1009 not 600*/ 


-------------------------------------------------------------------------------------------------------------------------------------------------------
                    /*-- AFTER you have deleted all rows the counter is not automatically set to the start value*/
-------------------------------------------------------------------------------------------------------------------------------------------------------

SET SQL_SAFE_UPDATEs = 0; 

DELETE FROM airlines;  /*THIS DELETES ALL ROWS*/ 






SELECT * FROM airlines; 
 
INSERT INTO airlines Values(0, 'Virat'); 
INSERT INTO airlines VALUES(NULL,'Sampoorna'); 

SELECT * FROM airlines;  /*Starts from 1009 - coz last was 1008*/ 

SELECT LAST_INSERT_ID();  /*1010 it is*/ 







-------------------------------------------------------------------------------------------------------------------------------------------------------
                    /*-- TO RESET THE AUTO_INCREMENT TO INITIAL VALUE: TABLE NEEDS TO BE EMPTY*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM airlines; /*table Emptied*/ 

ALTER TABLE airlines AUTO_INCREMENT = 100; 

INSERT INTO airlines Values(0, 'Virat'); 
INSERT INTO airlines VALUES(NULL,'Sampoorna'); 

SELECT * FROM airlines;  /*now it got fixed and started from 100*/ 











-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            /*TOPIC 3: CHECK CONSTRAINT */
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test6(
test_id int ,
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) ,
test_salary INT CHECK(test_salary > 100000))



INSERT INTO test6(test_id,test_name,test_mailid,test_address,test_salary) VALUES('1','Ronu','ronu@gmail.com','Kolkata','90000'),
('4','Krish','Krish@gmail.com','Delhi','200000'),
('10','Ludul','ludul@gmail.com','Mumbai','1200000') /*Note Check 1 is Violeted coz salary is less than 100000- ERROR*/

INSERT INTO test6(test_id,test_name,test_mailid,test_address,test_salary) VALUES('1','Ronu','ronu@gmail.com','Kolkata','1000000'),
('4','Krish','Krish@gmail.com','Delhi','200000'),
('10','Ludul','ludul@gmail.com','Mumbai','1200000') /*This is well executed*/


Select * from test6

CREATE TABLE test7(
test_id int ,
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) CHECK(test_address = 'Bengaluru') ,
test_salary INT CHECK(test_salary > 100000))

INSERT INTO test7(test_id,test_name,test_mailid,test_address,test_salary) VALUES('1','Ronu','ronu@gmail.com','Kolkata','10000'),
('4','Krish','Krish@gmail.com','Delhi','200000'),
('10','Ludul','ludul@gmail.com','Mumbai','1200000'),
('32', 'Harish', 'harish@gmail.com', 'Bengaluru','200000'),
('44','Sheema','sheema@gmail.com','Bengaluru', '1400000') /*CHECKS VIOLATED ERROR*/

INSERT INTO test7(test_id,test_name,test_mailid,test_address,test_salary) VALUES('1','Ronu','ronu@gmail.com','Bengaluru','200000'),
('4','Krish','Krish@gmail.com','Bengaluru','200000'),
('10','Ludul','ludul@gmail.com','Bengaluru','1200000'),
('32', 'Harish', 'harish@gmail.com', 'Bengaluru','200000'),
('44','Sheema','sheema@gmail.com','Bengaluru', '1400000') /*EXECUTED WITHOUT ANY ISSUE*/


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                               /*JUST FOR SELF PRACTISE*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

Select * from test7
Select * from test7 ORDER BY test_salary desc
SELECT * from test7 ORDER BY test_name 

SELECT * from test7 ORDER BY test_name desc limit 1

/* IF we wish to use Auto_Increment, NOT NULL and DEFAULT*/ 

/*DON't RUN IT*/

CREATE TABLE OCT3(
a INT NOT NULL AUTO_INCREMENT DEFAULT 0,  /*The DEFAULT value for an auto-increment column should not be specified => ERROR!!*/
b VARCHAR (30), 
c INT, 
d INT CHECK (d > 100)
PRIMARY KEY (a) )


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   /*TO START AUTO_INCREMENT FROM A SPECIFIC VALUE*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE OCT10
( 
   a INT NOT NULL AUTO_INCREMENT, 
   b VARCHAR(30), 
   c INT, 
   d INT CHECK (d > 100), 
   PRIMARY KEY (a)
)AUTO_INCREMENT = 1;  /*This will start auto_increment from1*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE OCT3 
(
    a INT NOT NULL AUTO_INCREMENT,
    b VARCHAR(30),
    c INT,
    d INT CHECK (d > 100),
    PRIMARY KEY (a)
);


insert into OCT3(b,c,d) values
('ronu',22,101),
('Ajay', 32,104),
('Roshni', 43, 110)

select * from OCT3; 


create table OCT4 
(
 a INT ,
    b VARCHAR(30),
    c INT,
    d INT CHECK (d > 100),
    PRIMARY KEY (a)
);


 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
                  /* In the above Table How To remove the AUTO_INCREMENT and NOT NULL constraints from column a after the table has been created*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Step 1 : Step 1: Create a new temporary table without the AUTO_INCREMENT and NOT NULL constraints on column 'a'*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tempOCT3(
a INT, 
b VARCHAR(30), 
c INT, 
d INT CHECK (d > 100), 
PRIMARY KEY (a))




/*Step 2 : Step 2: Copy data from the original Table OCT3 to the newly created Table  OCT3_temp*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tempOCT3(a,b,c,d) SELECT a,b,c,d FROM OCT3; 




/*Step 3: Drop the original table OCT3*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE OCT3; 



/* Step 4 : -- Step 4: Rename the temporary table OCT3_temp to OCT3*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE tempOCT3 RENAME TO OCT3; 




-------------------------------------------------------------------------------------------------------------------------------------------------------------

/* Questions on DEFAULT*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  /*Q. Can you specify a default value for a column that allows NULL values? Explain.*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Example (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) DEFAULT 'Unknown', /*This means that if a value is not provided during an insert operation, the column will automatically be set to 'Unknown'.*/
    Age INT,
    Email VARCHAR(50) DEFAULT NULL /* This means that if a value is not provided during an insert operation, the column will be set to NULL.*/


);
 



-------------------------------------------------------------------------------------------------------------------------------------------------------------
/# Q. Can you change the default value of an existing column in a MySQL table? How would you do it? #/
-------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE sample_test
( 
 
 Sl_no INT AUTO_INCREMENT, 
  id INT, 
  `Name` VARCHAR(30), 
  Email_id VARCHAR(80),
  PRIMARY KEY (Sl_no)
  
) AUTO_INCREMENT = 1; 

INSERT INTO sample_test(id, `Name`, Email_id) VALUES
(22,'Ronu', 'ronu@gmail.com'), 
(24, 'Ajay', 'ajay@gmail.com'), 
(26, 'Deepak', 'Deepak@gmail.com')

SELECT * FROM sample_test; 

ALTER TABLE sample_test
ALTER COLUMN `Name` SET DEFAULT 'Pending';  /*Changed the default*/ 







INSERT INTO sample_test(id,Email_id) VALUES
(26,'raj@gmail.com'); 

INSERT INTO sample_test(id,Email_id) VALUES
(28,'dhiraj@gmail.com'); 

SELECT * FROM sample_test;  /*Check this, WHereever missing Pending is Placed"/ 



/*DON't RUN*/ 

ALTER TABLE Example 
ALTER COLUMN Email SET DEFAULT 



-------------------------------------------------------------------------------------------------------------------------------------------------------------
                         /# Q. If a column has a default value defined, does it require an explicit value during an update operation? */ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

/* ANS - NO It Doesn't Require*/ 

CREATE TABLE OCT6(
id INT PRIMARY KEY, 
Name VARCHAR(30) DEFAULT 'Not Present',
age INT, 
income VARCHAR(30) DEFAULT 'Pending', 
email VARCHAR(30) DEFAULT NULL)




INSERT INTO OCT6(id, age) VALUES
(22,64), 
(4,22), 
(11, 63) ,
(8, 92), 
(26, 44) 

SELECT * FROM OCT6

UPDATE OCT6. /* Update the record without providing a value for 'Name' and 'Email'*/ /*Explicit mentioning not Required*/ 
SET age = 68 WHERE id = 8;

SELECT * FROM OCT6

drop table OCT6; 

CREATE TABLE OCT6
( 
  id INT PRIMARY KEY, 
  NAME VARCHAR(30) DEFAULT 'Not Present', 
  age INT, 
  income VARCHAR(30) DEFAULT 'Pending',
  Email VARCHAR(30)  DEFAULT NULL
  ); 
  
ALTER TABLE OCT6 
ALTER COLUMN EMAIL SET DEFAULT 'Pending';





-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                 /*TOPIC 4: ALTER TABLE*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test6( /*LET's SAY we forgot to add a constratined to test_id, and the table is created, later we could change it by ALTERTABLE*/
test_id int ,
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) ,
test_salary INT CHECK(test_salary > 100000))

ALTER TABLE test6 ADD CHECK (test_id > 0)




INSERT INTO test6(test_id,test_name,test_mailid,test_address,test_salary) VALUES('-1','Ronu','ronu@gmail.com','Kolkata','10000'),
('4','Krish','Krish@gmail.com','Delhi','200000'),
('10','Ludul','ludul@gmail.com','Mumbai','1200000'),
('32', 'Harish', 'harish@gmail.com', 'Bengaluru','200000'),
('44','Sheema','sheema@gmail.com','Bengaluru', '1400000') /*CASE OF VIOLATION*/

INSERT INTO test6(test_id,test_name,test_mailid,test_address,test_salary) VALUES('1','Ronu','ronu@gmail.com','Kolkata','10000000'),
('4','Krish','Krish@gmail.com','Delhi','200000'),
('10','Ludul','ludul@gmail.com','Mumbai','1200000'),
('32', 'Harish', 'harish@gmail.com', 'Bengaluru','200000'),
('44','Sheema','sheema@gmail.com','Bengaluru', '1400000')

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                   /* TOPIC 5 :DEFAULT */
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test8(
test_id int NOT NULL , /*i.e ehatever value you are inserting, it shouldnt be Null at any time*/
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) CHECK(test_address = 'Bengaluru') ,
test_salary INT CHECK(test_salary > 100000))

INSERT INTO test8(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu','sudhanshu@gmail.com','Bengaluru','200000') /*ERROR - TEST_ID DOESN'T CONTAIN DEFAULT VALUE*/
 
 /*So Either I have to give some record or USE 'DEFAULT' */
 
INSERT INTO test8(test_id,test_name,test_mailid,test_address,test_salary)VALUES ('1','Sudhanshu','sudhanshu@gmail.com','Bengaluru','200000')/*OKAY!!*/





/* NOTE: IF I WISH THE SYSTEM TO INCORPORATE RECORDS FOR test_iD I COULD USE AUTO INCREMENT TOO!! */

CREATE TABLE test9(
test_id int NOT NULL DEFAULT 0, /*SOME MIGHT HAVE test_ID SOme MAynot for them it is to be put 0 by Default*/
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) ,
test_address VARCHAR (30) CHECK(test_address = 'Bengaluru') ,
test_salary INT CHECK(test_salary > 100000))

INSERT INTO test9(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu','sudhanshu@gmail.com','Bengaluru','200000'),
('Krish','Krish@gmail.com','BENGALURU','200000')

INSERT INTO test9(test_id,test_name,test_mailid,test_address,test_salary)VALUES ('100','HENRY','henry@gmail.com','Bengaluru','200000'),
('2000','raja','raja@gmail.com','BENGALURU','200000')

Select*from test9 /*HERE we used values for test_id, where it doesn't operate - by deafult it is 0*/


-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             /*TOPIC 6: UNIQUE CONSTRAINT*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test10(
test_id int NOT NULL DEFAULT 0,  /*Note- A column can have default value and still have a not null constraint*/ 
test_name VARCHAR(30) ,
test_mailid VARCHAR (30) UNIQUE ,
test_address VARCHAR (30) CHECK(test_address = 'Bengaluru') ,
test_salary INT CHECK(test_salary > 100000))




drop table abc;

CREATE TABLE xyg2 
( 
  id INT NOT NULL DEFAULT '0000', 
  age INT, 
  `NAME` VARCHAR(300) NOT NULL DEFAULT 'Pending**'
); 

INSERT INTO test10(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu','sudhanshu@gmail.com','Bengaluru','200000') /*Look for 1 time execution it is working but, Multiple execution , it wont because EMAIL ID has to be unique*/
INSERT INTO test10(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu','sudhanshu@gmail.com','Bengaluru','200000') /*DUPLICATE ENTRY*/
INSERT INTO test10(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu1','sudhanshu1@gmail.com','Bengaluru','200000')/*Working*/
Select * from test10

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                       /* the CHECK constraint and how it can be defined using the CONSTRAINT keyword. */
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CONSTRAINT chk_subquery_example CHECK (SELECT COUNT(*) FROM table_name WHERE condition) >= 1



-------------------------------------------------------------------------------------------------------------------------------------------------------------
                       /*TO NAME UNIQUE CONSTRAINT AND TO DEFINE UNIQUE CONSTRAINT ON MULTIPLE COLUMNS*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test11(
x INT NOT NULL,
Y VARCHAR(30),
Z VARCHAR (30),
CONSTRAINT abc UNIQUE(x,z))



CREATE TABLE ABC
( 
 a INT NOT NULL, 
 b VARCHAR(30), 
 c VARCHAR(40), 
 d VARCHAR(60), 
 CONSTRAINT neW_this UNIQUE (b,c)); 
 
 
  
  

CREATE TABLE ABC
( 
  a INT NOT NULL, 
  b INT , 
  c VARCAHR(30), 
  d VARCHAR(30), 
  d VARCAHR(30), 
  CONSTRAINT constraint_new UNIQUE(c,d,e)
  ); 
  
  ALTER TABLE abc
  ADD UNIQUE (z); 
  



ALTER TABLE xyg
DROP INDEX abc; 

 

/*Lets say in the above test11 Table - I wish to make Z also Unique by altering*/

ALTER TABLE test11 
ADD UNIQUE (Z);


/*Lets say I wish to Drop the Constraint Named 'abc' */

ALTER TABLE test11
DROP INDEX abc; 

/*If In wish to drop Unque for one Variable*/

Alter Table test11
Drop INDEX z; 

/*Using Default Constraint with a Constraint Name*/ /*Don't RUN*/  /* This is not possible in MYSQL*/


CREATE TABLE example 
(
    id INT PRIMARY KEY,
    name VARCHAR(50) CONSTRAINT df_name DEFAULT 'Unknown',
    age INT CONSTRAINT df_age DEFAULT 25,
    email VARCHAR(50) CONSTRAINT df_email DEFAULT 'example@example.com'
); 




ALTER TABLE example /*DON'T RUN*/
DROP INDEX df_name

ALTER TABLE example 
DROP INDEX df_email /*DON't RUN*/ 



-------------------------------------------------------------------------------------------------------------------------------------------------------------
              /*MARK THE DIFFERENCE _ PRIMARY KEY WAS ALASO MEANT TO BE unique IN NATURE, SO DIFFERENCE between Primary Key and Unique??*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

/* PRIMARY KEY - USED TO BUILD RELATIONSHIP BETWEEN 1 TABLE AND THE OTHER and only one column could be held primary at any given point */

/* UNIQUE ANY NO OF COLUMNS COULD BE USED*/
/*Primary Key - Can't hold Null Values but UNIQUE can */ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                              /* TOPIC 6 : USING NULL, AUTO INCREMENT, UNIQUE, CHECK , PRIMARY KEY in one code*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test111(
test_id int NOT NULL AUTO_INCREMENT, 
test_name VARCHAR(30) NOT NULL DEFAULT 'unknown',
test_mailid VARCHAR (30) UNIQUE ,
test_address VARCHAR (30) CHECK(test_address = 'Bengaluru') ,
test_salary INT CHECK(test_salary > 100000) NOT NULL,
PRIMARY KEY (test_id))
INSERT INTO test111(test_id,test_name,test_mailid,test_address,test_salary)VALUES ('222','Sudhanshu4','sudhanshu4@gmail.com','Bengaluru','200000')
/*USED test_id just for 1st Insertion*/

SELECT * FROM test111

INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu5','sudhanshu6@gmail.com','Bengaluru','200000')

SELECT * FROM test111 /* if u see this the 1st iserted id. was 222, thus the 2nd becomes 223 coz of auto increment*/

INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu6','sudhanshu7@gmail.com','Bengaluru','200000')
SELECT * FROM test111 

/* LET's use the MANUAL oNE AGAIN using test_id*/

INSERT INTO test111(test_id,test_name,test_mailid,test_address,test_salary)VALUES ('432','Sudhanshu7','sudhanshu8@gmail.com','Bengaluru','200000')

SELECT * FROM test111

/*Again use without Test_id through auto increment*/

INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu10','sudhanshu10@gmail.com','Bengaluru','200000')

SELECT *FROM test111 /*MARK HERE autoincrement starts from 432 - next 433,  so on!!*/

/*LET'S SAY after this there is an error statement and again post that you made changes and executed well so the increment happens 432 - 433 - ERROR (434) - 435 (corrected) - this would reflect*/


INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu4','sudhanshu4@gmail.com','Bengaluru','200000') /*Look for 1 time execution it is working but, Multiple execution , it wont because EMAIL ID has to be unique*/
INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu2','sudhanshu2@gmail.com','Bengaluru','200000') /*DUPLICATE ENTRY*/
INSERT INTO test111(test_name,test_mailid,test_address,test_salary)VALUES ('Sudhanshu3','sudhanshu3@gmail.com','Bengaluru','200000')

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                           /* Delete Data:*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM test111
WHERE test_name = 'Sudhanshu4'; 

# WHAT IF YOU ARE ASKED TO CHECK DUPLICATES IN A TABLE AND THEN KEEP THE FIRST ROW AND THEN REMOVE THE OTHERS 


DROP TABLE customers; 
CREATE TABLE customers 
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers (customer_id, first_name, last_name, email) 
VALUES 
    (1, 'John', 'Doe', 'john@example.com'),
    (2, 'Jane', 'Smith', 'jane@example.com'),
    (3, 'John', 'Doe', 'john.doe@example.com'),
    (4, 'Alice', 'Johnson', 'alice@example.com'),
    (5, 'Bob', 'Smith', 'bob@example.com'),
    (6, 'Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO customers (customer_id, first_name, last_name, email) 
VALUES (7, 'John', 'Doe', 'john@example.com');





select row_number() over (ORDER BY customer_id),customer_id,first_name,last_name,email from customers; 

-- generates a unique sequential integer for each row in the result set.
-- The ORDER BY customer_id clause orders the rows based on the customer_id.
-- Each row will have a unique row number based on the order of customer_id.
-- therefore there are no changes in row_number each are given unique numbers.

select ROW_NUMBER() OVER (PARTITION BY first_name, last_name, email ORDER BY customer_id ), customer_id,first_name,last_name,email from customers; 

-- NOTE: first_name, last_name, email they are ordered alphabetically and within those partitions for dupllicates , they are ordered by customer_id
-- ROW_NUMBER() function generates a unique sequential integer for each row within each partition defined by first_name, last_name, and email.
-- PARTITION BY first_name, last_name, email clause divides the rows into partitions based on the values of first_name, last_name, and email.
-- Within each partition, the rows are ordered by customer_id ASC.
-- Each row within a partition will have a unique row number based on the order of customer_id, 
-- but the row numbers will restart from 1 for each distinct combination of first_name, last_name, and email


-- Now to check dupliate value we must delete the row where the row_number is > 1 => this would indicate duplicates




SELECT customer_id FROM
(
   SELECT ROW_NUMBER() OVER (PARTITION BY first_name, last_name,email ORDER BY customer_id) AS row_count2, customer_id,first_name,last_name,email
   FROM customers
) AS alias_table WHERE row_count2 > 1;-- this gives the desired customer_id where row_number() > 1

-- we cant directly delete from a TABLE thus this step was required 


DELETE FROM customers WHERE customer_id IN
(
		SELECT customer_id FROM
	(
	   SELECT ROW_NUMBER() OVER (PARTITION BY first_name, last_name,email ORDER BY customer_id) AS row_count2, customer_id,first_name,last_name,email
	   FROM customers
	) AS alias_table WHERE row_count2 > 1
);

select * from customers;  -- DELETED. 


-- Let's insert one more duplicate 

INSERT INTO customers (customer_id, first_name, last_name, email) 
VALUES (8, 'Jane', 'Smith', 'jane@example.com');

SELECT * FROM customers;


--------------------------------------------------------------------------------------------------------------------------------------------
# REMOVING DUPLICATES WITHOUT WINDOWING FUNCTION : Not yet confirmed needs to be checked later 
--------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM customers; # Duplcate value is that of Jane and Smith 

CREATE TEMPORARY TABLE customer_temp AS SELECT * FROM customers; 

DELETE t11 FROM customers AS t11
WHERE EXISTS
(
	SELECT 1 FROM customer_temp AS t12 WHERE
	t11.customer_id < t12.customer_id
	AND t11.first_name = t12.first_name
	AND t11.last_name = t12.last_name
	AND t11.email = t12.email
);


SELECT * FROM customers; 








------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /* DROP  DATABASE:*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP DATABASE dress_data;  /*Don't Run*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT USER();  /*Gives User name associated with MY SQL Connection*/ 

SELECT CURRENT_USER(); /**Gives User name associated with MY SQL Connection*/

SELECT CURRENT_USER(); 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									/* CHANGING THE NAME OF THE DATABASE THAT IS ALREADY CREATED/ IMPORTING FROM ONE DATA BASE TO THE OTHER*/ 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE data_base1; 
CREATE DATABASE data_base2; 


mysqldump -u username -p data_base1 > dump.sql  /*This ould Dump the Data- Has to be run on BASH -> i.e TERMINAL */
/*Dumping = Like taking a SS of the File and storing it temporarily*/ 

mysql -u username -p data_base2 < dump.sql /*This is importing it into the New Data base- here data_base2*/ 

DROP DATABASE data_base1;  /*Post that you could drop the database*/ 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------








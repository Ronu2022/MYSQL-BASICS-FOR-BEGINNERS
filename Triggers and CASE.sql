

CREATE DATABASE ineuron_triggers_case;
USE ineuron_triggers_case; 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                          /*WHAT ARE TRIGGERS*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

	-- database objects that are automatically executed or fired when certain events occur. 
	-- used to automatically perform a specified SQL action when a specified event happens on a specified table.
	-- These events can be an INSERT, UPDATE, or DELETE operation.

  

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                    /*Types of Triggers in MySQL:*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


	-- BEFORE Trigger: Executed before the specified operation (INSERT, UPDATE, DELETE).
	-- AFTER Trigger: Executed after the specified operation.


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                         /*BASIC SYNTAX:*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name FOR EACH ROW
BEGIN
trigger_body
END //





DROP TRIGGER IF EXISTS after_employee_insert;

DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
INSERT INTO audit_log (operation, changed_by, changed_on)
VALUES ('INSERT', NEW.employee_id, NOW());
END //



  





-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*Example 1: Creating a Trigger for INSERT Operation*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Suppose we have a table employees and we want to create a trigger 
that automatically sets a timestamp in an audit_log table every time a new employee is added.*/


CREATE DATABASE triggers_class;
USE triggers_class; 

DROP TABLE employees10;
CREATE TABLE employees10
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    position VARCHAR(100),
    hire_date DATE
);

DROP TABLE audit_log10; 

CREATE TABLE audit_log10
 (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    operation VARCHAR(50),
    changed_by INT,
    changed_on DATETIME
);


SELECT * FROM employees10;
SELECT * FROM audit_log10; 


DROP TRIGGER IF EXISTS after_employee_insert;

DELIMITER &&
CREATE TRIGGER  after_insert_employees10
AFTER INSERT ON employees10 FOR EACH ROW
BEGIN 
	 INSERT INTO audit_log10(operation,changed_by, changed_on) VALUES
	 ('INSERT', NEW.employee_id, NOW());
END &&


DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees10 FOR EACH ROW
BEGIN
	INSERT INTO audit_log10 (operation, changed_by, changed_on)
	VALUES ('INSERT', NEW.employee_id, NOW());
END //

   # NEW: 
      -- In the context of triggers in databases, NEW is a keyword that refers to the new row being affected by an operation like INSERT or UPDATE.
      -- New row here is the new row that was inserted in the employees10 Table after which the Trigger got activated. 
      -- It allows you to access the values of columns in the new row being inserted or updated.
      

SELECT * FROM employees10;
SELECT * FROM audit_log10;

INSERT INTO employees10 (name, position, hire_date) VALUES ('Alice', 'Developer', '2022-01-10');
INSERT INTO employees10 (name, position, hire_date) VALUES ('Bob', 'Designer', '2022-01-15');
INSERT INTO employees10(name, position, hire_date) VALUES ('Charlie', 'Manager', '2022-02-01');
INSERT INTO employees10(name, position, hire_date) VALUES ('Ronu', 'Sr.Manager', '2022-02-10');


/*Let's test the trigger*/ 




SELECT * FROM employees10; 
SELECT * FROM audit_log10; 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                        # PRACTISE TABLE FOR UPDATE TRIGGER
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE IF EXISTS employee_sample_table;

CREATE TABLE IF NOT EXISTS employee_sample_table
(
   employee_id INT, 
   `name` VARCHAR(30),
   Designation VARCHAR(40),
   hire_date DATE
); 

DROP TABLE IF EXISTS update_capture_table;

CREATE TABLE  IF NOT EXISTS update_capture_table
(
   log_id INT AUTO_INCREMENT PRIMARY KEY,
   operation VARCHAR(30), 
   changed_by INT,
   changed_on DATE
); 

DELIMITER &&
CREATE TRIGGER insert_trial
AFTER INSERT ON employee_sample_table FOR EACH ROW
BEGIN
INSERT INTO update_capture_table (operation,changed_by, changed_on)
VALUES ('Insert', NEW.employee_id, NOW());
END &&

INSERT INTO employee_sample_table (employee_id, `name`, Designation,hire_date) VALUES
(122,'Ronu', 'Tele', '2014-01-10');

SELECT * FROM employee_sample_table;
SELECT * FROM update_capture_table;

INSERT INTO employee_sample_table (employee_id, `name`, Designation,hire_date) VALUES
(124,'Trimurty', 'Ops', '2015-01-10');

SELECT * FROM employee_sample_table;
SELECT * FROM update_capture_table;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                          /*Example 2: Creating a Trigger for UPDATE Operation.*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Step 1: Create the employees Table

DROP TABLE employees2;

CREATE TABLE employees2
( 
  employee_id INT AUTO_INCREMENT PRIMARY KEY, 
  `name` VARCHAR(100), 
  salary DEC(10,2)
); 
  
-- Step 2: Create the salary_changes Table
/* Next, create a table to log changes to the employees' salaries:*/


DROP TABLE salary_changes;

CREATE TABLE salary_changes
( 
  change_id INT AUTO_INCREMENT PRIMARY KEY, 
  employee_id INT, 
  old_salary DECIMAL(10,2), 
  new_salary DECIMAL(10,2), 
  change_date DATETIME, 
  FOREIGN KEY (employee_id) REFERENCES employees2(employee_id)
); 





SELECT * FROM employees2;
SELECT * FROM salary_changes;


-- Step 3: Insert Some Data into employees   

INSERT INTO employees2 (name, salary) VALUES ('Alice', 70000.00);
INSERT INTO employees2 (name, salary) VALUES ('Bob', 80000.00);

SELECT * FROM employees2; 
SELECT * FROM salary_changes;

-- Step 4: Create the Trigger for UPDATE
/*Now, create a trigger that logs changes to the salary column:*/


DROP TRIGGER IF EXISTS after_salary_employees2_update;

Delimiter &&
Create Trigger after_salary_employees2_update
After Update on employees2 For Each Row
Begin 
  If old.salary <> new.salary then 
	Insert into salary_changes(employee_id,old_salary,new_salary,change_date) VALUES
    (old.employee_id, old.salary, new.salary,current_date());
  End if ;
End &&
       








DELIMITER &&
CREATE TRIGGER after_salary_employees2_update
AFTER UPDATE ON employees2 FOR EACH ROW
BEGIN 
  IF 
	  NEW.salary != OLD.salary  THEN
		   INSERT INTO salary_changes(employee_id,old_salary,new_salary,change_date) VALUES
		   (OLD.employee_id, OLD.salary, NEW.salary,DATE(NOW()));
  END IF;
END &&


/*This trigger activates after a row in the employees table is updated. 
It checks if the salary was changed (comparing NEW.salary with OLD.salary). 
If so, it logs the old and new salary values along with the employee_id and the timestamp of the change in the salary_changes table.*/

DELIMITER // 
CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees2 FOR EACH ROW 
BEGIN 
   IF 
   NEW.salary <> OLD.salary THEN 
        INSERT INTO salary_changes(employee_id, old_salary, new_salary, change_date) 
        VALUES (OLD.employee_id,OLD.salary, NEW.salary, NOW());
   END IF; 
END //

DELIMITER ; 


/*This trigger activates after a row in the employees table is updated. 
It checks if the salary was changed (comparing NEW.salary with OLD.salary). 
If so, it logs the old and new salary values along with the employee_id and the timestamp of the change in the salary_changes table.*/


-- Step 5: Test the Trigger
/*Let's update the salary of an employee to see the trigger in action:*/

SELECT * FROM employees2; 
SELECT * FROM salary_changes;

SET sql_safe_updates = 0;
UPDATE employees2 SET salary = 75000 WHERE employee_id = 1;  -- trigger activated, value added in the log_table;

SELECT * FROM employees2; 
SELECT * FROM salary_changes;


UPDATE employees2 SET salary = 80000 WHERE employee_id = 2; 

SELECT * FROM employees2; 
SELECT * FROM salary_changes;  -- no addition becaasue there was no change in salary

-- Step 6: Check the salary_changes Table
/*After the update operation, you can check the salary_changes table to see if the trigger worked:*/

SELECT * FROM salary_changes;  /*Here the trigger does the activities after the insert operator*/ 





/*The previous example using BEFORE*/ 

DROP TABLE employees12;

CREATE TABLE employees12 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);


DROP TABLE salary_changes12;

CREATE TABLE salary_changes12 
(
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATETIME,
    FOREIGN KEY (employee_id) REFERENCES employees12(employee_id)
);

SELECT * FROM employees12;
SELECT * FROM salary_changes12;

INSERT INTO employees12(name, salary) VALUES ('Alice', 70000.00);
INSERT INTO employees12(name, salary) VALUES ('Bob', 80000.00);

SELECT * FROM employees12;
SELECT * FROM salary_changes12;

DELIMITER //
CREATE TRIGGER before_salary_update12
BEFORE UPDATE ON employees12 FOR EACH ROW
BEGIN
    IF NEW.salary <> OLD.salary THEN
        INSERT INTO salary_changes (employee_id, old_salary, new_salary, change_date)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary, NOW());
    END IF;
END //

UPDATE employees12 SET salary = 80000.00 WHERE employee_id = 1;
UPDATE employees12 SET salary = salary + 1000 WHERE employee_id = 1;

SELECT * FROM employees12; 

SELECT * FROM salary_changes12;


SELECT * FROM information_schema.triggers;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                    /*Where to use 'BEFORE' vs Where to use 'AFTER' */
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 1: BEFORE INSERT Trigger

/*Scenario: We have a students table, and every time we add a new student, we want to ensure their email is in lowercase.*/

/*Table: students*/

/*Columns: id, name, email*/

/*Trigger Action: Before a new student record is inserted, convert the email to lowercase.*/


Create table if not exists students2
(
  id INT,
  `name` Varchar(30), 
  email varchar(30)
); 


Delimiter &&
create trigger students2_email 
Before Insert On students2 for each row
begin 
  set new.email = lower(new.email);
end &&


INSERT INTO students2 (id, `name`, email) VALUES
(1, 'Ronu', 'ronu@gmail.com'),
(2, 'Ajay', 'AJAY@GMAIL.COM'),
(3, 'Saheli', 'SAHELI@GMAIL.COM');

select * from students2; 



DELIMITER //
CREATE TRIGGER before_student_insert
BEFORE INSERT ON students_table_name
FOR EACH ROW
BEGIN 
    SET NEW.email = LOWER(NEW.email); # here you can't use OLD explanation below
END // 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Explanation: When you insert a new student, the trigger automatically converts the email to lowercase before saving it. 
If you insert 'John Doe', 'JOHN@EXAMPLE.COM', the trigger changes the email to 'john@example.com' before it's stored in the database.*/



-- The error is occurring because the OLD keyword is used in the trigger, 
-- but it's not applicable for an INSERT trigger. 
-- The OLD and NEW keywords are typically used in UPDATE and DELETE triggers to reference the old and new values of the affected rows.
-- For an INSERT trigger, you only have access to the 'NEW' keyword, 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Example 2: BEFORE INSERT Trigger


/* Auto-filling a Column Before Insert*/ 
/*Scenario: In a books table, we want to automatically set a created_at timestamp when a new book record is inserted.*/
/*Table: books*/
/*Columns: id, title, author, created_at*/
/*Trigger Action: Before inserting a new book, set the current timestamp in the created_at column.*/






DELIMITER // 
CREATE TRIGGER before_book_insert
BEFORE INSERT ON books_table_name
FOR EACH ROW 
BEGIN 
   SET NEW.created_at = NOW(); 
END // 



-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Example 3 : Data Validation Before Update

/*Scenario: In a products table, we want to ensure that the price of a product is never set below 0.*/

/*Table: products*/

/*Columns: product_id, product_name, price*/
/*Trigger Action: Before updating a product, check if the new price is valid.*/ 

drop table products; 

create table products
( 
  product_id INT primary key  auto_increment, 
  product_name VARCHAR(30), 
  price INT,
  discount DEC(3,2)
); 

delimiter &&
create trigger discount_cap 
before insert on products for each row
begin 
  if 
    new.discount > 5.00 then set new.discount = 5.00;
  end if; 
end &&


insert into products(product_name,price,discount) Values
('Samsung TV', 200000,2.5),
('LG Fridge', 56000, 3.44),
('Iphone15', 100000,9.22), 
('IBS Washing Machine', 400000, 7.22); 


select * from products; 


DELIMITER // 
CREATE TRIGGER before_product_update
BEFORE UPDATE ON products_table_name 
FOR EACH ROW 
BEGIN 
  IF NEW.price < 0 THEN 
  SET NEW.price = 0;  /*by default the price is set to zero*/ 
  END IF; 
END // 

-----------------------------------------------------------------------------------------------------------------------------------------------------
Create table order_details
(
  order_id INT primary key,
  amount_paid DEC(10,2),
  customer_name VARCHAR(40),
  email VARCHAR(30)
);

DELIMITER &&
CREATE TRIGGER orderdetails_before 
BEFORE INSERT ON order_details FOR EACH ROW
BEGIN
  SET NEW.email = LOWER(NEW.email);
END &&

INSERT INTO order_details VALUES
(124, 20000.24,'Raju', 'RAJU@GMAIL.COM'),
(126, 12456.82,'Shyam','SHYAM@GMAIL.COM'),
(128, 11234.57,'Rajat', 'rajat@gmail.com')


SELECT * FROM order_details; -- See the trigger has changed the email into lower script. 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- Example 1.1: AFTER INSERT Trigger

/*Scenario: We have an orders table, and we want to keep a record of every new order in an order_log table.*/

/*Tables:*/

/*orders: Columns include order_id, product_name*/

/*order_log: Columns include log_id, order_id, log_message*/

/*Trigger Action: After a new order is inserted, log this action in the order_log table.*/


DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders_table_name
FOR EACH ROW
BEGIN 
   INSERT INTO order_log_table_name(order_id, log_message)
   VALUES(NEW.order_id, 'New order placed'); 
END //


/*Explanation: When a new order is added to the orders table, the trigger automatically adds a new log entry in the order_log table, 
noting that a new order was placed. The trigger does not change the orders table; it only adds an entry to order_log.*/

/*Key Differences:*/

/*BEFORE INSERT Trigger: Changes the data before it's inserted. In Example 1, it changes the email to lowercase.*/
/*AFTER INSERT Trigger: Performs an action after the data is inserted, without changing the original data.*/
/*In Example 1.1, it creates a log entry but doesn't change the order.*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- *Example 2.2: Logging New Records After Insert

/*Scenario: We have a members table and want to log every new member addition in a members_log table.*/

/*Tables:*/

/*members: Columns include member_id, member_name*/
/*members_log: Columns include log_id, member_id, action*/
/*Trigger Action: After a new member is added, log this event.*/


DELIMITER // 
CREATE TRIGGER after_member_insert 
AFTER INSERT ON members_table_name
FOR EACH ROW 
BEGIN 
   INSERT INTO members_log_table_name(member_id, action) 
   VALUES(NEW.member_id,'New member added');
END // 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 3.3: Auditing Changes After Update

/*Scenario: In an employees table, we want to track changes in the department column.*/

/*Tables:*/

/*employees: Columns include employee_id, name, department*/
/*department_changes: Columns include change_id, employee_id, old_department, new_department, change_date*/
/*Trigger Action: After an employee's department is changed, record the change.*/


DELIMITER // 
CREATE TRIGGER after_employee_update 
AFTER UPDATE ON emplyees_table_name 
FOR EACH ROW
BEGIN 
    IF NEW.department <> OLD.department THEN 
       INSERT INTO department_changes_table_name(employee_id, old_department, new_department, change_date)
       VALUES(OLD.employee_id, OLD.department, NEW.department, NOW()); 
	END IF; 
END // 


-----------------------------------------------------------------------------------------------------------------------------------------------------
                                             # CHECK THE FOLLOWING EXAMPLE TO GET COMPLETE CLARITY ON AFTER UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employee_log
(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    dept VARCHAR(40),
    state VARCHAR(40),
    exp_years INT
); 


CREATE TABLE transfer_log
(
	emp_id INT,
    old_dept VARCHAR(30),
    new_dept VARCHAR(30),
    transfer_date DATE,
    transfer_time TIME
); 



DELIMITER &&
CREATE TRIGGER employeelog 
AFTER UPDATE ON employee_log FOR EACH ROW
BEGIN 
	IF OLD.dept <> NEW.dept THEN
		INSERT INTO transfer_log (emp_id,old_dept,new_dept,transfer_date,transfer_time) VALUES
        (NEW.emp_id,OLD.dept,NEW.dept,CURDATE(),CURTIME());
	END IF;
END &&


INSERT INTO employee_log(dept,state,exp_years) VALUES
	('Sales', 'Odisha', 6),
    ('Tech', 'Maha', 8),
    ('Marketing', 'Assam', 10),
    ('Analytics', 'TN',8),
    ('Consulting','WB', 22),
    ('Management', 'Haryana', 30)
   
   SELECT * FROM employee_log;
   SELECT * FROM transfer_log;

  -- Checking the Trigger
  
  SET SQL_SAFE_UPDATES = 0; 

UPDATE employee_log
SET dept = 'Management' WHERE emp_id = 5;

UPDATE employee_log
SET dept = 'Analytics' WHERE emp_id = 1;


SELECT * FROM employee_log;
SELECT * FROM transfer_log;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                          /*INEURON CLASSES*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE course2
(
course_id INT, 
course_desc VARCHAR(50), 
course_mentor VARCHAR(60), 
course_price INT, 
course_discount INT,
create_date DATE
) ; 

CREATE TABLE course_update
(
  course_mentor_update VARCHAR(60), 
  course_price_update INT, 
  course_discount_update INT 
);

SELECT * FROM course2; 
SELECT * FROM course_update; 



DELIMITER // 
CREATE TRIGGER course_before_insert2 
BEFORE INSERT ON course2
FOR EACH ROW 
BEGIN 
SET NEW.create_date = SYSDATE(); 
END //


INSERT INTO course2(course_id, course_desc, course_mentor, course_price, course_discount) 
VALUES (101, "FSDA", "Sudhanshu", 4000, 10); 

SELECT * FROM course2; 

INSERT INTO course2(course_id, course_desc, course_mentor, course_price, course_discount) 
VALUES (102,'FSBC', 'AJAY', 1400,20); 

SELECT * FROM course2; 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE course4
(
course_id INT, 
course_desc VARCHAR(50), 
course_mentor VARCHAR(60), 
course_price INT, 
course_discount INT,
create_date DATE,
user_info VARCHAR(50)
) ;


DELIMITER //
CREATE TRIGGER course_before_insert4
BEFORE INSERT ON course4
FOR EACH ROW 
BEGIN 
    SET NEW.create_date = SYSDATE(); 
    SET NEW.user_info = USER(); 
END //
    
INSERT INTO course4(course_id, course_desc, course_mentor, course_price, course_discount) 
VALUES(101,'FSDA', 'Sudhanshu', 14000, 5),
(102, 'FSWD', 'Vnay', 20000, 10), 
(103, 'FSSD', 'Naveen', 40000, 20); 

SELECT * FROM course4; 


/*THE ABOVE TRIGGER could also be done in the following way- don't run*/


DELIMITER // 
CREATE TRIGGER before_trigger_insert 
BEFORE INSERT ON course4_table_name
FOR EACH ROW 
BEGIN 
   DECLARE x VARCHAR(30);
   SELECT USER() INTO x; 
   SET NEW.user_info = x; 
END // 

DELIMITER // 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE course6
(
course_id INT, 
course_desc VARCHAR(50), 
course_mentor VARCHAR(60), 
course_price INT, 
course_discount INT,
create_date DATE,
user_info VARCHAR(50)
) ;


CREATE TABLE reference_table
( 
  insert_date DATE, 
  record_insert_user VARCHAR(40)
  ); 

DELIMITER // 
CREATE TRIGGER before_trigger_insert2
BEFORE INSERT ON course6
FOR EACH ROW
BEGIN 
   SET NEW.create_date = CURDATE(); 
   SET NEW.user_info = USER(); 
   INSERT INTO reference_table(insert_date, record_insert_user)  VALUES (NEW.create_date, NEW.user_info); 
END // 


SELECT * FROM course6; 

INSERT INTO course6(course_id,course_desc,course_mentor, course_price, course_discount) 
VALUES 
(101,'FSDA', 'Sudhanshu', 12000, 5), 
(102, 'FSWD', 'Rajeev', 14000, 5), 
(103, 'FSSD', 'Naveen', 16000, 5),
(104, 'FSDS', 'Krrish', 24000, 6);

SELECT * FROM course6;
SELECT * FROM reference_table; 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Let's try similar case with AFTER keyword*/ 

CREATE TABLE course8
(
course_id INT, 
course_desc VARCHAR(50), 
course_mentor VARCHAR(60), 
course_price INT, 
course_discount INT,
create_date DATE,
user_info VARCHAR(50)
) ;

CREATE TABLE reference_table8
( 
  insert_date DATE, 
  record_insert_user VARCHAR(40)
  ); 



-------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER // 
CREATE TRIGGER before_trigger_insert8
AFTER INSERT ON course8
FOR EACH ROW
BEGIN 
   SET NEW.create_date = CURDATE(); 
   SET NEW.user_info = USER(); 
   INSERT INTO reference_table8(insert_date, record_insert_user)  VALUES (NEW.create_date, NEW.user_info); 
END //  /*This trigger won't work - because you are doing modifying in case of AFTER, that is not possible in AFTER trigger*/ 
        /*Therefore shows error message*/
        
        
/*This could be achieved with before inser*/

DELIMITER // 
CREATE TRIGGER before_trigger_insert8
BEFORE INSERT ON course8
FOR EACH ROW
BEGIN 
   SET NEW.create_date = CURDATE(); 
   SET NEW.user_info = USER(); 
END // 
DELIMITER ;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


DELIMITER // 
CREATE TRIGGER  before_trigger_insert8 
AFTER INSERT ON course8
FOR EACH ROW 
BEGIN 
   INSERT INTO reference_table8(insert_date, record_insert_user) VALUES(CURDATE(), USER()); 
END //  /*This got executed*/ 

SELECT * FROM course8; 
SELECT * FROM reference_table8; 


INSERT INTO course8(course_id,course_desc,course_mentor, course_price, course_discount) 
VALUES 
(101,'FSDA', 'Sudhanshu', 12000, 5), 
(102, 'FSWD', 'Rajeev', 14000, 5), 
(103, 'FSSD', 'Naveen', 16000, 5),
(104, 'FSDS', 'Krrish', 24000, 6);

SELECT * FROM course8; 
SELECT * FROM reference_table8;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE test1
( 
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
); 

CREATE TABLE test2
( 
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
);

CREATE TABLE test3
( 
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
);

/* Let's say the condition is whenever I am doing some sort of Operations with Test1, it should automatically either insert in Test 1 
or may be delete something from test2 or test 3*/ 

DELIMITER // 
CREATE TRIGGER update_other_table 
BEFORE INSERT ON test1 FOR EACH ROW 
BEGIN 
   INSERT INTO test2 VALUES('xyg', CURDATE(), 2232); 
   INSERT INTO test3 VALUES('xyg', CURDATE(), 2232); 
END // 



SELECT * FROM test1; 
SELECT * FROM test2; 
SELECT * FROM test3; 

INSERT INTO test1 VALUES
('Sudhanshu', CURDATE(), 234234); 

SELECT * FROM test1; 
SELECT * FROM test2; 
SELECT * FROM test3; 

INSERT INTO test1 VALUES
('Sudhanshu', CURDATE(), 234234); 

SELECT * FROM test1; 
SELECT * FROM test2; 
SELECT * FROM test3; 




/*let's try with after*/ 

DELIMITER // 
CREATE TRIGGER update_other_table2 
AFTER INSERT ON test1 FOR EACH ROW 
BEGIN 
 UPDATE test2 SET c1 = 'xyg' WHERE c1 = 'xyg';  /*mistaken should have been SET c1 = 'abc'*/ 
 DELETE FROM test3 WHERE c1 = 'xyg'; 
END // 

INSERT INTO test1 VALUES
('Sudhanshu', CURDATE(), 234234); 


SELECT * FROM test1; 
SELECT * FROM test2; 
SELECT * FROM test3; /*Mark all gone*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                               /*AFTER DELETE*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER // 
CREATE TRIGGER after_delete_table
AFTER DELETE ON test1 FOR EACH ROW 
BEGIN 
   INSERT INTO test3 VALUES('after delete', SYSDATE(), 435436); 
END // 
   
INSERT INTO test1 VALUES ('Ravi', CURDATE(), 12345), 
('Ajay', CURDATE(), 223456), 
('Bhasin', CURDATE(), 226568);

SELECT * FROM test1; 

/*Let's delte the last record i.e. Bhasin*/

DELETE FROM test1 WHERE c1 = 'Bhasin';  /*Deleted*/ 
/*Thus, inserton should have happened automatically with test3*/ 

SELECT * FROM test3;  /*already filled*/ 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE test11
(
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
); 


CREATE TABLE test12
(
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
);   

CREATE TABLE test14
(
  c1 VARCHAR(50), 
  c2 DATE, 
  c3 INT
);

DELIMITER // 
CREATE TRIGGER to_delete_before_others_observation2
BEFORE DELETE ON test11 FOR EACH ROW
BEGIN 
  INSERT INTO test14 VALUES(OLD.c1, OLD.c2, OLD.c3);
END //

INSERT INTO test11 VALUES ('Ravi', CURDATE(), 12345), 
('Ajay', CURDATE(), 223456), 
('Bhasin', CURDATE(), 226568);

SELECT * FROM test11;

DELETE FROM test11 WHERE c1 = 'Bhasin'; 

SELECT * FROM test14; 

INSERT INTO test11 VALUES ('Bhasin', CURDATE(), 226568);

DELIMITER // 
CREATE TRIGGER to_delete_before_others_observation4
AFTER DELETE ON test11 FOR EACH ROW
BEGIN 
  INSERT INTO test14 VALUES(OLD.c1, OLD.c2, OLD.c3);
END //

SELECT * FROM test14; 
SELECT * FROM test11; 
DELETE FROM test11 WHERE c1 = 'Bhasin'; 
DELETE FROM test11 WHERE c1 = 'Ajay'; 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*TASK1 : Create a table employee data and the add a trigger which would display an error message if the Name doesn't starts with R*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE sample_table;
create table sample_table
(
  employee_name VARCHAR(100),
  email_id VARCHAR(100),
  salary int,
  display_message VARCHAR(30)
);

DELIMITER &&
CREATE TRIGGER before_insert_trigger 
BEFORE INSERT ON sample_table FOR EACH ROW
BEGIN
	IF 
      LEFT(NEW.employee_name,1) <> 'R' THEN 
      SET NEW.display_message = 'Name must start with R; update';
	ELSEIF
      LEFT(NEW.employee_name,1) = 'R' THEN 
      SET NEW.display_message = 'NO Change required' ;
	END IF;
END &&

INSERT INTO sample_table(employee_name,email_id,salary) VALUES
	('bijoy','bijoy@gmail.com',20000),
    ('Navika', 'navika@gmail.com',30000),
    ('Raushan','raushan@gmail.com',22000),
    ('Ravi','Ravi@gmail.com',42000); 

SELECT * FROM sample_table; -- done

DROP TABLE sample_table;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------



drop table update_table;

create table update_table
(
  log_no INT AUTO_INCREMENT PRIMARY KEY,
  old_name VARCHAR(100), 
  new_name VARCHAR(100),
  old_email_id varchar(100),
  old_salary int,
  operation varchar(100),
  date_of_operation DATE
 ) ;
 
 delimiter &&
 create trigger after_update_trigger
 after update on sample_table for each row
 begin
   
   if new.employee_name <> old. employee_name then 
     insert into update_table(old_name,new_name, old_email_id, old_salary,operation, date_of_operation) 
	 values(old.employee_name,new.employee_name,old.email_id,old.salary,'Name update',now());
   
   elseif new.email_id <> old.email_id then
	 insert into update_table(old_name,new_name, old_email_id, old_salary,operation, date_of_operation)
	 values(old.employee_name,'NA',old.email_id,old.salary, 'Email Update',now());
     
end if;
end &&

create table sample_table
(
  employee_name VARCHAR(100),
  email_id VARCHAR(100),
  salary int,
  display_message VARCHAR(30)
);

insert into sample_table(employee_name,email_id,salary)
values ('Rdhika','radhika@gmail.com',1000000 ),
('Raju', 'Raju@gmail.com',200000),
('Reshma', 'reshma@gmail.com',3000000),
('Rera', 'rera@gmail.com',3000000);

truncate sample_table; 
Select * from sample_table; 

 /*Before insert is wrking fine*/ 
 
 /*let's check after update*/ 
 
 update sample_table set email_id = 'radhika22@gmail.com' where employee_name = 'Rdhika';
 update sample_table set employee_name = 'Raju Sharma' where email_id = 'RAJU@GMAIL.COM';
 
 select * from update_table; 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            /*CASE*/ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE ineuron_partition;  /*USE THIS data base that we created during Partition Class*/ 

SELECT * FROM ineuron_courses2;


SELECT * , 
CASE 
  WHEN course_name = 'machine learning' THEN 'This is your batch'
  WHEN course_name = 'interview prep' THEN 'This is your batch'
  ELSE 'This isnt your batch'
END AS Message /*the name of the column you intend*/ 
FROM ineuron_courses2; 

 



SELECT * , 
CASE 
  WHEN LENGTH(course_name) >=4 THEN 'COURSE COULD BE CONSIDERED'
  WHEN LENGTH(course_name) <=3 THEN 'NEEDS MORE RESEARCH'
  WHEN LENGTH(course_name) <=2 THEN 'REJECTED'
END AS Course_Message
FROM ineuron_courses2; 


/*Let's say we need to update the table using CASE, let's say in Course_name we need to update RL with Reinforcement Learning and 
DL as Deep learning*/

SELECT * FROM ineuron_courses2;

UPDATE ineuron_courses2 
SET course_name = CASE
WHEN course_name = 'RL' THEN 'Reinforcement Learning'
WHEN course_name = 'Dl' THEN 'Deep Learning'
ELSE course_name = course_name
END ;

SELECT * FROM ineuron_courses2; 


                





 
 
 
 
 
 
------------------------------------------------------------------------------------------------------------------------------------------------------------
/*using CTE*/ 

WITH case_details AS (
  SELECT *, 
    CASE 
      WHEN LENGTH(course_name) <= 2 THEN 'REJECTED'
      WHEN LENGTH(course_name) <= 3 THEN 'NEEDS MORE RESEARCH'
      WHEN LENGTH(course_name) >= 4 THEN 'COURSE COULD BE CONSIDERED'
    END AS Course_Message
  FROM ineuron_courses2
)
SELECT * FROM case_details WHERE Course_Message = 'NEEDS MORE RESEARCH';
------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            # SOME MORE EXAMPLES OF CASE
------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TEMPORARY TABLE employees
(
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_name VARCHAR(30),
  salary INT
 );


INSERT INTO employees (emp_name, salary)
VALUES
  ('John Doe', 50000),
  ('Jane Smith', 60000),
  ('Michael Johnson', 55000),
  ('Emily Davis', 62000),
  ('David Wilson', 58000),
  ('Sarah Brown', 54000),
  ('Christopher Miller', 59000),
  ('Amanda Taylor', 57000),
  ('Kevin Martinez', 61000),
  ('Jennifer Anderson', 56000);

SELECT * FROM employees;

# CATEGORIZE EMPLOYEES BASED ON THEIR SALARY 

SELECT *, 
	CASE
		WHEN salary >= 50000 AND salary <= 60000 THEN 'GRADE D'
        WHEN salary > 60000 AND salary <= 80000 THEN 'GRADE C'
        WHEN salary > 80000 AND salary <= 200000 THEN 'GRADE B'
        WHEN salary > 200000 THEN 'GRADE A'
	END AS Grade_type
FROM employees;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              # USAGE OF CASE AND COUNT() - EDTECH SPECIFIC
-------------------------------------------------------------------------------------------------------------------------------------------------------------


DROP TABLE teacher_training;

CREATE  TABLE teacher_training2 
(
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_name VARCHAR(100),
    test_prep_segment VARCHAR(50),
    students_trained INT
);

INSERT INTO teacher_training2 (teacher_name, test_prep_segment, students_trained) VALUES
    ('John Smith', 'GMAT', 50),
    ('Emily Johnson', 'GRE', 40),
    ('David Wilson', 'UPSC', 30),
    ('Sarah Brown', 'GMAT', 60),
    ('Michael Miller', 'GRE', 35),
    ('Amanda Taylor', 'UPSC', 25),
    ('Christopher Martinez', 'GMAT', 55),
    ('Jennifer Anderson', 'GRE', 45),
    ('Kevin Thomas', 'UPSC', 20),
    ('Laura Garcia', 'GMAT', 48),
    ('Robert Lee', 'GRE', 38),
    ('Michelle Rodriguez', 'UPSC', 28),
    ('Daniel Hernandez', 'GMAT', 58),
    ('Elizabeth Lopez', 'GRE', 42),
    ('Matthew Perez', 'UPSC', 22),
    ('Jessica Gonzalez', 'GMAT', 52),
    ('Andrew Sanchez', 'GRE', 37),
    ('Melissa Torres', 'UPSC', 26),
    ('Ryan Flores', 'GMAT', 53),
    ('Stephanie Rivera', 'GRE', 41);

SELECT * FROM teacher_training2;

# Counting the number of teachers in each test prep segment:

SELECT test_prep_segment, COUNT(DISTINCT teacher_name) AS teacher_count FROM teacher_training
GROUP BY test_prep_segment
ORDER BY teacher_count DESC;

select test_prep_segment, count(distinct teacher_name) as teacher_count from teacher_training2
group by test_prep_segment
order by teacher_count desc; 


# Counting the number of teachers with more than 50 students trained (Using CASE): 
SELECT * FROM teacher_training2;

SELECT test_prep_segment, COUNT(CASE WHEN students_trained > 50 THEN 1 END) AS no_of_teachers_above_50_training
FROM teacher_training
GROUP BY test_prep_segment;




# Counting the number of teachers in each test prep segment and categorizing them based on the number of students trained (e.g., High, Medium, Low):

SELECT test_prep_segment, count(*) FROM teacher_training2 
GROUP BY test_prep_segment; -- THis gives count of teachers acrss departments

SELECT test_prep_segment, count(*)  AS teachers_count,
SUM(CASE WHEN students_trained > 50 THEN 1 ELSE 0 END) AS high_trained_teachers_count,
SUM(CASE WHEN students_trained <= 50  AND students_trained >= 30 THEN 1 ELSE 0 END)  AS medium_trained_teachers_count,
SUM(CASE WHEN  students_trained < 30 THEN 1 ELSE 0 END) AS low_trained_teachers_count
FROM teacher_training2
GROUP BY test_prep_segment;

SELECT 
test_prep_segment, COUNT(*) AS teachers_count,
COUNT(CASE WHEN students_trained > 50 THEN 1 END) AS high_trained_teachers_count, -- se the above could be acheived with count as well
COUNT(CASE WHEN students_trained <= 50 AND students_trained >= 30 THEN 1 END) AS medium_trained_teachers_count,
COUNT(CASE WHEN students_trained < 30 THEN 1 END) AS low_trained_teachers_count -- the difference is in SUM() we use else, in COunt() no else statement.
FROM teacher_training2 -- IN count() else is ommited because count() counts the nON NULL values only 
GROUP BY test_prep_segment;





-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                       # USAGE OF CASE AND JOINS
-------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE students; 

CREATE TABLE students 
(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    test_prep_segment VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher_training(teacher_id)
);

CREATE  TABLE test_scores 
(
    score_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

SELECT * FROM students;
SELECT * FROM test_scores;

INSERT INTO students (student_name, test_prep_segment, teacher_id) VALUES
    ('Alice Smith', 'GMAT', 1),
    ('Bob Johnson', 'GRE', 2),
    ('Charlie Wilson', 'UPSC', 3),
    ('David Brown', 'GMAT', 1),
    ('Emily Miller', 'GRE', 2),
    ('Frank Taylor', 'UPSC', 3),
    ('Grace Martinez', 'GMAT', 1),
    ('Henry Anderson', 'GRE', 2),
    ('Ivy Thomas', 'UPSC', 3),
    ('Jack Garcia', 'GMAT', 1),
    ('Katherine Lee', 'GRE', 2),
    ('Liam Rodriguez', 'UPSC', 3);
    
    INSERT INTO test_scores (student_id, score) VALUES
    (1, 700),
    (2, 320),
    (3, 85),
    (4, 720),
    (5, 330),
    (6, 90),
    (7, 710),
    (8, 310),
    (9, 95),
    (10, 690),
    (11, 325),
    (12, 80);

SELECT * FROM students;
SELECT * FROM test_scores;

# Counting the number of students in each test prep segment:

SELECT test_prep_segment, count(DISTINCT student_name) AS students_count  FROM students
GROUP BY test_prep_segment 
ORDER BY students_count DESC;

# Counting the number of students in each test prep segment who scored above a certain threshold using a CASE statement:

SELECT 
	s.test_prep_segment, 
    COUNT(CASE WHEN t.score >= 700 THEN 1 END) AS student_count_top
    FROM students AS s
JOIN test_scores AS t ON s.student_id = t.student_id
GROUP BY test_prep_segment -- here s.test_prep_segment not used because now the table is already framed so just the column name from the framed table
ORDER BY student_count_top DESC;


# Categorizing students based on their scores into High, Medium, and Low using CASE statements:

SELECT 
	s.student_name,
    s.test_prep_segment,
    t.score,
		CASE
		   WHEN t.score <= 300 THEN 'Poor'
		   WHEN t.score > 300 AND t.score <= 690 THEN 'Medium'
		   WHEN t.score > 690 AND t.score <= 710 THEN 'Good'
		   WHEN t.score > 720 THEN 'Top 1 Percentile'
		   ELSE 'Details Pending'
	END AS score_remarks
FROM students AS s
JOIN test_scores AS T
ON s.student_id = t.student_id
ORDER BY t.score DESC;






-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /*STRING FUNCTIONS*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Function: UPPER():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts all characters in a string to uppercase.*/

SELECT UPPER('Hello world'); 




-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 2. Function: LOWER():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts all characters in a string to lowercase.*/
Example:

SELECT LOWER('HELLO WORLD'); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 3. Function: LENGTH():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Returns the length of a string (the number of characters).*/ 

SELECT LENGTH('HELLO WORLD'); 



-------------------------------------------------------------------------------------------------------------------------------------------------------------------
															 -- 4. Function: SUBSTRING() or SUBSTR(): 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Extracts a substring from a string, given a starting position and length.*/ 

SELECT SUBSTRING('HELLO WORLD', 1, 5); 
SELECT SUBSTR('HELLO WORLD', 1, 5); 

SELECT SUBSTRING('HELLO WORLD', 1,5); 
SELECT SUBSTR('HELLO WORLD', 1, 5) ; 






 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 5. Function: CONCAT():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Concatenates two or more strings into one string.*/ 

SELECT CONCAT('HELLO' 'WORLD'); 
SELECT CONCAT('HELLO', ' ', 'WORLD'); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 6. Function: TRIM():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Removes spaces from the beginning and end of a string.*/ 

SELECT TRIM('  HELLO WORLD  '); 






-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 7. Function: LTRIM():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: LTRIM() removes spaces from the left side of a string*/ 

SELECT LTRIM(' HELLO WORLD'); 




-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 8. Function: RTRIM():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: RTRIM() removes spaces from the right side of a string*/

SELECT RTRIM('HELLO WORLD   '); 





-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 9. Function: REPLACE():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Replaces all occurrences of a specified substring within a string with another substring.*/

SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 
 
SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 


 SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 
 
 SELECT REPLACE ('HI HOW ARE YOU' , 'ARE YOU', 'ARE YOU Doing ?'); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 10. Function: CHAR_LENGTH()or CHARACTER_LENGTH()
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the number of characters in a string (similar to LENGTH()).*/ 

SELECT LENGTH('HELLO WORLD'); 
SELECT CHARACTER_LENGTH('HELLO WORLD'); 
 
SELECT LENGTH('HI WORLD'); 
SELECT CHARACTER_LENGTH('HI WORLD'); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 11. Function: POSITION() or LOCATE()
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Finds the position of a substring in a string.*/ 

SELECT LOCATE('WORLD', 'HELLO WORLD'); 
SELECT POSITION('WORLD' IN 'HELLO WORLD'); 


SELECT INSTR('HELLO WORLD', 'WORLD'); /*also gives same sresult*/ 


SELECT LOCATE('WORLD', 'HELLO WORLD'); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 12. Function: LEFT():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Extracts a specified number of characters from the left (start) of a string.*/ 

SELECT LEFT('HELLO WORLD', 4); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 13. Function: RIGHT():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Extracts a specified number of characters from the right (end) of a string.*/


SELECT RIGHT('HELLO WORLD', 4); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             -- 14. Function: REVERSE():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Reverses the characters in a string.*/ 

SELECT REVERSE('HELLO WORLD'); 

SELECT REVERSE('PALLINDROME');

SELECT REVERSE('LUDUL'); 



-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 15. Function: INSTR():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the position of the first occurrence of a substring in a string.*/

SELECT INSTR('HELLO WORLD', 'WORLD'); 

SELECT POSITION('WORLD' IN 'HELLO WORLD'); /*RECALL*/ 
SELECT LOCATE('WORLD', 'HELLO WORLD'); /*RECALL*/ 




-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 16. Function: LPAD():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Pads a string from the left with a specified string up to a certain length.*/ 

SELECT LPAD('HELLO', 10, '*'); 
SELECT LPAD('HELLO', 11, '*');
SELECT LPAD('HELLO', 4, '*'); 

SELECT LPAD('HELLO', 20, '*'); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
														      -- 17. Function: RPAD():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Pads a string from the right with a specified string up to a certain length.*/ 

SELECT RPAD('HELLO', 20, '*'); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 18. Function: ASCII():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Returns the ASCII value of the first character of the string.*/ 

SELECT ASCII('HELLO'); 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 19. Function: CHAR():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts an ASCII code to a character.*/ 

SELECT CHAR(72); 


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 20. Function: FIELD():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the index position of a value in a list of values.*/

SELECT FIELD('b', 'a', 'b', 'c', 'd');



-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 21. Function: FIND_IN_SET():
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the position of a string within a list of strings separated by commas.*/ 

Role: Returns the position of a string within a list of strings separated by commas.


SELECT FIND_IN_SET('b', 'a,b,c,d');

SELECT FIND_IN_SET('HELLO', 'HELLO, WORLD, Tiger, LION'); 

SELECT CONCAT('HELLO', ' ', 'WORLD'); 
SELECT SUBSTRING('HELLO WORLD', 1, 7); 

SELECT TRIM('HELLO WORLD  '); 
SELECT TRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE; -- Note: shows error, MYSQL with TRIM handles only spaces. 
SELECT LTRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE; -- Same Error

SELECT TRIM(LEADING '*' FROM '********T E S T I N G 1 2 3 4********'); -- worked
SELECT TRIM(TRAILING '*' FROM '********T E S T I N G 1 2 3 4********'); -- Worked


SELECT CHARACTER_LENGTH('HELLO WORLD'); 
SELECT REPLACE('HI YOU ARE BEAUTIFUL', 'BEAUTIFUL', 'UGLY'); 
SELECT POSITION('WORLD' IN 'HELLO WORLD'); 
SELECT LOCATE('WORLD', 'HELLO WORLD'); 
SELECT LEFT('HELLO WORLD', 4); 
SELECT RIGHT('HELLO WORLD', 4); 
SELECT REVERSE('LUDUL'); 
SELECT LPAD('HELLO', 20, '*'); 
SELECT ASCII('HELLO WORLD'); 
SELECT CHAR(72); 
SELECT RPAD('HELLO', 12, '&'); 

SELECT substring('Hello', 1,2);

SELECT SUBSTRING('RAMMOHAN', -2,2); -- Remember negative is also possible with substring
SELECT SUBSTRING('RAMMOHAN', -8,8);

SELECT substr('RONU MONDEEP MOHANTY',1,4) AS first_name;
SELECT substr('RONU MONDEEP MOHANTY',6,7) AS middle_name;
SELECT substr('RONU MONDEEP MOHANTY',14,7) AS last_name;





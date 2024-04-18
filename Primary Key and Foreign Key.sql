-------------------------------------------------------------------------------------------------------------------------------------------------------
                                                /* TOPIC 1 : PRIMARY KEY , FOREIGN KEY */ 
-------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE ineuron_primary_foreignkey;
USE ineuron_primary_foreignkey;

/* Suppose we have two tables: customers and orders.*/

CREATE TABLE customers 
(
    customer_id INT PRIMARY KEY, /*customer_id is the primary key, which uniquely identifies each customer.*/
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
    /*In this table customer_id could have a different name and still refer to customer_id in Parent table - Name doesnt has to match*/
    
);




INSERT INTO customers (customer_id, first_name, last_name)
VALUES (1, 'John', 'Doe');


INSERT INTO orders (order_id, customer_id, order_date)
VALUES (101, 1, '2023-11-04');

/* In the above we're inserting a customer with customer_id=1 (John Doe) into the customers table, and 
then creating an order with order_id=101 for this customer in the orders table. 
The customer_id in the orders table references the corresponding customer_id in the customers table, 
establishing a relationship between the two.*/


CREATE TABLE order_details12 (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

/*Suppose we have a table called order_details that tracks individual items within an order.*/
/*In this case, the combination of order_id and product_id together can uniquely identify each item within an order.*/

/#So, for example, if a customer places two different orders containing the same product on the same day#/
/#the order_id will be different, ensuring that each record is unique.#/

INSERT INTO order_details12 (order_id, product_id, quantity)
VALUES (1, 101, 5);

INSERT INTO order_details12 (order_id, product_id, quantity)
VALUES (1, 102, 3);

INSERT INTO order_details12 (order_id, product_id, quantity)
VALUES (2, 101, 2);

select * from order_details12; 

INSERT INTO order_details12 (order_id, product_id, quantity)
VALUES (2, 101, 2); # see says duplicate entry for 2-101


/*-----------------------------------------------------------------------------------*/

CREATE TABLE key_primary_table
(
course_id INT NOT NULL,
course_name VARCHAR(60),
course_status VARCHAR(40), 
number_of_enrollmement INT,
PRIMARY KEY (course_id)); /*WHenever you wish to create relationships across tables, you could have one or multiple columns as primary Key*/ 
 /*Primay Key- Can't be nUll, It can't have repetitions or DUPLICATES ELSE ERROR*/
 
 INSERT INTO key_primary_table VALUES (01, 'FSDA' , 'active', 100)
 
 INSERT INTO key_primary_table VALUES (01, 'FSDA' , 'not-active', 100)  /*IF WE EXECUTE THIS, IT SHOWS DUPLICATE ENTRY*/
  
INSERT INTO key_primary_table VALUES (02, 'FSDs' , 'active', 100)

SELECT * FROM key_primary_table


ALTER TABLE key_primary_table ADD CONSTRAINT test_prim PRIMARY KEY (course_id, course_name); /* ERROR : Multiple PRIMARY KEY DEFINED*/
ALTER TABLE key_primary_table ADD CONSTRAINT test_prim PRIMARY KEY (course_status, course_name); /* )) same error*/

/* WHEN YOU HAVE A PRIMARY KEY, IT DOESN'T ALLOW YOU TO ADD A NEW PRIMARY KEY*/

/* SO WHAT's THE WAY ? because here to do it You will have to  1st - drop the Primary key to drop it 1st untag it from child Tables*/




/*Let's Say we are creating another Table key_foreign_table and we need to associate this with the above Table*/

CREATE TABLE key_foreign_table(
student_id INT,
course_name VARCHAR(60), 
student_mail VARCHAR(60), 
student_status VARCHAR(60),
course_id2 INT, /*IF this is declared as primary key , then repetition with course_id2 isn't possible, but example in real scenarios it could be possible, example for the same course ID  there could be multiple Students enrolled for the same course ID*/
FOREIGN KEY (course_id2) REFERENCES key_primary_table (course_id)) /* IF there are any duplicates ID it will give error message for IT will compare with the other TABLE too*/





SELECT * FROM key_foreign_table

INSERT INTO key_foreign_table VALUES(101, 'fsda', 'test@gmail.com', 'active', 05) /*see this it is not executed because 05 was not present in the Parent Table*/

INSERT INTO key_foreign_table VALUES(101, 'fsda', 'test@gmail.com', 'active', 02) /*This got executed - So Freign Key Restricts ENtry -> EXAMPLE When you add Student ID/ Password - It says no such ID*/

INSERT INTO key_foreign_table VALUES(101, 'fsda', 'test@gmail.com', 'active', 02)
INSERT INTO key_foreign_table VALUES(101, 'fsda', 'test@gmail.com', 'active', 02)
INSERT INTO key_foreign_table VALUES(101, 'fsda', 'test@gmail.com', 'active', 02) /* HERE it is trying to maintain 1 to Many Relation but, in case the course id in child table was declared primary, it should have been one to one*/ 
/* all these three got executed they are same, becuase it just checked if 101 is present or not, so in child table repetition is possible unless course_id2 in case of Child table is declared as primary key*/


create table primarykey
( 
   courseid int , 
   name varchar(30), 
   city varchar(30),
   primary key(courseid)
); 

create table foreignkey
(
  courseid int,
  course_name varchar(30), 
  course_duration int,
  foreign key (courseid) references primarykey(courseid)
  ); 

insert into primarykey values
(1, 'abc','bbsr'),
(2,'abc','kol'),
(3,'dummy','Delhi');



insert into foreignkey values
(1,'abc',20),
(1,'abc',24)



CREATE TABLE key_primary_table(
course_id INT NOT NULL,
course_name VARCHAR(60),
course_status VARCHAR(40), 
number_of_enrollmement INT,
PRIMARY KEY (course_id));

CREATE TABLE Payment(
course_name VARCHAR(30),
course_id INT,
course_live_status VARCHAR(30),
course_lunch_date VARCHAR(30),
FOREIGN KEY (course_id) REFERENCES key_primary_table (course_id))

INSERT INTO Payment VALUES ('fsda', 06, 'not-active', '7th August') /*See this is not executed coz 06 is not present in the Parent Table8*/

INSERT INTO Payment VALUES ('fsda', 01, 'not-active', '7th August') /*EXECUTED*/ 

INSERT INTO Payment VALUES ('fsda', 01, 'not-active', '7th August')
INSERT INTO Payment VALUES ('fsda', 01, 'not-active', '7th August')
INSERT INTO Payment VALUES ('fsda', 01, 'not-active', '7th August')


CREATE TABLE class(
course_id INT, 
class_name VARCHAR(30),
class_topic VARCHAR(30),
class_duration INT,
PRIMARY KEY (course_id), 
FOREIGN KEY (course_id) REFERENCES key_primary_table (course_id))


ALTER TABLE key_primary_table DROP PRIMARY KEY ; /* NOT possible coz it is already linked to a CHild Table or FOreign Key Table - If it was not linked then could have been done*/ 

DROP TABLE key_primary_table;  /*This is also not possible for it is already referenced by a FOreign Key*/ 

But, 

DROP TABLE class /*DOn't run wq this is possible coz child Table*/ /* So to drop the Primary Table you need to drop the child Table first then drop the primary*/ 

drop table tes; 

CREATE TABLE test(
id INT NOT NULL,
name VARCHAR(30), 
email_id VARCHAR(30), 
mobile_no VARCHAR(30),
address VARCHAR(30));

alter table test add constraint pc_constraint Primary key (id);  -- added Priamry key after table creation
alter table test drop primary key; -- dropped the created primary key 
-- Note: for primary key droppijng by using index not required.





alter table test add constraint pc_constraint Primary key (id); -- reestablished a PK

alter table test add constraint pc_constraint2 Primary key (email_id); -- check not  executed because a PK was set above.
-- you could drop the previous pk to add new. 


/* NOTE FOR A TABLE MULTIPLE PRIMARY KEY - NOT POSSIBLE but , FOR A TABLE A PRIMARY KEY WITH COMBINATIONS OF MULTIPLE TABLE - POSSIBLE 
=COMPOSITE PRIMARY KEY*/




CREATE TABLE order_details4 (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

/#might not be sufficient to just have order_id as the primary key, because a customer can place multiple orders on the same day.#/
/#However, the combination of order_id and order_date together can uniquely identify each order.#/

INSERT INTO order_details4 (order_id, product_id, quantity)
VALUES (1, 101, 5);

INSERT INTO order_details4 (order_id, product_id, quantity)
VALUES (1, 102, 3);

INSERT INTO order_details4 (order_id, product_id, quantity)
VALUES (2, 101, 2);

SELECT * FROM order_details4; 

/*What if What if the same customer, orders the same product 2 times ?*/

/*ncluding a unique identifier for each order, such as an order_item_id, which would be an auto-incrementing integer.*/

CREATE TABLE order_details8 (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT, 
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO order_details8 (order_id, product_id, quantity)
VALUES (1, 101, 5);

INSERT INTO order_details8 (order_id, product_id, quantity)
VALUES (1, 102, 3);

INSERT INTO order_details8 (order_id, product_id, quantity)
VALUES (2, 101, 2);

INSERT INTO order_details8 (order_id, product_id, quantity)
VALUES (1, 101, 2);


SELECT * FROM order_details8; 




/*HOW TO ALTER THE FOREIGN KEY ONCE THE TABLE IS CREATED*/ 

CREATE TABLE foreign_key(
a INT PRIMARY KEY,
b INT, 
c VARCHAR(30))
CONSTRAINT foreign_constraint FOREIGN KEY (b) REFERENCES parent_table(orders) ON UPDATE CASCADE); 


ALTER TABLE foreign_key
DROP FOREIGN KEY foreign_constraint;  /*1st Dropping the COnstraint*/


ADD CONSTRAINT foreign_constraint2 FOREIGN KEY (b) References parent_table(orders) ON UPDATE CASCADE;  /*Adding a new Constraint*/ 


alter table table_name
add constratint cons_name foreign key (b) references table2(c2) ON UPDATE Cascade; 








create table abc
(
 a int, 
 b int, 
 c int
 ); 
 

 

  
  


CREATE TABLE child 
(
    id INT PRIMARY KEY,
    parent_id INT,
);

ALTER TABLE child
ADD CONSTRAINT  F_C FOREIGN KEY (parent_id) REFERENCES parent(id) ON UPDATE CASCADE;  /* mark this you could also add a constraint after creation f thetable*/ 



ALTER TABLE child 
DROP FOREIGN KEY f_C; 

CREATE TABLE parent(
id INT NOT NULL,
PRIMARY KEY (id))


CREATE TABLE child(
id INT, 
parent_id INT, 
FOREIGN KEY (parent_id) REFERENCES parent(id) )

INSERT INTO parent VALUES (1);
INSERT INTO parent VALUES (2);

SELECT * FROM parent;

INSERT INTO child VALUES (1,1) /*EXECUTED*/

SELECT * FROM child


INSERT INTO child VALUES (4, 2) /* NOT EXECUTED coz 2 is not yet inserted into the Parent table */ 

/* LET's SAY we wish to delete an Entry from the Parent Table*/ 

DELETE FROM parent WHERE id = 1; /* CAN't BE DELETED cox FOREIGN KEY CONSTRAINT ALREADY MAPPED*/ 

/* SO HOW DO WE DELETE IT*/ 

/*ONE WAY IS TO DELETE THE CHILD TABLE THEN DO IT*/ 

/* is there another way without dropping the CHILD TABLE, YES!!*/ 

/*let's FIRST DELETE THE ENTRIES OF CHILD TABLE*/

DELETE FROM child WHERE  id = 1;
SELECT * FROM child; 

DELETE FROM parent WHERE id = 1; /* EXECUTED* / 




/* TOPIC: CASCADE OPERATOR*/

/# option for a foreign key constraint that determines #/
/# what action should be taken when a referenced row in the parent table is either updated or deleted.3/
/# 2 types :#/

/#A.ON DELETE CASCADE#/

CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON DELETE CASCADE
);

/# The ON DELETE CASCADE option means that if a row in the parent table is deleted,#/
/# all corresponding rows in the child table with a matching parent_id will also be deleted.#/

DELETE FROM parent WHERE id = 6 /* Just an example let's say there is an entry with 6*/ 
/* So - once it is deleted automatically deletes form the Child table as well*/


/#B.ON UPDATE CASCADE#/

CREATE TABLE parent (
    id INT PRIMARY KEY
);


CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON UPDATE CASCADE
);

UPDATE parent SET id = 2 WHERE id = 6  /*(just an example id we need to replace 6 with 2 - gets automatically updated in the child table8*/



CREATE TABLE parent6 (
    id INT PRIMARY KEY
);

CREATE TABLE child6 (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent6(id) ON UPDATE CASCADE
);

/*Let's DROP CHILD TABLE THEN RE INITIATE IT*/

DROP TABLE child;

CREATE TABLE child(
id INT, 
parent_id INT, 
FOREIGN KEY (parent_id) REFERENCES parent(id)ON DELETE CASCADE)





INSERT INTO child VALUES (1,1), (1,2), (3,2),(2,2) 

SELECT * FROM child

SELECT * FROM parent

/* LET's NOW DELETE FROM THE PARENT TABLE*/ 

DELETE FROM parent WHERE id = 1;  /*this time it allowed without asking to change the child Table first*/ 

SELECT * FROM parent; /*DELETED*/
SELECT * FROM child; /*SEE - GOT AUTOMATICALLY UPDATED HERE as the input was deleted from PARENT TABLE*/ 


UPDATE parent SET id = 3 WHERE id = 2;  /*DOESNT  ALLOW YOU TO UPDATE BECAUSE OF THE EXISTING RELATION*/ 
 
 /* SIMALRY TO DO ABOVE THERE ARE 2 WAYS, 1 -> DELETE THE CHILD AND THEN PARENT ELSE , 'UPDATE CASCADE' */
 
 CREATE TABLE parent2(
idp INT NOT NULL,
PRIMARY KEY (idp))
 
 CREATE TABLE child2(
idc INT, 
parent_id INT, 
FOREIGN KEY (parent_id) REFERENCES parent2(idp) ON UPDATE CASCADE)
 
 INSERT INTO parent2 VALUES (1); 
  INSERT INTO parent2 VALUES (2); 
   INSERT INTO parent2 VALUES (3); 
   INSERT INTO parent2 VALUES (4),(5), (6)
 
   SELECT * FROM parent2
   
   INSERT INTO child2 VALUES (1,2),(1,8), (2,6), (4,10) /*Not EXECUTED coz 8,10 are not there inbt the parent list and Parent_id is connected to idp from parent Table*/ 
   
   INSERT INTO child2 VALUES (1,2),(1,3), (2,5), (4,6)
   
   SELECT * FROM child2
   
  /* LET's SAY NOW WE NEED TO UPDATE - CHECK ROW 179*/
  
  UPDATE parent2 SET idp = 10 where idp = 6; /* EXECUTED*/
  
  SELECT * FROM parent2; 
  
  SELECT * FROM child2;
  

 ------------------------------------------------------------------------------------------------------------------------------------------------------
 
 CREATE TABLE parent (
    id INT PRIMARY KEY
);

CREATE TABLE child (
    id INT PRIMARY KEY,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES parent(id) ON UPDATE CASCADE ON DELETE CASCADE /*automatically updates or deletes*/
);

/* DOnt run the above code*/ 

 ------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE staffs
(
 staff_id INT auto_increment Primary Key,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL UNIQUE,
 phone VARCHAR(25),
 `active` TINYINT NOT NULL,
 store_id INT NOT NULL,
 manager_id INT
 );
 
SELECT * FROM staffs;
SELECT * FROM stores;

DROP TABLE stores;

 CREATE TABLE stores
 (
   store_id INT PRIMARY KEY AUTO_INCREMENT,
   store_name VARCHAR(255) NOT NULL,
   phone VARCHAR(25),
   email VARCHAR(255),
   street VARCHAR(255),
   city VARCHAR(255),
   state VARCHAR(10),
   zip_code VARCHAR(5)
); 

INSERT INTO stores(store_name, phone, email, street, city, state, zip_code)
VALUES('Santa Cruz Bikes','(831) 476-4321','santacruz@bikes.shop','3700 Portola Drive', 'Santa Cruz','CA',95060),
      ('Baldwin Bikes','(516) 379-8888','baldwin@bikes.shop','4200 Chestnut Lane', 'Baldwin','NY',11432),
      ('Rowlett Bikes','(972) 530-5555','rowlett@bikes.shop','8000 Fairway Avenue', 'Rowlett','TX',75088);

DROP TABLE staffs;
CREATE TABLE staffs
(
 staff_id INT auto_increment Primary Key,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL UNIQUE,
 phone VARCHAR(25),
 `active` TINYINT NOT NULL,
 store_id INT NOT NULL,
 manager_id INT
 );
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(1,'Fabiola','Jackson','fabiola.jackson@bikes.shop','(831) 555-5554',1,1,NULL);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(2,'Mireya','Copeland','mireya.copeland@bikes.shop','(831) 555-5555',1,1,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(3,'Genna','Serrano','genna.serrano@bikes.shop','(831) 555-5556',1,1,2);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(4,'Virgie','Wiggins','virgie.wiggins@bikes.shop','(831) 555-5557',1,1,2);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(5,'Jannette','David','jannette.david@bikes.shop','(516) 379-4444',1,2,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(6,'Marcelene','Boyer','marcelene.boyer@bikes.shop','(516) 379-4445',1,2,5);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(7,'Venita','Daniel','venita.daniel@bikes.shop','(516) 379-4446',1,2,5);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(8,'Kali','Vargas','kali.vargas@bikes.shop','(972) 530-5555',1,3,1);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(9,'Layla','Terrell','layla.terrell@bikes.shop','(972) 530-5556',1,3,7);
INSERT INTO staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES(10,'Bernardine','Houston','bernardine.houston@bikes.shop','(972) 530-5557',1,3,7);




CREATE TABLE stores
 (
   store_id INT PRIMARY KEY AUTO_INCREMENT,
   store_name VARCHAR(255) NOT NULL,
   phone VARCHAR(25),
   email VARCHAR(255),
   street VARCHAR(255),
   city VARCHAR(255),
   state VARCHAR(10),
   zip_code VARCHAR(5)
); 

INSERT INTO stores(store_name, phone, email, street, city, state, zip_code)
VALUES('Santa Cruz Bikes','(831) 476-4321','santacruz@bikes.shop','3700 Portola Drive', 'Santa Cruz','CA',95060),
      ('Baldwin Bikes','(516) 379-8888','baldwin@bikes.shop','4200 Chestnut Lane', 'Baldwin','NY',11432),
      ('Rowlett Bikes','(972) 530-5555','rowlett@bikes.shop','8000 Fairway Avenue', 'Rowlett','TX',75088);

ALTER TABLE staffs ADD FOREIGN KEY(store_id) REFERENCES stores(store_id); 
ALTER TABLE staffs ADD FOREIGN KEY (manager_id) REFERENCES staffs(staff_id);

/*so what has happened -> in the first table 
staff_id _> primary key
store_id is foreign key referencing store_id of store2

and

manager_id -> is also a foreign key which is referencing staff_id in the same table
i.e for employees with no managers it would reflect null and Managers are also Employees so they would have staff_id*/


/*So let's understand Drop operation*/

/*let's say I need to change the table now i.e first table*/


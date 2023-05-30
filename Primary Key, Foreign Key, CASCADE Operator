/* TOPIC 1 : PRIMARY KEY , FOREIGN KEY */ 
CREATE DATABASE key_primary
USE key_primary;

CREATE TABLE key_primary_table(
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
/*SEE ROW NUMBER 96- 102 */


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

DROP TABLE class /*DOn't run this is possible coz child Table*/ /* So to drop the Primary Table you need to drop the child Table first then drop the primary*/ 


CREATE TABLE test(
id INT NOT NULL,
name VARCHAR(30), 
email_id VARCHAR(30), 
mobile_no VARCHAR(30),
address VARCHAR(30))

SET sql_safe_updates = 0;

ALTER TABLE test ADD PRIMARY KEY (id); /*To show you could add primary key after creation of the Table*/ 

ALTER TABLE test ADD CONSTRAINT test_prim PRIMARY KEY (id,email_id); /* Same error Multiple Primary Key Defined*/ 

ALTER TABLE test DROP PRIMARY KEY; /* Primary Key Dropped lets try Row 98 again*/

ALTER TABLE test ADD CONSTRAINT test_prim PRIMARY KEY (id,email_id); /* EXECUTED*/ 

/* NOTE FOR A TABLE MULTIPLE PRIMARY KEY - NOT POSSIBLE but , FOR A TABLE A PRIMARY KEY WITH COMBINATIONS OF MULTIPLE TABLE - POSSIBLE*/


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

SELECT * FROM parent /*DELETED*/
SELECT * FROM child /*SEE - GOT AUTOMATICALLY UPDATED HERE as the input was deleted from PARENT TABLE*/ 


UPDATE parent SET id = 3 WHERE id = 2;  /*DOESNT  ALLOW YOU TO UPDATE BECAUSE OF TEH EXISTING RELATION*/ 
 
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
  
  
  

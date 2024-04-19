--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              /*STRING FUNCTIONS*/
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                           -- 1. Function: UPPER():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts all characters in a string to uppercase.*/

SELECT UPPER('Hello world'); 

select upper('Hello WOrld');




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 2. Function: LOWER():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts all characters in a string to lowercase.*/
Example:

SELECT LOWER('HELLO WORLD'); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 3. Function: LENGTH():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Returns the length of a string (the number of characters).*/ 

SELECT LENGTH('HELLO WORLD'); 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															 -- 4. Function: SUBSTRING() or SUBSTR(): 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Extracts a substring from a string, given a starting position and length.*/ 

SELECT SUBSTRING('HELLO WORLD', 1, 5); 
SELECT SUBSTR('HELLO WORLD', 1, 5); 

SELECT SUBSTRING('HELLO WORLD', 1,5); 
SELECT SUBSTR('HELLO WORLD', 1, 5) ; 


select substring('Hello World', 1,4); 

 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 5. Function: CONCAT():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Concatenates two or more strings into one string.*/ 

SELECT CONCAT('HELLO' 'WORLD'); 
SELECT CONCAT('HELLO', ' ', 'WORLD'); 




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 6. Function: TRIM():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Removes spaces from the beginning and end of a string.*/ 

SELECT TRIM('  HELLO WORLD  '); 





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 7. Function: LTRIM():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: LTRIM() removes spaces from the left side of a string*/ 

SELECT LTRIM(' HELLO WORLD'); 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 8. Function: RTRIM():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: RTRIM() removes spaces from the right side of a string*/

SELECT RTRIM('HELLO WORLD   '); 





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 9. Function: REPLACE():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Replaces all occurrences of a specified substring within a string with another substring.*/

SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 
 
SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 


 SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL'); 
 
 SELECT REPLACE ('HI HOW ARE YOU' , 'ARE YOU', 'ARE YOU Doing ?'); 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 10. Function: CHAR_LENGTH()or CHARACTER_LENGTH()
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the number of characters in a string (similar to LENGTH()).*/ 

SELECT LENGTH('HELLO WORLD'); 
SELECT CHARACTER_LENGTH('HELLO WORLD'); 
 
SELECT LENGTH('HI WORLD'); 
SELECT CHARACTER_LENGTH('HI WORLD'); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 11. Function: POSITION() or LOCATE()
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Finds the position of a substring in a string.*/ 

SELECT LOCATE('WORLD', 'HELLO WORLD'); 
SELECT POSITION('WORLD' IN 'HELLO WORLD'); 


SELECT INSTR('HELLO WORLD', 'WORLD'); /*also gives same sresult*/ 


SELECT LOCATE('WORLD', 'HELLO WORLD'); 



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 12. Function: LEFT():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Extracts a specified number of characters from the left (start) of a string.*/ 

SELECT LEFT('HELLO WORLD', 4); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 13. Function: RIGHT():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Extracts a specified number of characters from the right (end) of a string.*/


SELECT RIGHT('HELLO WORLD', 4); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             -- 14. Function: REVERSE():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Reverses the characters in a string.*/ 

SELECT REVERSE('HELLO WORLD'); 

SELECT REVERSE('PALLINDROME');

SELECT REVERSE('LUDUL'); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 15. Function: INSTR():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the position of the first occurrence of a substring in a string.*/

SELECT INSTR('HELLO WORLD', 'WORLD'); 

SELECT POSITION('WORLD' IN 'HELLO WORLD'); /*RECALL*/ 
SELECT LOCATE('WORLD', 'HELLO WORLD'); /*RECALL*/ 




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 16. Function: LPAD():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Pads a string from the left with a specified string up to a certain length.*/ 

SELECT LPAD('HELLO', 10, '*'); 
SELECT LPAD('HELLO', 11, '*');
SELECT LPAD('HELLO', 4, '*'); 

SELECT LPAD('HELLO', 20, '*'); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
														      -- 17. Function: RPAD():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Pads a string from the right with a specified string up to a certain length.*/ 

SELECT RPAD('HELLO', 20, '*'); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 18. Function: ASCII():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Role: Returns the ASCII value of the first character of the string.*/ 

SELECT ASCII('HELLO'); 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 19. Function: CHAR():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Converts an ASCII code to a character.*/ 

SELECT CHAR(72); 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															  -- 20. Function: FIELD():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the index position of a value in a list of values.*/

SELECT FIELD('b', 'a', 'b', 'c', 'd');

select field('b','a','b','c','d') ;







--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              -- 21. Function: FIND_IN_SET():
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Role: Returns the position of a string within a list of strings separated by commas.*/ 


SELECT FIND_IN_SET('b', 'a,b,c,d');

SELECT FIND_IN_SET('HELLO', 'HELLO, WORLD, Tiger, LION'); 


select field('b', 'a,b,c,d');








--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT CONCAT('HELLO', ' ', 'WORLD'); 
SELECT SUBSTRING('HELLO WORLD', 1, 7); 

SELECT TRIM('HELLO WORLD  '); 
SELECT TRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE; -- Note: shows error, MYSQL with TRIM handles only spaces. 
SELECT LTRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE; -- Same Error

SELECT TRIM(LEADING '*' FROM '********T E S T I N G 1 2 3 4********'); -- worked
SELECT TRIM(TRAILING '*' FROM '********T E S T I N G 1 2 3 4********'); -- Worked
SELECT TRIM('*' FROM '********T E S T I N G 1 2 3 4********'); -- from both sides.














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

select 

select * from information_schema.schemata;

select * from information_schema.tables where table_schema = 'ineuron_triggers_case'; 

select * from information_schema.columns where table_schema = 'ineuron_triggers_case';


select * from information_schema.columns where table_schema = 'ineuron_triggers_case'
AND table_name = 'transfer_log';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                              # SNOWFLAKE CONTENTS 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE RM_STRING_FUNCTION;
USE DATABASE RM_STRING_FUNCTION;


-- SUBSTR()
SELECT substr('HELLO WORLD',1,1);
SELECT substr('Hello World',-2 ,2);
SELECT substr('Hello World',1,4);
SELECT substr('Hello World',2,4);
SELECT substr('HELLO WORLD',-11,11);
SELECT substr('Hello',-2,2); 

SELECT substr('RONU MONDEEP MOHANTY',1,4) AS first_name;
SELECT substr('RONU MONDEEP MOHANTY',6,7) AS middle_name;
SELECT substr('RONU MONDEEP MOHANTY',14,7) AS last_name;



-- Find the first letter of your Name and Last letter of your Name

SELECT 'RONU MONDEEP MOHANTY' AS name, 
CONCAT(substr('RONU MONDEEP MOHANTY',1,1),substr('RONU MONDEEP MOHANTY',20,1)) AS initials;



SELECT 'RONU MONDEEP MOHANTY' AS name, 
substr('RONU MONDEEP MOHANTY',1,1) || substr('RONU MONDEEP MOHANTY',20,1) AS initials; 
-- || could be used in place of Concat



CREATE OR REPLACE TABLE AGENTS
 (
    AGENT_CODE CHAR(6) NOT NULL PRIMARY KEY,
    AGENT_NAME CHAR(40) ,
    WORKING_AREA CHAR(35),
    COMMISSION NUMBER(10,2) DEFAULT 0.05,
    PHONE_NO CHAR(15),
    COUNTRY VARCHAR2(25)
);

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore',0.15,'077-25814763', '');
INSERT INTO AGENTS(AGENT_CODE,AGENT_NAME,WORKING_AREA)
VALUES ('A110', 'Anand', 'Germany');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '')

SELECT * FROM AGENTS;

--Example 2: Get the substring from a specific string by using table data
select AGENT_CODE,AGENT_NAME,substring(AGENT_NAME,1,2) AS AGENT_INITIALS from agents;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                      --CONCAT:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CONCANATING AGENT_CODE AND AGENT_NAME COLOUMN OF AGENT TABLE.

 SELECT CONCAT( AGENT_CODE, AGENT_NAME) AS AGENT_DETAIL
 FROM AGENTS;


 -- . CONCATNATING TWO COLOUMN WITH SPACE IN BETWEEN

 SELECT CONCAT( AGENT_CODE, ' ' ,AGENT_NAME) AS AGENT_DETAIL
 FROM AGENTS;

 -- CONCANATING TWO COLOUMN USING “ || ”

 SELECT AGENT_CODE || ' ' || AGENT_NAME AS AGENT_DETAIL FROM
 AGENTS;

 -- CONCAT_WS:
    -- requires at least two arguments, and uses the first argument to separate all following arguments.
    SELECT CONCAT_WS('-', 'KA','India') as state_country;





 










-- CONCATENATE TWO COLUMN AND USING SEPARATER AS ‘ - ‘ , SEPARATE TWO COLUMN.
SELECT CONCAT_WS('–', AGENT_CODE, AGENT_NAME) AS AGENT_DETAIL FROM AGENTS;
-- CONCAT IS is FASTER

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                          -- TRIMMING
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove leading ‘0’ and ‘#’ characters from a string:

select ltrim('#0000AISHWARYA', '#0'); 
-- In the set '#0', '#' and '0' are treated as individual characters, not as a substring.
-- So, LTRIM will remove leading occurrences of either '#' or '0' individually, not the substring '#0'




-- Remove leading ‘ ’ from a string:
select ltrim('  Ronu',' ');

-- Remove trailing 0 and . characters from a string
select rtrim('$125.00','0'); -- o/p: $125.
select rtrim('$125.02','.0'); -- o/p: $125.02
select rtrim('$125.02','0.'); -- o/p  $125.02
select RTRIM ('$125.00', '0.'); -- o/p  $125

select RTRIM ('$125.20', '0.'); -- o/p  $125.2
select RTRIM ('$125.20', '0.2'); -- o/p  $125
select RTRIM ('$125.20', '.'); -- o/p  $125.20

-- Trim: removes both leading and trailing spaces.

select TRIM('❄-❄ABC-❄-', '❄-') as trimmed_string;

SELECT TRIM('********T E S T I N G 1 2 3 4********','*') AS TRIMMED_SPACE;

SELECT TRIM('********T E S T I*N*G 1 2 3 4********','*') AS TRIMMED_SPACE; --MArk:characters in middle not removed.




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- REVERSE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT reverse('Hello');


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- REPLACE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT REPLACE('HELLO WORLD','WORLD','EARTH');

SELECT REPLACE('abcd','bc'); -- op: ab

-- Replace Whitespace with *
 select REPLACE( ' RONU MONDEEP MOHANTY ' ,' ','*');
 select REPLACE( ' RONU MONDEEP MOHANTY',' ','*');

 -- Replacing whitespace
 
SELECT REPLACE(' T E S T I N G 1 2 3 4 ',' ');


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- REPEAT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT REPEAT('Ronu',5);





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- Lower
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT LOWER('RONU MONDEEP MOHANTY') AS LOWER_CASE;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- Upper
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT UPPER('ronu mondeep mohanty') AS UPPER_CASE;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- INITCAP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- It returns the input string exp with the first letter of each word in uppercase and the subsequent 
-- letters in lowercase.

SELECT INITCAP(' INDIA Is MY cOUntRY') AS TITLE;



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                             -- SPLIT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- split a string into multiple rows based on a delimiter.
--  useful when you want to split a string into multiple values and treat them as separate rows in your query.

-- RETURN TYPE ARRAY

SELECT SPLIT('Hello World',' ');


create or replace table aj_persons
(
 NAME CHAR(10),
 CHILDREN VARCHAR(30)
);

INSERT INTO AJ_PERSONS
VALUES('Mark','Marky,Mark Jr,Maria'),('John','Johnny,Jane');

SELECT * FROM AJ_PERSONS;

-- Split the children column
SELECT SPLIT(CHILDREN,',') FROM AJ_persons;


-- Split the custom agent_details column.

SELECT * FROM agents;

SELECT SPLIT(agent_details,'-') as split_details
FROM
(
SELECT *,concat(AGENT_CODE, '-', AGENT_NAME) AS agent_details FROM agents
) AS alias_table;

SELECT * FROM agents;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                   -- SPLIT_PART
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- let's say you are asked to split and store the parts of split into 3 different columns

SELECT 'RONU MONDEEP MOHANTY' as Name, split_part('RONU MONDEEP MOHANTY',' ',1) AS first_name,
split_part('RONU MONDEEP MOHANTY',' ',2) AS mid_name,
split_part('RONU MONDEEP MOHANTY',' ', 3) AS last_name;

    -- 2 indicates you want to extract the second part after splitting the strings based on the delimiter space.
    -- 3 indiccates you want to extract the third part after splitting the strings based on the delimiter space. 


select * from agents; 

select *, 
      split_part(phone_no, '-',1) AS country_code,
      split_part(phone_no,'-',2) AS mobile_number
FROM agents; 


-- Let's say in a term which you will be splitting how could you find the number of split

-- 'Ronu-mondeep-mohanty' , count the number of split poissible here.
-- no of split = no of delimiters 

select length('Ronu-Mondeep-Mohanty') - length(REPLACE('Ronu-Mondeep-Mohanty','-','')) AS no_of_occurence;
-- we removed the delimiter by using replace, replaced - with ''
-- Calculated the length without delimiter.
-- substracted the same from the total length that is length with delimiter.
-- no of delimiters = no of split





select length('Ronu-Mondeep-Mohanty') - length(replace('Ronu-Mondeep-Mohanty','-')) AS c_ount;


SHOW TABLES IN DATABASE RM_STRING_FUNCTION;

SELECT *
FROM information_schema.tables
WHERE table_schema = 'RM_STRING_FUNCTION.public';


---------------------------------------------------------------------------------------------------------
                                  -- LIKE
---------------------------------------------------------------------------------------------------------


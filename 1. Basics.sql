show databases;
create database ineuron; 
use ineuron;/* used to Create data base */
create database if not exists ineuron_fsda; /* used to create only if the data base previously doesnt exist */


create table bank_details(
age int,
job varchar(30),
marital Varchar(30),
education varchar(30), 
`default` varchar(30), /* ` is used to denote default keywords and when u intend not to change them */
balance int,
housing varchar(30),
loan int,
contact int,
`day` varchar(30),
`month` int,
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))


/*again if I wish to re run it would say that it already exists what I can do is I can use 'If not exists' see below */
/* using this wont give me error but would put a warning sign*/

create table if not exists bank_details(
age int,
job varchar(30),
marital Varchar(30),
education varchar(30), 
`default` varchar(30), /* ` is used to denote default keywords and when u intend not to change them */
balance int,
housing varchar(30),
loan int,
contact int,
`day` varchar(30),
`month` int,
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))


/* To see the Table created in a Tabular Format */
/* Either CLick on the table Bank_Details in the right there is a tabular symbol or You could raise a Query */

Select * from bank_details

/* Inserting Data from a a sheet, we would be doing with one entry at first that is one row, bulk entry is however possibl */

create table if not exists bank_details(
age int,
job varchar(30),
marital Varchar(30),
education varchar(30), 
`default` varchar(30), /* ` is used to denote default keywords and when u intend not to change them */
balance int,
housing varchar(30),
loan int,
contact int,
`day` varchar(30),
`month` int,
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

select * from bank_details
insert into bank_details values(58,"management","married","tertiary","no",2143,"yes",1,6371,5,2,261,1,-1,0,"unknown","no")
/*The above querry wasn't operating for the Data Type was given wrongly I had added Loan as int type */
/*Thus just learn the process and I created a new Folder Ineuron_fsda2 */


create table bank_details2(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int , 
housing varchar(30),
loan varchar(30) , 
contact varchar(30),
`day` int,
`month` varchar(30) , 
duration int , 
campaign int,
pdays int , 
previous int , 
poutcome varchar(30) , 
y varchar(30))

select * from bank_details2;

insert into bank_details2 values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no")/*Note in the previous things it was unorganised and Error
used to come, and by merely changing the table columns data types without changing the folder names didn't work) */

select * from bank_details2;


/* in the above it was just one record we inserted , what if we need to insert 100 records*/

/*It is just like the above with records after Parentheses separated by a Comma */
/* For the time being we have to do it Manually */
select * from bank_details2;

insert into bank_details2 values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no")/*Note here there is no comma*/

select * from bank_details2;

/* similarly for multiple Number of Data do like this */

insert into bank_details2 values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(29,"management","single","tertiary","no",0,"yes","no","unknown",5,"may",363,1,-1,0,"unknown","no"),
(54,"blue-collar","married","secondary","no",1291,"yes","no","unknown",5,"may",266,1,-1,0,"unknown","no"),
(48,"management","divorced","tertiary","no",-244,"yes","no","unknown",5,"may",253,1,-1,0,"unknown","no"),
(32,"management","married","tertiary","no",0,"yes","no","unknown",5,"may",179,1,-1,0,"unknown","no"),
(42,"admin.","single","secondary","no",-76,"yes","no","unknown",5,"may",787,1,-1,0,"unknown","no"),
(24,"technician","single","secondary","no",-103,"yes","yes","unknown",5,"may",145,1,-1,0,"unknown","no"),
(38,"entrepreneur","single","tertiary","no",243,"no","yes","unknown",5,"may",174,1,-1,0,"unknown","no"),
(38,"management","single","tertiary","no",424,"yes","no","unknown",5,"may",104,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",306,"yes","no","unknown",5,"may",13,1,-1,0,"unknown","no"),
(40,"blue-collar","single","unknown","no",24,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(46,"services","married","primary","no",179,"yes","no","unknown",5,"may",1778,1,-1,0,"unknown","no"),
(32,"admin.","married","tertiary","no",0,"yes","no","unknown",5,"may",138,1,-1,0,"unknown","no"),
(53,"technician","divorced","secondary","no",989,"yes","no","unknown",5,"may",812,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",249,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",790,"yes","no","unknown",5,"may",391,1,-1,0,"unknown","no"),
(49,"blue-collar","married","unknown","no",154,"yes","no","unknown",5,"may",357,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",6530,"yes","no","unknown",5,"may",91,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",100,"no","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",59,"yes","no","unknown",5,"may",273,1,-1,0,"unknown","no"),
(55,"technician","married","secondary","no",1205,"yes","no","unknown",5,"may",158,2,-1,0,"unknown","no"),
(35,"blue-collar","single","secondary","no",12223,"yes","yes","unknown",5,"may",177,1,-1,0,"unknown","no"),
(57,"blue-collar","married","secondary","no",5935,"yes","yes","unknown",5,"may",258,1,-1,0,"unknown","no"),
(31,"services","married","secondary","no",25,"yes","yes","unknown",5,"may",172,1,-1,0,"unknown","no"),
(54,"management","married","secondary","no",282,"yes","yes","unknown",5,"may",154,1,-1,0,"unknown","no"),
(55,"blue-collar","married","primary","no",23,"yes","no","unknown",5,"may",291,1,-1,0,"unknown","no"),
(43,"technician","married","secondary","no",1937,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",384,"yes","no","unknown",5,"may",176,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",582,"no","yes","unknown",5,"may",211,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","no",91,"no","no","unknown",5,"may",349,1,-1,0,"unknown","no"),
(49,"services","divorced","secondary","no",0,"yes","yes","unknown",5,"may",272,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","yes",1,"yes","no","unknown",5,"may",208,1,-1,0,"unknown","no"),
(45,"admin.","single","secondary","no",206,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(47,"services","divorced","secondary","no",164,"no","no","unknown",5,"may",212,1,-1,0,"unknown","no"),
(42,"technician","single","secondary","no",690,"yes","no","unknown",5,"may",20,1,-1,0,"unknown","no"),
(59,"admin.","married","secondary","no",2343,"yes","no","unknown",5,"may",1042,1,-1,0,"unknown","yes"),
(46,"self-employed","married","tertiary","no",137,"yes","yes","unknown",5,"may",246,1,-1,0,"unknown","no"),
(51,"blue-collar","married","primary","no",173,"yes","no","unknown",5,"may",529,2,-1,0,"unknown","no"),
(56,"admin.","married","secondary","no",45,"no","no","unknown",5,"may",1467,1,-1,0,"unknown","yes"),
(41,"technician","married","secondary","no",1270,"yes","no","unknown",5,"may",1389,1,-1,0,"unknown","yes"),
(46,"management","divorced","secondary","no",16,"yes","yes","unknown",5,"may",188,2,-1,0,"unknown","no"),
(57,"retired","married","secondary","no",486,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(42,"management","single","secondary","no",50,"no","no","unknown",5,"may",48,1,-1,0,"unknown","no"),
(30,"technician","married","secondary","no",152,"yes","yes","unknown",5,"may",213,2,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",290,"yes","no","unknown",5,"may",583,1,-1,0,"unknown","no")

select * from bank_details2

/*USAGE OF NOT*/

SELECT * FROM bank_details2 WHERE NOT education = 'secondary'; 
SELECT * FROM bank_details2 WHERE NOT marital = 'unknown';
SELECT * FROM bank_details2 WHERE NOT marital IN('married','unknown'); 



/* COUNT: TO FIND THE NUMBER OF RECORDS INSIDE THE TABLE*/

select count(*) from bank_details2; /* star means all records*/

select * from bank_details2;

select count(*) from bank_details2;

/* IF WE WISH TO FIND ONLY SPECIFIC COLUMNS NOT ALL COLUMNS */

select age,loan,job from bank_details2;

/* WHAT IF WE WISH TO FIND A COLUMN WHICH HAS A RESERVED KEY WORD FOR EXAMPLE 'default' IN THIS DATA SET*/

select default from bank_details; /*This isn't going to work for default is also a reserve keyword*/

select `default` from bank_details2 ;/*This is working check code row n0 61 Scroll up */ 

/*LIMIT: If we use Select age,loan,job from bank_details2 -> It would give me all the records of each Column, but I need 
only 2-3 records- HOW TO DO? */

select * from bank_details2 limit 5; /*returns or loads first 5 records*/

/*WHERE : If we wish to find out records which match a condition for Eg - only those records of which Age = 33*/

select * from bank_details2 where age = 33;


/* >= - E.g SHOW RECORDS ONLY OF SENIOR CITIZENS (i.e age must be greater than 60 years) */

select * from bank_details2 where age > 60;
select * from bank_details2 where age = 60 ;/* This shows 5 records  people who are 60 and retired also who are 60 and yet working */

/*AND: show me when age is 60 and job is retired */

select * from bank_details2 where age = 60 and job = "retired";
select * from bank_details2 where age = 60 and job = 'retired'; /* Single Quotes also gives us the same record*/

/*OR: DATA WHEN THE EDUCATION IS UNKOWN OR MARITAL STATUS IS SINGLE */

select * from bank_details2 where education = 'unknown' or marital = 'single';

/* USING AND & OR : Marital is single or Education is unkown and balance is < 5*/

select * from bank_details2 where marital = 'single' or education = 'unknown' and balance < 500; /* But here it isnt showing correct details */
/*because everything above were open, so sql couldnt understand)*/

select * from bank_details2 where (marital = 'single' or education = 'unknown') and balance < 500;

/*DISTINCT: if we are interested to find the types of Jobs*/
select distinct job from bank_details2 ;/*returns only the types of Jobs*/
select distinct(job) from bank_details2;  /*same as above*/


select job from bank_details2; /*returns all records on jobs*/

select * from bank_details2; 





/* ORDER BY : Sorting the Data may be alphabetically or Decending order - Be default it arrnages inb ascending*/

select * from bank_details2 order by age; /*sorted ascending order*/



/*DESC: to sort in Descending order*/

select * from bank_details2 order by age desc;
select * from bank_details2 order by age desc limit 6; 

/*SUM: finding Sum of Balances*/
select sum(balance) from bank_details2;
select sum(balance) as total_balance from bank_details2; 


/*MIN: finding min of Balances*/

select min(balance) from bank_details2;

/*MAX: finding Sum of Balances*/

select max(balance) from bank_details2;


Select * from bank_details2 where loan = 'yes';

select avg(balance) from bank_details2;



/*HOMEWORK*/

/*23rd JULY 2022 CLASS */


/* 1. Try to find out avarage of balance */

select avg(balance) from bank_details2;

/*try to find out who is having a min balance*/

select min(balance) from bank_details2;

select * from Bank_details2 order by balance; /*this will order the table in ascending order of the Balance, but we just need 1 */

select * from bank_details2 order by balance limit 1; /* 2ND WAY TO FIND MIN */

select  * ,  min(balance) from bank_details2;

select * from bank_details2 where balance in (select min(balance) from bank_details2)/*3rd WAY TO FIND MIN WITH ALL RECORDS*/

select * from bank_details2 where balance =  ( select min(balance) from  bank_details2);/*4TH WAY - LITTLE COMPLICATED*/

select * from bank_details2 where balance = (select min(balance) from bank_details2); 





SELECT * FROM bank_details2 WHERE balance = (SELECT MIN(balance) FROM bank_details2) ; 


/* 2. try to find out who is having a maximum balance */

select max(balance) from bank_details2; /*1ST WAY*/

select * from bank_details2 order by balance  desc limit 1; /*2ND WAY*/

select * from bank_details2 where balance in (select max(balance) from bank_details2);/*3rd WAY*/

select * from bank_details2 where balance = (select max(balance) from  bank_details2);/*4th WAY*/



/* 3. try to prepare a list of all the person who is having loan*/

select * from bank_details2 where loan = 'yes';

/* 4. try to find out average balance for all the people whose job role is admin*/

select avg(balance) from bank_details2 where job = 'admin.';

/* 5. try to find out a record  without job whose age is below 45*/

select * from bank_details2 where (job = 'unknown' or job = 'retired') and age < 45 ;/* IF jobless is retired or unknown */

select * from bank_details2 where job = 'unknown' and age <= 45;



/* 6. try to find out a record where education is primarty and person is jobless*/


select * from bank_details2 where education = 'primary' and (job = 'unknown' or job = 'retired');

SELECT * FROM bank_details2 WHERE education = 'primary' AND job IN ('Unknown', 'retired'); 

select * from bank_details2 where education = 'primary' and job = 'unknown';

/* 7. try to find of a record whose bank account is having a negative balance*/

select * from bank_details2 where balance < 0;

/* 8. try to find our a record who is not having house at all along with there balance*/

Select * from bank_details2 where housing = 'no' and balance > 0;

select housing,balance from bank_details2 where housing = 'no' ;/* 2nd WAY*/


/* Using Order by to sort ALphabetically*/

SELECT * FROM bank_details2 ORDER BY marital, education; 
SELECT * FROM bank_details2 ORDER BY education, marital;

SELECT * FROM bank_details2 ORDER BY balance;

select age, job, marital from bank_details2 order by 1,2; 

select age, job, marital from bank_details2 order by 3; 



--------------------------------------------------------------------------------------------------------------------------------------------------
                                                            # INFORMATION_SCHEMA
--------------------------------------------------------------------------------------------------------------------------------------------------

-- The information_schema database in MySQL provides access to metadata about the database server itself. 
-- provide information about databases, columns, indexes, privileges, and more.


# Shows databases/Schema
SELECT * FROM information_schema.schemata;

select * from information_schema.schemata; 
	



# Show tables in a specific database/schema
SELECT * FROM information_schema.tables WHERE table_schema = 'ineuron';
 
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ineuron_views';


# Show columns in a specific database/schema
SELECT * from information_schema.columns where table_schema = 'ineuron'; 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE  TABLE_SCHEMA = 'ineuron'; 


# Show columns in a specific table
SELECT * FROM information_schema.columns where table_schema = 'ineuron' and 
table_name = 'accounts';
select * from information_schema.tables where table_Schema = 'ineuron';
select * from information_Schema.tables where table_schema = 'ineuron';

# Show privileges granted to a specific user
SELECT * FROM information_schema.user_privileges where grantee = 'root@localhost';


# Show privileges granted on a specific table

SELECT * FROM information_schema.table_privileges where table_schema = 'ineuron' and 
table_name = 'accounts';

--------------------------------------------------------------------------------------------------------------------------------------------------





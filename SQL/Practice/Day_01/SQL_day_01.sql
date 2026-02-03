# How to show all the databases in the existing server
show databases;

#How to create the database?
create Database ineuron_fsda;

#How to safe create the database?
create database if not exists  ineuron_fsda; -- it show the warning if already create

#How to perform task only same database
use ineuron_fsda;

#How to create the table
Create table if not exists bank_details( -- if the table is exists then it show some of the warning
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30));

#How to show the data from the database;
select * from bank_details;

#How to insert the the data into the table one by one
insert into bank_details values(
58,"management","married","tertiary",
"no",2143,"yes","no","unknown",5,
"may",261,1,-1,0,"unknown","no");

#How to insert the bulk amount of the data in the single table or single hit
insert into bank_details values
(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no"),
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
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no");  

#show the result or table after the fill the multiple record in the table
select * from bank_details;

# How many recored are present inside my table
select count(*) as total_records from bank_details;

# How to get show the particular column
select age,loan,job from bank_details;

# How to get or show the particular column and the column name also keyword of the mysql commad
-- so use the tilde sing to perform this task
select age,`default`,`day` from bank_details;

#How to get only specific record in entire record
-- just show the first 5 record in the entire table
select * from bank_details limit 5;
-- show the first 10 record in the entire table
select * from bank_details limit 10;
-- show the only 1 record in the entire table
select * from bank_details limit 1;
-- show the entire table record from the the bank_details;
select * from bank_details;

#can you show the record of the table where the age is equl to the 33
select * from bank_details where age=33;

# can you show the record of the table where the age is grator than the 55
select * from bank_details where age>55;

# can you show the record of the table where the age is grator than 55 and balance is grator than 100
select * from bank_details where age>55 and balance >100;

#can you show the record of the table where the person where marital status is ''single'' OR education is unknown.
select * from bank_details where marital ='single' Or education ='unknown';

##can you show the record of the table where the person where marital status is ''single'' OR education is unknown and balance is less than 500
select * from bank_details where (marital ="singl" or education ="unknown") and balance <500;

# How many job type are present in the job column . how to show it
select distinct job from bank_details;

# How to arrange the data in the ascending or descending order in the behalf of the age;
select * from bank_details order by age desc;
-- same as the ascending order
select * from bank_details order by age asc;


# Practice question
-- 1. with this dat try to find out sum of the balance 
select sum(balance) as total_balance from bank_details;

-- 2. with this data try to find out average of balance 
select avg(balance) as Average_balance from bank_details;

-- 3. with this data find out who is having minimum balance
select * from bank_details where balance= (select min(balance) from bank_details);

-- 4. with this data find out who is having the maximum balance
select * from bank_details where balance = (select max(balance) from bank_details);

-- 5. In this entire data try to prepare a list of all the person who is having loan
# first chek how many distinct are present in this column
select distinct loan from bank_details;
# then use to where prepare the sheet to all person who having the loan
select * from bank_details where loan='yes';
# and chek how many person are involved in this used to the below query
select count(*) as total_loan_person from bank_details where loan="yes";

-- 6 with this data try to find out average balance for all people who job role is admin
  # first i check the job column admin present or not
	select distinct job from bank_details;
      # so yes job column 'admin.' is present 
  #Now fin the avg balance where job is 'admin.'
select avg(balance) as Average_balance from bank_details where job='admin.';

-- 7. with this entire data try to find out a person without job whose age is 45
select distinct job from bank_details;
# without job means 'retired' or unknown
select * from bank_details where job="retired" or job="unknown";

-- 8. with this entire data try to find out the record where education is primary and person is jobless
select distinct education from bank_details;
# jobless means 'retired' or unknown
select * from bank_details where education="primary" and (job="retired" or job="unknown"); 

-- 9 with this entire data try to find out the record where bank_account is having a negative balance
select * from bank_details where balance<0;

-- 10 with this entire data try to find out the who is not having house at all along with their balance
   # first find the how many distrinct the house;
   select distinct housing from bank_details;
# now achive the final goal
select * from bank_details where housing ="no" order by balance desc;

-- ---------------------------------------------Day- 01 Completed  ------------------------------------------------------------



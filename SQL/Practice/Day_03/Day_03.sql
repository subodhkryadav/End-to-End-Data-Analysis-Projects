-- ------------------------------ Day 03 -------------------------------------
# Create the database
create database dress_data;

# use this data base
use dress_data;

# Now create the table for the entire data
create table if not exists dress(
Dress_ID varchar(30),
Style varchar(30),
Price varchar(30),	
Rating varchar(30),	
Size varchar(30),	
Season varchar(30),	
NeckLine varchar(30),	
SleeveLength varchar(30),	
waiseline varchar(30),	
Material varchar(30),	
FabricType varchar(30),	
Decoration varchar(30),	
`Pattern Type` varchar(30), -- type is the special keyword that is not make table name so use tilde sign	
Recommendation varchar(30));

# show the table
select * from dress;

# Now i create the procedure to not repeat that above show record again and again
Delimiter &&
create procedure show_record()
begin 
	select * from dress;
end && 
Delimiter ;

# call this procedure
call show_record();

#Now i write the query to load bulk amount of data into the single query
load data infile 'D:/Attribute DataSet.csv'
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- When ever i execute that part of the code that give one Error
	-- myslq is running at secure-file-private error
			-- when ever error are come then the admin are fixed that issue when you are woring professional
				-- because i dont have any permission to change anything
# so How to solve in loacl directory or own pc or laptop

# This is the following step to follow to solve the issue:-
-- 1. go to c drive 
-- 2. go to program data
-- 3. bydefault this is the hidden folder
-- 4. if you are not able to see it right click inside the c drive and go to view check the hidden item
-- 5. then show the program data
-- 6. Go to the program data folder search MYSQL
-- 7. inside this mysql find out mysql server what version you will be install then go to this directory
-- 8. inside it go to the my and open it
-- 9. and make sure open in the notepad++ on admin mode
-- 10 inside this file every type of configuration are occured
-- 11 inside this find that "secure-file-priv" 
-- 12 you are see the some test are present after that justlike:-  secure-file-priv="####"
-- 13 remove that test just like only contain:- secure-file-priv=""
-- 14 make sure another are same only  test are remove 
-- 15 finally save it and all set your are run above query without going error

# Now show the record after pushing bulk amount of the data
call show_record();

# check how many record are uploaded
select count(*) as total_record from dress;

-- ------------ The bulk upload are done by the above command ---------------------

-- ------------------------- Now Working with the Constraints --------------------------

-- ----------------------------# Auto_increment ---------------------------------------
create table test(
test_id int auto_increment,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30));

# it show the error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key
-- so when ever i create talbe and use the auto_increment make sure this column are the primary_key alway
		-- just like the following example

# Now create the table --------------- primary key-------------------------------------------
create table test(
test_id int auto_increment,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30),
primary key (test_id));

#Now show the table i created use the autoincrement + primary key
select * from test;

#insert the data
insert into test values
(1,"subodh","subodhKumary@gmail.com","jaipur"),
(2,"sonu","sonu@gmail.com","delhi"),
(3,"monu","monu@gmail.com","dbg"),
(4,"madhav","madhav@gmail.com","pune"),
(5,"suraj","surajsuraj@gmail.com","hydrabad"),
(6,"vishal","vishal26732@gmail.com,","rampura");

# create new table to show the result
create table test1(
test_id int auto_increment,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30),
primary key (test_id));

# insert the values
insert into test1(test_name,test_mail,test_address) values
("subodh","subodhKumary@gmail.com","jaipur"),
("sonu","sonu@gmail.com","delhi"),
("monu","monu@gmail.com","dbg"),
("madhav","madhav@gmail.com","pune"),
("suraj","surajsuraj@gmail.com","hydrabad"),
("vishal","vishal26732@gmail.com,","rampura");  

select * from test1;  -- i don't pass the id it atutomatically increment starting from 1

-- ------------------------------------------------- Auto_Increment are done -----------------------------------------------------------------------------------

#--- Now perform the ------ Check -----------------------

# create table test3
create table test2(
test_id int ,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));

insert into test2(test_id,test_name,test_mail,test_address,test_salary) values
(1,"subodh","subodhKumary@gmail.com","jaipur",23000),
(2,"sonu","sonu@gmail.com","delhi",20000),
(3,"monu","monu@gmail.com","dbg",500),
(4,"madhav","madhav@gmail.com","pune",80000),
(5,"suraj","surajsuraj@gmail.com","hydrabad",40000),
(6,"vishal","vishal26732@gmail.com","rampura",100000);
select * from test2;

# creat a table and fill the data the data are match to that person entry where address is delhi

create table test3(
test_id int ,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30) check(test_address='delhi'),
test_salary int check(test_salary > 10000));

insert into test3(test_id,test_name,test_mail,test_address,test_salary) values
(1,"subodh","subodhKumary@gmail.com","jaipur",23000),
(2,"sonu","sonu@gmail.com","delhi",20000),
(3,"monu","monu@gmail.com","dbg",500),
(4,"madhav","madhav@gmail.com","pune",80000),
(5,"suraj","surajsuraj@gmail.com","hydrabad",40000),
(6,"vishal","vishal26732@gmail.com","rampura",100000);
# above are note allow 
insert into test3 values(2,"sonu","sonu@gmail.com","delhi",20000);
select * from test3;

#-- one ex take , some people fill its age in the negative values how to fix it
alter table test3 add check(test_id>0);
#now insert some of the record 
insert into test3 values(-2,"sonu","sonu@gmail.com","delhi",20000);
# it not take -ve val
# so fill the 
insert into test3 values(2,"sonu","sonu@gmail.com","delhi",20000);

select * from test3;
-- --------------------------- Check are done ------------------------------------------------

-- ----------------------------------`NOT NULL`-----------------------------------------------
#  Not null means the column not be blank 

 
create table test4(
test_id int Not null,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));

insert into test4 values
(1,"subodh","subodhKumary@gmail.com","jaipur",23000),
(2,"sonu","sonu@gmail.com","delhi",20000),
(3,"monu","monu@gmail.com","dbg",50000),
(4,"madhav","madhav@gmail.com","pune",80000),
(5,"suraj","surajsuraj@gmail.com","hydrabad",40000),
(6,"vishal","vishal26732@gmail.com","rampura",100000);
select * from test4;

# another exa
insert into test4(test_id,test_name,test_mail,test_address,test_salary) values
(1,"subodh","subodhKumary@gmail.com","jaipur",23000);

select * from test4;

-- ----------------------------- NOt NUll done ----------------------------------------------

-- #---------------------------------Default -------------------------------------------------
create table test5(
test_id int Not null default 4,
test_name varchar(30),
test_mail varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));

insert into test5 values
("subodh","subodhKumary@gmail.com","jaipur",23000),
("sonu","sonu@gmail.com","delhi",20000),
("monu","monu@gmail.com","dbg",50000),
("madhav","madhav@gmail.com","pune",80000),
("suraj","surajsuraj@gmail.com","hydrabad",40000),
("vishal","vishal26732@gmail.com","rampura",100000);
-- it shoow errro
select * from test5;

insert into test5(test_name,test_mail,test_address,test_salary) values
("subodh","subodhKumary@gmail.com","jaipur",23000); -- it run properly default take 4

select * from test5;

insert into test5(test_id,test_name,test_mail,test_address,test_salary) values
(1110,"subodh","subodhKumary@gmail.com","jaipur",23000); -- it run properly it give own value not default

select * from test5;

-- ----------------------------------------- Default is done -----------------------------------------------------


-- # --------------------------------------------Unique ----------------------- --------------------------
# create table
create table test6(
test_id int Not null default 4,
test_name varchar(30),
test_mail varchar(30) unique,
test_address varchar(30),
test_salary int check(test_salary > 10000));

# insert the value
insert into test6(test_id,test_name,test_mail,test_address,test_salary) values
(1110,"subodh","subodhKumary@gmail.com","jaipur",23000);

# now again same will be execute then it throw the error
insert into test6(test_id,test_name,test_mail,test_address,test_salary) values
(1110,"subodh","subodhKumary@gmail.com","jaipur",23000); -- email are not unique the email will be repeated
-- example of the unique is :- phone number, email, aadhar number, pasword id number, pancard etc

-- ----------------- all done -------------------------------------------------------------------

# sumrized it one table
create table if not exists test7(
test_id int Not null auto_increment,
test_name varchar(30) Not null default "unknown",
test_mail varchar(30) unique,
test_address varchar(30) check(test_address='delhi'),
test_salary int check(test_salary > 10000),
primary key(test_id));

# 1. insert the values 
insert into test7 values
(1110,"subodh","subodhKumary@gmail.com","delhi",23000);

-- 2. missing the test_id
insert into test7(test_name,test_mail,test_address,test_salary) values
("subodh","subodhKumary1@gmail.com","Delhi",23000); 

-- 2. 
insert into test7(test_id,test_name,test_mail,test_address,test_salary) values
(11111,"subodh","subodhKumary13@gmail.com","Delhi",23000); 
select * from test7;

-- 3. 
insert into test7(test_name,test_mail,test_address,test_salary) values
("subodh","subodhKumary131@gmail.com","Delhi",23000); 
select * from test7;

-- 4. 
insert into test7(test_name,test_mail,test_address,test_salary) values
("subodh","subodhKumary1311@gmail.com","Delhi",23000); 
select * from test7;

-- -------------------------------Day-03 done --------------------------------------------------------

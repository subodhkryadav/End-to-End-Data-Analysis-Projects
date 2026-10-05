# How to show the entire database in the existing server
SHOW DATABASES;

# How to create the Databases
CREATE DATABASE Ineuron_Fsda;

-- it show the warning that the database is already exists
CREATE DATABASE IF NOT exists Ineuron_fsda; 

# Now perform the all kind of thing into this data 
USE Ineuron_Fsda;

# Frist i create the Table
CREATE TABLE IF NOT EXISTS BANK_DETAILS
(
	AGE INT,
    JOB VARCHAR(40),
    MARITAL VARCHAR(30),
    EDUCATION VARCHAR(40),
    `default` varchar(40),
    balance varchar(40),
    housing varchar(50),
    loan varchar(40),
    contact varchar(40),
    `day` int,
	`month` varchar(40),
    duration int,
    compaign int ,
    pday int,
    privious int,
    poutcome varchar(49),
    y varchar(39)
);

# Now show the data table and column names
SELECT * FROM BANK_DETAILS;

# How to instert the data into the table one by one
INSERT INTO BANK_DETAILS VALUES
(
	23,"Management","marred","tirtinary","no",2143,
    "yes","no","unknown",5,"may",261,1,-1,0,"undknown","No"
);

# Now see the inserted data from the table:
SELECT * FROM BANK_DETAILS;

# Now insert the bulk amount of the data into this table
INSERT INTO BANK_DETAILS VALUES
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

# Now see the all data from the table
SELECT * FROM BANK_DETAILS;

# show the how many rocord are present in this tale
SELECT COUNT(*) AS TOTAL_RECORDS FROM BANK_DETAILS;   

# How to get or show only the particular column
SELECT EDUCATION FROM BANK_DETAILS;

-- How to get the prebuiled key name column data
SELECT `DAY` , `MONTH` FROM BANK_DETAILS;

# How to show only first 5 record from the table
SELECT * FROM BANK_DETAILS LIMIT 5;

-- 12 record
SELECT * FROM BANK_DETAILS LIMIT 12;

-- Only 24 record show for the specific column just like- job,day and age 
SELECT `DAY`,`MONTH`,AGE FROM BANK_DETAILS LIMIT 24;

# Can you find the details of the table where the age is 33 
SELECT * FROM BANK_DETAILS WHERE AGE=33;

# Can you show the record of the table that match the data where the age grator then 40.
SELECT * FROM BANK_DETAILS WHERE AGE>40;

# Can you show the details where the age is grator than 40 and balance is less than 100.
SELECT * FROM BANK_DETAILS WHERE AGE>40 AND BALANCE<100;

# Can you shwo the details where the married statues is "single" OR education is "unknown"
SELECT * FROM BANK_DETAILS WHERE MARITAL="SINGLE" OR EDUCATION ="UNKNOWN";

# Can you show the record that make sure it contian the marital status is "single" or education is unknow and balance Should be grator than 500
SELECT * FROM BANK_DETAILS WHERE (MARITAL="SINGLE" OR EDUCATION ="UNKNOWN")  AND BALANCE >500;

#Can you find the how many job type are present in the bank_details table
SELECT DISTINCT JOB FROM BANK_DETAILS;

# Behalf of age arragne the data from the bank_details table
SELECT * FROM BANK_DETAILS ORDER BY AGE ASC;
SELECT * FROM BANK_DETAILS ORDER BY AGE DESC;

# With the table can you give me the total balance and average balance
SELECT SUM(BALANCE) AS TOTAL_BALANCE, AVG(BALANCE) AS AVERAGE_BALANCE FROM BANK_DETAILS;

# Can you find out this entire date of the who have minimum balance
SELECT * FROM BANK_DETAILS WHERE BALANCE=(SELECT MIN(BALANCE) FROM BANK_DETAILS);

# Same as finding the maximum balance give that person data
SELECT * FROM BANK_DETAILS WHERE BALANCE=(SELECT MAX(BALANCE) FROM BANK_DETAILS);

# Try to prepare the data who having loan 
SELECT * FROM BANK_DETAILS WHERE LOAN="YES";

-- Now find the total loan persong who having loan
SELECT COUNT(LOAN) AS TOTAL_LOAN_PERSON FROM BANK_DETAILS WHERE LOAN="YES";

# find out the average banalce for all people having the job role is admin.
SELECT AVG(BALANCE) AS AVERAGE_BALANCE FROM BANK_DETAILS WHERE JOB ="ADMIN";

# Try to find those person who have not job and age Should be grator than 45
 -- frist i check which which categories jobs are available
 SELECT DISTINCT JOB FROM BANK_DETAILS;
-- Now find - without job means retired or unknown 
SELECT * FROM BANK_DETAILS WHERE (JOB="RETIRED" OR JOB="RETIRED") AND AGE >45;

#Try to find out the those record of data that the person have not job along with their balance
SELECT * FROM BANK_DETAILS WHERE JOB="UNKNOWN" ORDER BY BALANCE DESC;

-- How to automate the task 
	-- mean write one singl query and run when i need.
# called stored Procedure

# How to writes its query
DELIMITER &&
CREATE PROCEDURE SHOW_RECORD()
BEGIN
	SELECT * FROM BANK_DETAILS;
END &&
DELIMITER ;

-- Now call the procedure
CALL SHOW_RECORD();

# Now create some sort of the another example
DELIMITER &&
CREATE PROCEDURE AGE_33()
BEGIN 
	SELECT * FROM BANK_DETAILS WHERE AGE>33;
END &&
DELIMITER ;
-- call the procedure
CALL AGE_33();

#-- Now try to find out average balance from the bank details whose job is admin
	-- whose job is management 
    -- whose job is technician 
    -- whose job is enterpreneur
    -- whose job is blue-collor
  -- so i can write the query one by one of each of the statement but here use the procedure call Parameterized Procedure
  
DELIMITER &&
CREATE PROCEDURE AVG_BAL_JOB_ROLE(IN VAR VARCHAR(30))
BEGIN 
	SELECT AVG(BALANCE) AS AVERAGE_BALANCE FROM BANK_DETAILS where JOB=VAR;
END &&
DELIMITER ;

CALL AVG_BAL_JOB_ROLE("MANAGEMENT");
CALL AVG_BAL_JOB_ROLE("TECHNICIAN");
CALL AVG_BAL_JOB_ROLE("ENTERPRENEUR");
CALL AVG_BAL_JOB_ROLE("BLUE-COLLOR");

# Now again i create the another procedure that include  the jobs and education
DELIMITER &&
CREATE PROCEDURE SUM_BAL_JOB_AND_EDU(IN VAR1 VARCHAR(40),IN VAR2 VARCHAR(30))
BEGIN 
	SELECT SUM(BALANCE) FROM BANK_DETAILS WHERE JOB=VAR1 AND EDUCATION =VAR2;
END &&
DELIMITER ;

# Call the procedure
CALL SUM_BAL_JOB_AND_EDU("'entrepreneur",'secondary');

# Now create anothe of the procedure that makes the addition of the two column and get the total balance 
DELIMITER &&
CREATE PROCEDURE ADDITION(IN VAR1 INT, IN VAR2 INT)
BEGIN 
	SELECT VAR1+VAR2;
END &&
DELIMITER ;

CALL ADDITION(5,6);


## Now working with the views
-- view is nothing but it is also a table that contain the subset of the main table

-- Creating the view on the bank_details main table
CREATE VIEW BANK_VIEW AS SELECT AGE,JOB,EDUCATION,BALANCE,LOAN FROM BANK_DETAILS; 

-- Now check the views table
SELECT * FROM BANK_VIEW;

-- Now of thing that is perform to main table are also applicable to the view table
 -- - ------------------------------------------------------------- DONE----------------------------------------------------------
 
# Now create the new Database
CREATE DATABASE IF NOT EXISTS DRESS_DATA;

# Now use to this database perform some sort of the operation
USE DRESS_DATA;

# Create new table that name is Dress
CREATE TABLE IF NOT EXISTS DRESS
(
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
	`Pattern Type` varchar(30),
	Recommendation varchar(30)
);

-- Now see the table structure 
SELECT * FROM DRESS;
-- Now i create the procedure to now again again write the code to show all the data
DELIMITER &&
CREATE PROCEDURE SHOW_DATA()
BEGIN 
	SELECT * FROM DRESS;
END &&
DELIMITER ;

CALL SHOW_DATA;

-- Now load the data into the bulk amount at once
load data infile "D:/data analytics/Learning/End-to-End-Data-Analysis-Projects/SQL/Practice/Day_03/Attribute DataSet.csv"
into table Dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

# Data have been Inserted sucessfully
	-- Now check the table structure
CALL SHOW_DATA();

# See the total record of the data 
SELECT COUNT(*) AS TOTAL_RECORD FROM DRESS;

-- ------------------------------------------------------ Done--------------------------------------------------

-- Now perform the Constraints 
# 1 Auto Increment
CREATE TABLE IF NOT EXISTS TEST1
(
	TEST_ID INT AUTO_INCREMENT,
    TEST_NAME VARCHAR(40),
    TEST_MAIL VARCHAR(40),
    TEST_ADDRESS VARCHAR(40)
); 
-- This table is not created because i am not assign to the test_id as primary key 

# so i create the new table that makes the test_id are primary key as well as auto_increment
CREATE TABLE IF NOT EXISTS TEST2
(
	TEST_ID INT AUTO_INCREMENT PRIMARY KEY,
    TEST_NAME VARCHAR(49),
    TEST_MAIL VARCHAR(39),
    TEST_ADDRESS VARCHAR(40)
);

-- Now insert some sort of the data into this table
INSERT INTO TEST2 VALUES
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH"),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI"),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR");

-- Now see the data
SELECT * FROM TEST2;

-- Now i insert the data into same table without giving its test_id
INSERT INTO TEST2 (TEST_NAME,TEST_MAIL,TEST_ADDRESS) VALUES
("SONU","SONU@GMAIL.COM","SONPUR");

-- See the data
SELECT * FROM TEST2;

-- Now i fill the test_id as 1000 the what is its next
INSERT INTO TEST2 VALUES
(1000,"SUBO","SUBODHKUMARY3@GMAIL.COM","SANRTH");

-- Next i not add to the test_id values
INSERT INTO TEST2 (TEST_NAME,TEST_MAIL,TEST_ADDRESS) VALUES
("SONUji","SONNNU@GMAIL.COM","SkNPUR");

-- Now see the table
SELECT * FROM TEST2;

-- --------------------------------------- AUTO INCREMENT WAS DONE ----------------------------------------------------------

# Now focus into the CHECK constraint

# create new table
CREATE TABLE IF NOT EXISTS TEST3
( 
	TEST_ID INT PRIMARY KEY,
    TEST_NAME VARCHAR(30),
    TEST_MAIL VARCHAR(30),
    TEST_ADDRESS VARCHAR(30),
    TEST_SALARY INT CHECK(TEST_SALARY>15000)
);

-- Fill some sort of the data
INSERT INTO TEST3 VALUES
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",10000); -- Here less than 15000
    
-- This value is not inserted So fill the actureal or correct data 
INSERT INTO TEST3 VALUES
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",30000);
-- See the table structure
SELECT * FROM TEST3;

-- if i miss the adding constraint on the creating talbe then add to the like
ALTER TABLE TEST3 ADD CHECK(TEST_ID >0);

-- If i insert the negative test_id it will not take
INSERT INTO TEST3 VALUES (-3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",30000); -- It say it violated

-- so correct values of test give the 
INSERT INTO TEST3 VALUES(3000,"MOHU","MOHU@GMAIL.COM","MOHUNATHPUR",33330);

-- Now focus into the Not Null
-- Mean the column not be Null

CREATE TABLE IF NOT EXISTS TEST4
(	
	TEST_ID INT NOT NULL,
    TEST_NAME VARCHAR(40),
    TEST_MAIL VARCHAR(39),
    TEST_ADDRESS VARCHAR(40),
    TEST_SALARY INT CHECK(TEST_SALARY>30000)
);

-- Now see the table structure
SELECT * FROM TEST4;
-- Now fill some sort of the data into this tablee

INSERT INTO TEST4 VALUES 
(1,"SUBODH","SUBODH@GMAIL.COM","SANKORTH",100000),
(4,"SURAJ","SURAJ@GMAIL.COM","SURAJPUR",500000);

-- Check if it is inserted of not
INSERT INTO TEST4 VALUES (NULL,"SURAJ","SURAJ@GMAIL.COM","SURAJPUR",500000); -- NOT WORKING-- TEST_ID CAN'T BE NULL

-- ---------------------------- NOT NULL DONE --------------------------------

# Now start the DEFAULT 
-- Default means fixed values

CREATE TABLE IF NOT EXISTS TEST5
(
	TEST_ID INT NOT NULL DEFAULT 4,
    TEST_NAME VARCHAR(40),
    TEST_MAIL VARCHAR(40),
    TEST_ADDRESS VARCHAR(40),
    TEST_SALARY INT CHECK(TEST_SALARY>15000)
);

-- See the table structure
SELECT * FROM TEST5;
-- Now fill the data 

INSERT INTO TEST5 VALUES 
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",18050);

-- Now insert to the 
INSERT INTO TEST5 (TEST_NAME,TEST_MAIL,TEST_ADDRESS,TEST_SALARY) VALUES
("SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
("ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
("MOHIT","MOHIT@GMAIL.COM","MOHANPUR",18050);

-- See the table data
SELECT * FROM TEST5;

-- Now working next to the unique
# UNIQUE -- means it shall not be repeate or not exist anly of the record only at one time

CREATE TABLE IF NOT EXISTS TEST6
(
	TEST_ID INT NOT NULL DEFAULT 10,
    TEST_NAME VARCHAR(30),
    TEST_MAIL VARCHAR(30) UNIQUE,
    TEST_ADDRESS VARCHAR(40),
    TEST_SALARY INT CHECK(TEST_SALARY >10000)
);

-- See the table structue
SELECT * FROM TEST6;

-- Now fill the data into the Test6 table
INSERT INTO TEST6 VALUES 
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",18050);

-- Fill another data that are same as above
INSERT INTO TEST6 VALUES 
(1,"SUBODH","SUBODHKUMARY933@GMAIL.COM","SANKORTH",18000),
(2,"ROSHAN","ROUSHAN33@GMAIL.COM","MADHUBANI",20000),
(3,"MOHIT","MOHIT@GMAIL.COM","MOHANPUR",18050); -- It say duplicate entry

-- Now sumrized all the constraints into a single table
CREATE TABLE IF NOT EXISTS TEST7 
(
	TEST_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TEST_NAME VARCHAR(30),
    TEST_AGE INT CHECK(TEST_AGE >=18),
    TEST_MAIL VARCHAR (40) UNIQUE,
    TEST_SEC CHAR DEFAULT 'C'
);

-- See the table structure
SELECT * FROM TEST7;

-- Now i insert the data into this table
INSERT INTO TEST7 VALUES
(42,"SUBODH",23,"SUBODHKUMARY933@GMAIL.COM","D");

-- Now insert another data
INSERT INTO TEST7 (TEST_NAME,TEST_AGE,TEST_MAIL) VALUES
("SUBODH",22,"SUBKUMARY933@GMAIL.COM");

-- See the table data
SELECT * FROM TEST7;

# Now create another DATABASE
CREATE DATABASE IF NOT EXISTS SALES;

-- Now use to this database perform some  sort of the operation
USE SALES;

-- Now create table 
CREATE TABLE IF NOT EXISTS SALES
(
	order_id VARCHAR(15) NOT NULL, 
	order_date varchar(30) NOT NULL, 
	ship_date varchar(30) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

-- Now see the table structure
SELECT * FROM SALES;

LOAD DATA INFILE "D:/sales_data_final.csv"
INTO TABLE SALES
fIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- The data will be inserted to the sales table total data is 50k +

-- Now perform some sort of the operation into same data table alter

# the order_date column data type is varchar so convert into date
SELECT STR_TO_DATE(REPLACE(ORDER_DATE,'-','/'),'%d/%m/%y')  AS FINAL_DATE FROM SALES;

-- Now add the table that contain the date wise data type of the Order_date column

ALTER TABLE SALES ADD COLUMN ORDER_DATE_NEW DATE AFTER ORDER_DATE;

-- Now fill the data into the new column 
UPDATE SALES SET ORDER_DATE_NEW=STR_TO_DATE(REPLACE(ORDER_DATE,'-','/'),'%d/%m/%y');

-- ANOTHER TABLE ALSO WILL BE MODIFIED TO STR TO DATE
ALTER TABLE SALES ADD COLUMN SHIP_DATE_NEW DATE AFTER SHIP_DATE;

-- Now fill the data into same table
UPDATE SALES SET SHIP_DATE_NEW =STR_TO_DATE(REPLACE(SHIP_DATE,'-','/'),'%d/%m/%y');


-- Now see the table structure
SELECT * FROM SALES;
-- Now delete the privious old column 

ALTER TABLE SALES
DROP COLUMN ORDER_DATE;

ALTER TABLE SALES DROP COLUMN SHIP_DATE;

-- NOW SEE THE TABLE STRUCTURE;
SELECT * FROM SALES;

-- Fetch the Record of the sales table that ship_date is 2020-1-05
SELECT * FROM SALES WHERE SHIP_DATE_NEW ='2020-01-05';

-- Fetch the record of the table that after the date 2020-01-05
SELECT * FROM SALES WHERE ORDER_DATE_NEW ='2020-01-05';

#Fetch  the record where the ship_date is before the '2020-01-05'
SELECT * FROM SALES WHERE SHIP_DATE_NEW <='2020-01-05';

# Fetch the where the ship date between '2011-05-01' AND '2011-08-30'1 under the 2000 row
SELECT * FROM sales WHERE ship_date_new BETWEEN '2011-05-01' AND '2011-08-30'
LIMIT 0, 2000;


-- Now working on the current date 
# How to check the current time 
SELECT NOW();

#How to get current time only
SELECT CURTIME() AS CURRENT_TIMES;
SELECT CURRENT_TIME() AS CURRENT_TIMEE;

# How to get current date only
SELECT CURdATE() AS CURRENT_DATES;

#How to find out the current timestamp
SELECT current_timestamp() AS CURRENT_TIME_STAMP;

# How to get the name of the user that is login to the mysql workbanck
SELECT CURRENT_USER() AS CURRETN_USER;

# Get the date and time from 1 weak ago from now
SELECT DATE_SUB(NOW(),INTERVAL 1 WEEK) AS 1_WEEK_BEFORE;

# Gate teh data and time 3 day age from now
SELECT DATE_SUB(NOW(), INTERVAL 3 DAY) AS 3_DAY_BEFORE;

# Gat the date and time 100 day before or age from no
SELECT DATE_SUB(NOW(), INTERVAL 100 DAY) AS 100_DAY_BEFORE;

#Get the date and time 2 months ago from now
SELECT DATE_SUB(NOW(), INTERVAL 2 MONTH) AS 2_MONTHS_BEFORE_DATE;

#Get the date and time 11 monts ago from now
SELECT DATE_SUB(NOW(), INTERVAL 11 MONTH) AS 11_MONTH_BEFORE;

# Get the date and time before 1 year ago from now
SELECT DATE_SUB(NOW(),INTERVAL 1 YEAR) AS 1_YEAR_BEFORE;

#Get the date and time after the 3 days
SELECT DATE_ADD(NOW(),INTERVAL 3 DAY) AS AFTER_3_DAY;

# Get the exact date and time of after 4months 
SELECT DATE_ADD(NOW(),INTERVAL 4 MONTH) AS AFTER_4_MONTHS;

# Get the exact date and time of after 4 year 
SELECT DATE_ADD(NOW(), INTERVAL 4 YEAR ) AS AFTER_4_YEAR;

# Can you fetch the year of current time
SELECT YEAR(NOW());

# Can you fetch the month of current time
SELECT MONTH(NOW()) AS CURRENT_MONTH;

-- CURRENT_TIME
SELECT TIME(NOW());

-- Current dayname
SELECT DAYNAME(NOW()) AS DAYNAME;

# What is the day name of the given date
SELECT DAYNAME('2003-03-15 15:29:04') AS PAST_DATE;

#What is the day name of the future date
SELECT DAYNAME('2033-03-15 15:29:04') AS FUTURE_DATE;

#Fetch the record where the ship date is older than 1 WEKK currentdate
SELECT * FROM SALES WHERE SHIP_DATE_NEW < date_sub(NOW(),INTERVAL 1 WEEK) ;

# Count the record where the ship date is older than 1 week
SELECT COUNT(*) AS 1_WEEK_OLDER_SHIP FROM SALES WHERE SHIP_DATE_NEW < DATE_SUB(NOW(),INTERVAL 1 WEEK) ;

# Add new column
ALTER TABLE SALES ADD COLUMN FLAG DATE AFTER ORDER_ID;

-- SEE THE TABLE STRUCTURE;
SELECT * FROM SALES;

UPDATE SALES SET FLAG=NOW();

UPDATE SALES SET FLAG=current_date();
-- See the data

SELECT * FROM SALES;

-- MODIFY COLUMN YEAR TO YEAR
ALTER TABLE SALES MODIFY COLUMN year YEAR;

UPDATE SALES SET YEAR=YEAR(ORDER_DATE_NEW);

SELECT * FROM SALES;

-- ADD THE 3 COLUMN LIKE YEAR_NEW,MONTH_NEW,DATE_NEW
ALTER TABLE SALES ADD COLUMN YEAR_NEW INT;

ALTER TABLE SALES ADD COLUMN MONTH_NEW INT;

ALTER TABLE SALES ADD COLUMN DAY_NEW INT;

-- Now see the table sturcture
SELECT * FROM SALES;

-- Now fill the data into update column
UPDATE SALES SET YEAR_NEW=YEAR(ORDER_DATE_NEW);
UPDATE SALES SET MONTH_NEW=MONTH(ORDER_DATE_NEW);
UPDATE SALES SET DAY_NEW=DAY(ORDER_DATE_NEW);


-- Now see the table structure
SELECT * FROM SALES;

# What is the average sale in the year 2011
SELECT AVG(SALES) FROM SALES WHERE YEAR_NEW=2011;

# Can you show the record of occuring average wise sale in the each year
SELECT YEAR_NEW , AVG(SALES) AS AVERAGE_SALES FROM SALES GROUP BY YEAR_NEW;

#Can you show the record of occuring total wise sale in the each year
SELECT YEAR_NEW,SUM(SALES) AS TOTAL_SALES FROM SALES GROUP BY YEAR_NEW;

# Can you the record of average sale queanty in each year
SELECT YEAR_NEW, AVG(QUANTITY) AS AVERAGE_QUANTITY FROM SALES GROUP BY YEAR_NEW;

# Can you show the maximum sale queanty in each year
SELECT YEAR_NEW, MAX(QUANTITY) AS MAXIMUM_SALE_QUANTITY FROM SALES GROUP BY YEAR_NEW;

#COMPNAY CTC
SELECT SUM( DISCOUNT + SHIPPING_COST) AS CTC FROM SALES;

-- All compnay give the discount by the format of the % and shipping cost is numberic so dont add directly
SELECT SUM(SALES*DISCOUNT + SHIPPING_COST) AS CTC FROM SALES;

-- Can you show if discount>0 then yes other wise no
SELECT ORDER_ID,IF(DISCOUNT>0,"YES","NO") AS FLAG FROM SALES;

-- Add one column
ALTER TABLE SALES ADD COLUMN FLAG_DISCOUNT VARCHAR(40) ;

UPDATE SALES SET FLAG_DISCOUNT=IF(DISCOUNT>0,"YES","NO") ;

-- See the table structure
SELECT * FROM SALES ;

SELECT FLAG_DISCOUNT ,COUNT(*) AS TOTAL_DISCOUNT FROM SALES GROUP BY FLAG_DISCOUNT ORDER BY TOTAL_DISCOUNT ASC;

# Find who have  get discount
SELECT DISCOUNT,COUNT(*) FROM SALES WHERE DISCOUNT>0;



-- Now working as another dataset or database
CREATE DATABASE IF NOT EXISTS ONLINE_RETAILS;

-- Now use to this database perform some sort of operation
USE ONLINE_RETAILS;

-- Create table on same database
CREATE TABLE IF NOT EXISTS `online-retail`
(
	`InvoiceNo` VARCHAR(7) NOT NULL, 
	`StockCode` VARCHAR(12) NOT NULL, 
	`Description` VARCHAR(35), 
	`Quantity` DECIMAL(38, 0) NOT NULL, 
	`InvoiceDate` TIMESTAMP NULL, 
	`UnitPrice` DECIMAL(38, 3) NOT NULL, 
	`CustomerID` DECIMAL(38, 0), 
	`Country` VARCHAR(20) NOT NULL
);

-- Now see the table structure
SELECT * FROM `online-retail`;

-- Now load the all amount of the data into same table
LOAD DATA INFILE "D:/online-retail-dataset.csv"
INTO TABLE `online-retail`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- the tabel was not created so use to the varchar to insert 
ALTER TABLE `ONLINE-RETAIL`
MODIFY COLUMN INVOICEDATE VARCHAR (30);

-- Now LOAD THE DATA
LOAD DATA INFILE "D:/online-retail-dataset.csv"
INTO TABLE `online-retail`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- The problem was occured as the customer id at roww no 623 so also change its datatypes
ALTER TABLE `ONLINE-RETAIL` 
MODIFY COLUMN CUSTOMERID VARCHAR (30);

-- Now insert the data
LOAD DATA INFILE "D:/online-retail-dataset.csv"
INTO TABLE `online-retail`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Finally loaded the data
-- now see the data
SELECT * FROM `ONLINE-RETAIL`;

-- Check how muchh data was inserted
SELECT COUNT(*) AS TOTAL_DATA FROM `ONLINE-RETAIL`;

-- Data was successfully inserted now change its datatype that was not fitted
ALTER TABLE `ONLINE-RETAIL` 
ADD COLUMN INVOIDE_DATE_NEW DATE AFTER INVOICEDATE;

-- See the table structure;
SELECT * FROM `ONLINE-RETAIL`;

ALTER TABLE `ONLINE-RETAIL` MODIFY COLUMN INVOIDE_DATE_NEW DATETIME;

UPDATE `online-retail`
SET INVOIDE_DATE_NEW = STR_TO_DATE(REPLACE(InvoiceDate, '-', '/'), '%m/%d/%Y %H:%i');

SET SQL_SAFE_UPDATES=0;

SELECT * FROM `ONLINE-RETAIL`;

-- Rename the column name
ALTER TABLE `ONLINE-RETAIL` 
RENAME COLUMN INVOIDE_DATE_NEW TO INVOICE_DATE_NEW;

# Find the total number of record in this table
SELECT COUNT(*) FROM `ONLINE-RETAIL` ;

-- Show how many column are present in this table
SHOW COLUMNS FROM `ONLINE-RETAIL`;

-- Show 5 record in the table
SELECT * FROM `ONLINE-RETAIL` LIMIT 5;

-- Can you show the last 5 record of the table
SELECT * FROM `ONLINE-REATIL` LIMIT 5 OFFSET 541904;

SELECT * FROM `online-retail` 
LIMIT 5 OFFSET 541904;

-- can you show the only 2 record after the 3lak 
SELECT * FROM `ONLINE-RETAIL` LIMIT 2 OFFSET 300000;

-- Find any 5 record from the table
SELECT * FROM `ONLINE-RETAIL` ORDER BY RAND() LIMIT 5;

-- Can yo show info of the table
DESCRIBE `ONLINE-RETAIL`;

-- Can you show How many contary are availble into this table and how many record are present
SELECT DISTINCT COUNTRY , COUNT(COUNTRY) AS TOTAL_TOTAL_COUNTRY FROM `ONLINE-RETAIL` GROUP BY COUN ORDER BY COUNT(COUNTRY) ASC;

-- See the table structure
SELECT * FROM `ONLINE-RETAIL`;

-- Now this is finish ------------------------------------------------------------
-- function

-- use to the sales database
USE SALES;

-- Show the data table
SELECT * FROM SALES;

-- Perform the function
-- Create the addition function
DELIMITER &&
CREATE FUNCTION ADDITION( VAR1 DECIMAL(10,2),VAR2 DECIMAL(10,2))
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN 
	DECLARE RESULT DECIMAL (10,2);
    SET RESULT=VAR1+VAR2;
	RETURN RESULT;
END &&
DELIMITER ;

-- Now call the function
SELECT SALES,QUANTITY ,ADDITION(SALES,QUANTITY) FROM SALES;






-- Now create the subtraction function
DELIMITER &&
CREATE FUNCTION SUBTRACTION(VAR1 DECIMAL(10,2),VAR2 DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE RESULT DECIMAL(10,2);
    SET RESULT=VAR1-VAR2;
    RETURN RESULT;
END &&
DELIMITER ;

-- Call the function
SELECT SALES,QUANTITY,SUBTRACTION(SALES,QUANTITY) FROM `SALES`;

-- Create the multiply function
DELIMITER &&
CREATE FUNCTION MULTIPLY(VAR1 INT,VAR2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE RESULT INT;
    SET RESULT= VAR1 * VAR2;
    RETURN RESULT;
END &&
DELIMITER ;

-- Call the function
SELECT SALES,QUANTITY,MULTIPLY(SALES,QUANTITY) FROM SALES;

-- Create the division function
DELIMITER &&
CREATE FUNCTION DIVISION(VAR1 INT,VAR2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE RESULT INT;
    SET RESULT= VAR1 / VAR2;
    RETURN RESULT;
END &&
DELIMITER ;

-- Call the function
SELECT SALES,QUANTITY,DIVISION(SALES,QUANTITY) FROM SALES;

-- Create another function that take the 2 input and give the addition, subtraction, multiplication and division
DELIMITER &&
CREATE FUNCTION CALCULATOR(VAR1 INT, VAR2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE `ADD` INT,`SUB` INT,`MULT` INT,`DIV` INT;
    SET `ADD`=VAR1+VAR2;
    SET SUB=VAR1-VAR2;
    SET MULT=VAR1*VAR2;
    SET `DIV`=VAR1/VAR2;
    RETURN `ADD`,`SUB`,`MULT`,`DIV` ;
END &&
DELIMITER ;


-- The above function are not working because 
-- above are not work because A MySQL function can only return one single value,
	-- not multiple results at once, 
    -- and you have a syntax error in the word retun.
    -- so use to create the procedure
DELIMITER &&
CREATE PROCEDURE calculator(IN var1 INT, IN var2 INT)
BEGIN
    DECLARE val_add INT;
    DECLARE val_sub INT;
    DECLARE val_mult INT;
    DECLARE val_div FLOAT;

    SET val_add = var1 + var2;
    SET val_sub = var1 - var2;
    SET val_mult = var1 * var2;
    SET val_div = var1 / var2;
    
    SELECT val_add AS Addition, val_sub AS Subtraction, val_mult AS Multiplication, val_div AS Division;
END &&

DELIMITER ;

-- Now call the procedure
call calculator(10,12);
call calculator(100,100);
call calculator(2,3);

-- Now use to sales data perform the sales operation
USE SALES;

-- See the table structure
SELECT * FROM SALES;

-- Try to the final profit use this  profit and discout and used the function
DELIMITER &&
CREATE FUNCTION FINAL_PROFIT(PROFIT DECIMAL(10,2) ,DISCOUNT DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE RESULT DECIMAL (10,2);
    SET RESULT=PROFIT-DISCOUNT;
    RETURN RESULT;
END &&
DELIMITER ;

-- CALL THE FUNCTION
SELECT PROFIT,DISCOUNT ,FINAL_PROFIT(PROFIT,DISCOUNT) AS FINAL_DISCOUNT FROM SALES;

-- Try to create a function that take input as the interger and get as the string
DELIMITER &&
CREATE FUNCTION INT_STR(VAR INT)
RETURNS VARCHAR(10)
DETERMINISTIC 
BEGIN 
	DECLARE STR VARCHAR(10);
    SET STR=VAR;
    RETURN STR;
END &&
DELIMITER ;

-- Now call the function
SELECT QUANTITY , INT_STR(QUANTITY) AS INT_TO_STR FROM SALES;

SELECT INT_STR(1000);

-- Create the function that take the decimal and give as the input
DELIMITER &&
CREATE FUNCTION DECIMAL_TO_INT(A DECIMAL(10,2))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE B INT ;
    SET B=A;
    RETURN B;
END &&
DELIMITER ;

-- Cll the function
SELECT DECIMAL_TO_INT(103.24);

-- Create one function and inside its create when ever sales is less than 100 return maximum affordable
																	-- between 100 to 300 moderate
                                                                    -- 300 to 600 affordable
                                                                    -- grator than 600 expensive
																		
DELIMITER &&
CREATE FUNCTION MAR_SALES(SALES INT)
RETURNS VARCHAR(30)
DETERMINISTIC 
BEGIN
	DECLARE FLAG_SALES VARCHAR(34);
		IF SALES <100 THEN
			SET FLAG_SALES="maximum affordable";
		ELSEIF SALES >=100 AND SALES<300 THEN 
			SET FLAG_SALES="MODERATE";
		ELSEIF SALES >=300 AND SALES <600 THEN 
			SET FLAG_SALES ="AFFODATBLE";
		ELSE
			SET FLAG_SALES="EXPENSIVE";
	END IF;
	RETURN FLAG_SALES;
END &&
DELIMITER ;
-- Call the function
SELECT SALES ,MAR_SALES(SALES) FROM SALES;

-- Check another interger value
SELECT MAR_SALES(3000);

-- CHECK HOW MANY RECORD ARE 

-- Now add one another column that the fill all data  into the this column of the above function
ALTER TABLE SALES
ADD COLUMN MARK_SALES VARCHAR(30);

SELECT * FROM SALES; 
-- now fill the data from 
UPDATE SALES
SET MARK_SALES=MAR_SALES(SALES);

-- SEE THE DETAILS 
SELECT * FROM SALES;

-- Another problem 
	-- create one function and inside its if else condition
		-- check the how much fast shiping and how much earn company
			-- 1. if shipping more than 5 days and profit negative then show "operational disarter"
            -- 2. if shiping less than 2  daya and discount more than 04 or 40%  then show "High cost  speed"
            -- 3. if discount 0 , shiping less than 3 days  and profit  more than  200  then show the "Goldan order" 
            -- else standard process
Delimiter &&
create function check_fullfillment_quality(
	order_date date,
    ship_date date,
    profit decimal(10,2),
    discount decimal(10,2)
)
returns varchar(30)
Deterministic
begin
	declare ship_days int;
    declare status_flag varchar(40);
    
    SET ship_days = DATEDIFF(ship_date, order_date);
    
		if ship_days > 5 and profit <0 then
			set status_flag="Operational Disaster";
		elseif ship_days <2 and discount > 0.4 then 
			set status_flag="High cost speed";
		elseif discount=0 and ship_days<3 and profit >200 then 
			set status_flag="Golden Order";
		else
			set status_flag="Standard process";
	end if;
    return status_flag;
    
end &&
delimiter ;

-- now call the function
select check_fullfillment_quality(
	order_date_new,
    ship_date_new,
    profit,
    discount
) as check_fullfillment_quality FROM SALES;



-- Now working to the differnt data table
-- Create a table and inside its two column
	-- create a loop to insert the data into both column
    -- second column insert the square of the first column data
USE SALES;

-- Now see the all of talbe present into the sales table
SHOW TABLES;

-- Now create the another table 
CREATE TABLE TASK(NUMBER INT,SQUARE INT);

-- Now use to this i can create the procedure to fullfillment of our problem
DELIMITER &&
CREATE PROCEDURE FILL_RECORD()
BEGIN 
	SET @VAR=1;
    GENERATE_DATA:LOOP
		INSERT INTO TASK(NUMBER,SQUARE) VALUES(@VAR,@VAR*@VAR);
			SET @VAR=@VAR+1;
            IF @VAR=101 THEN
				LEAVE GENERATE_DATA;
			END IF;
		END LOOP GENERATE_DATA;
END &&
DELIMITER ;

-- See the table structure
SELECT * FROM TASK;

-- Now call the procedure
CALL FILL_RECORD;
-- See the table structure
SELECT * FROM TASK;


-- Now focus into the loops 
CREATE TABLE LOOP_TABLE(VAL INT)
DELIMITER &&
CREATE PROCEDURE INSERT_DATA()
BEGIN
	SET @VAR=10;
    GENERATE_DATA:LOOP
		INSERT INTO LOOP_TABLE VALUES(@VAR);
        SET @VAR=@VAR+1;
			IF @VAR=100 THEN 
				LEAVE GENERATE_DATA;
			END IF;
	END LOOP GENERATE_DATA;
END &&
DELIMITER ;

DROP PROCEDURE INSERT_DATA;

-- Now focus into the loop 
CREATE TABLE IF NOT EXISTS LOOP_TABLE(VAL INT);

DELIMITER &&
CREATE PROCEDURE INSERT_DATA()
BEGIN
SET @VAR=10;
GENERATE_DATA : LOOP
INSERT INTO LOOP_TABLE VALUES (@VAR);
	SET @VAR=@VAR+1;
		IF @VAR=100 THEN
			LEAVE GENERATE_DATA;
		END IF;
	END LOOP GENERATE_DATA;
END &&
DELIMITER ;

-- Now see the loop_table;
SELECT * FROM LOOP_TABLE; -- There are no any value
-- Now call the procedure
CALL INSERT_DATA();

-- Now see the fill or not into the table
SELECT * FROM LOOP_TABLE;


-- Create a table and used to  loop and inside it pest into the 1 to 100 even number

CREATE TABLE IF NOT EXISTS EVEN_NUMBER(VAR INT);

DELIMITER &&
CREATE PROCEDURE EVEN_FILL()
BEGIN 
	SET @VAR=1;
    GENERATE_DATA : LOOP
    IF @VAR%2=0 THEN 
		INSERT INTO EVEN_NUMBER VALUES (@VAR);
    END IF;
    SET @VAR=@VAR+1;
		IF @VAR=101 THEN
			LEAVE GENERATE_DATA;
        END IF;
	END LOOP GENERATE_DATA;
END &&
DELIMITER ;

-- First see the table , is it empty or not
SELECT * FROM EVEN_NUMBER;

-- Now call the procedure
CALL EVEN_FILL();

-- Now see the table
SELECT * FROM EVEN_NUMBER;
    USE SALES;
    
# Try to create a table that take the two column and inside these column there are taking the first column number and other was its square 
CREATE TABLE IF NOT EXISTS NUM_SQUARE(NUMBER INT,SQUARE INT);

DELIMITER &&
CREATE PROCEDURE FILL_NUM_SQ()
BEGIN
	SET @VAR=1;
    GENERATE_DATA : LOOP
		INSERT INTO NUM_SQUARE VALUES(@VAR,@VAR*@VAR);
    SET @VAR=@VAR+1;
    IF @VAR=100 THEN 
		LEAVE GENERATE_DATA;
	END IF;
	END LOOP GENERATE_DATA;
END &&
DELIMITER ;

-- Now call the DATA table to see the empty table
SELECT * FROM NUM_SQUARE;

-- Call the procedure
CALL FILL_NUM_SQ();

-- After filling data see the table
SELECT * FROM NUM_SQUARE;

-- Create a user define function to find out the date difference in number of days
DELIMITER &&
CREATE FUNCTION DATE_DIFF_FIND(FIRST_DATE DATE, SECOND_DATE DATE)
RETURNS INT
DETERMINISTIC 
BEGIN 
	DECLARE RESULT INT;
    SET RESULT=to_days(FIRST_DATE)-TO_DAYS(SECOND_DATE);
    RETURN RESULT;
END &&
DELIMITER ;

select DATE_DIFF_FIND('2027-01-01','2026-05-01') as date_diff;

-- Now focus into the keys
# 1. Primary key
# 2. Secondary key

-- Now Working to the another database 
CREATE DATABASE IF NOT EXISTS INEURON;

-- Use to this database create multiple table and perform some sort of the operation
USE INEURON;

-- Now create table
CREATE TABLE IF NOT EXISTS INEURON
(
	COURSE_ID INT NOT NULL,
	COURSE_NAME VARCHAR(29),
    COURSE_STATUS VARCHAR(30),
    NUMBER_OF_ENRL INT,
    PRIMARY KEY (COURSE_ID)
);

-- Now insert data into this table
INSERT INTO INEURON VALUES (1,"FSDA","ACTIVE",1000);

INSERT INTO INEURON VALUES (1,"FSDS","NOT ACTIVE", 199);

INSERT INTO INEURON VALUES (2,"FSDA", "ACTIVE",2222);


CREATE TABLE IF NOT EXISTS STUDENT_INEURON
(
	STUDENT_ID INT,
    COURSE_NAME VARCHAR(30),
    STUDENT_MAIL VARCHAR(30),
    STUDENT_STATUS VARCHAR(40),
    COURSE_ID INT,
    FOREIGN KEY (COURSE_ID) REFERENCES INEURON(COURSE_ID)
);

-- Insert data into the student_ineuron table 
INSERT INTO STUDENT_INEURON VALUES(1,"fsda","TEST@GMAIL.COM","ACTIVE",1);
INSERT INTO STUDENT_INEURON VALUES (2,"FSDS","TEST1@GMAIL.COM","NOT_ACTIVE",1);
INSERT INTO STUDENT_INEURON VALUES (2,"FSDS","TEST1@GMAIL.COM","NOT_ACTIVE",3);



-- See the table
SELECT * FROM INEURON;
-- The mid one is not insert because it provide the same of the course_id;

-- CREATE ANOTHER TABLE
CREATE TABLE IF NOT EXISTS PAYMENT
(
	COURSE_NAME VARCHAR(20),
    COURSE_ID INT,
    COURSE_LIVE_STATUS VARCHAR(20),
    COURSE_LAUNCH_DATE VARCHAR (30),
    FOREIGN KEY (COURSE_ID) REFERENCES INEURON(COURSE_ID)
);

INSERT INTO PAYMENT VALUES("FSDA",1,"ACTIVE", "07 AUG");
INSERT INTO PAYMENT VALUES("FSDS",2,"NOT_ACTIVE","4 AUG");
INSERT INTO PAYMENT VALUES("FSDS",1,"NOT_ACTIVE","4 AUG");

-- See the table sturectre 
SELECT * FROM PAYMENT;

-- now create the class table
CREATE TABLE IF NOT EXISTS CLASS 
(
	COURSE_ID INT, 
    CLASS_NAME VARCHAR(30),
    CLASS_TOPIC VARCHAR(30),
    CLASS_DURATION INT,
    PRIMARY KEY (COURSE_ID) ,
    FOREIGN KEY (COURSE_ID) REFERENCES INEURON(COURSE_ID)
);

-- Now try to define two column as a primary key
ALTER TABLE INEURON  ADD CONSTRAINT  TEST_PRIM PRIMARY KEY (COURSE_ID, COURSE_NAME);
-- Multiple primary key not allow  -- test_prim is the alias of the primary key


-- Now drop the primary key into the ineuron table
ALTER TABLE INEURON DROP PRIMARY KEY; -- It not delete because it related to the another table with the foreign key

-- Now drop to the another table primary key
ALTER TABLE CLASS DROP PRIMARY KEY; -- it is also not deleted

-- now drop the class 
DROP TABLE INEURON;

-- DROP ANOTHER TABLE
DROP TABLE CLASS; -- Yes this table is deleted because this table is the child table

-- Now create another table 
CREATE TABLE IF NOT EXISTS TEST
(
	ID INT NOT NULL,
    NAME VARCHAR(30),
    MAIL_ID VARCHAR(30),
    MOBILE_NO VARCHAR (30),
    ADDRESS VARCHAR(60)
);
-- See the table
SELECT * FROM TEST;

-- Now add the primary key as the test table
ALTER TABLE TEST ADD CONSTRAINT PRIMARY KEY (ID);
-- This is the after creating table to add the primary key

-- now drop the primary key
ALTER TABLE TEST DROP  PRIMARY KEY;

-- Now add two column as a primary key as well
ALTER TABLE TEST ADD CONSTRAINT TEST_PRISM PRIMARY KEY(ID, MAIL_ID);
-- Now this will work 

-- # Now create another table 
CREATE TABLE IF NOT EXISTS PARENT
(
	ID INT NOT NULL,
    PRIMARY KEY (ID)
);

-- Now create another table
CREATE TABLE IF NOT EXISTS CHILD
(
	ID INT,
    PARENT_ID INT,
    FOREIGN KEY(PARENT_ID) REFERENCES PARENT(ID)
);

-- Now see the table structure
SELECT * FROM CHILD;

-- Now insert into both the child and parent table data
INSERT INTO PARENT VALUE(1);
INSERT INTO CHILD VALUES (1,1);

-- Show the table sturectre
SELECT * FROM CHILD;
SELECT * FROM PARENT;

-- Now insert the another values to the child column
INSERT INTO CHILD VALUE(2,2); -- it shows the error 

-- now delete some of the data
DELETE FROM PARENT WHERE ID=1; -- It is not deleted because its problem with the foreign key

-- now drop the child table
DROP TABLE IF EXISTS CHILD;

-- Now create the table that name is child and use to the casecade

CREATE TABLE IF NOT EXISTS CHILD 
(
	ID INT,
    PARENT_ID INT,
    FOREIGN KEY (PARENT_ID) REFERENCES PARENT(ID)
    ON DELETE CASCADE
);

-- Now insert some sorth of the data
INSERT INTO PARENT VALUES(2);
INSERT INTO CHILD VALUES (1,1),(1,2),(2,2),(3,2);

SELECT * FROM PARENT;
SELECT * FROM CHILD;

-- Now delete the parent table data
DELETE FROM PARENT WHERE ID=1;

-- Now i see the parent table
SELECT * FROM PARENT;
SELECT * FROM CHILD; -- This table automaticalyy delete the data where parent id is 1

-- now some of the updataion of the parent table
UPDATE PARENT SET ID=1 WHERE ID=2;
-- This is not allow to update the data
	-- but i am still update using the cascade
    
DROP TABLE CHILD;

-- Now again creating the table
CREATE TABLE IF NOT EXISTS CHILD
(
	ID INT,
    PARENT_ID INT,
    FOREIGN KEY(PARENT_ID) REFERENCES PARENT(ID)
    ON UPDATE CASCADE
);

-- Now insert the child table

insert into parent values(1);
insert into child values (1,1),(1,2),(2,2),(3,2);

-- Now update the parent table
UPDATE PARENT SET ID=30 WHERE ID=1;
-- Now this time full working 

-- now show the data
SELECT * FROM PARENT;
SELECT * FROM CHILD;

-- i can also use the delete as well as update into the same time as well
CREATE TABLE IF NOT EXISTS CHILD1
(
	ID INT,
    PARENT_ID INT,
    FOREIGN KEY(PARENT_ID) REFERENCES PARENT(ID)
    ON UPDATE CASCADE ON DELETE CASCADE 
);

INSERT INTO PARENT VALUE(1);
INSERT INTO CHILD1 VALUES (1,1),(1,2),(2,2),(3,2);

-- Now delete as well as update the table
UPDATE PARENT SET ID=111 WHERE ID =30;

-- Now see the table data
SELECT * FROM PARENT;
SELECT * FROM CHILD;

SELECT * FROM CHILD1;


-- Now working into the windoing function 
# windoing function - windoing function is nothing but it works on the subset of the dataset like first  it groups of the dataset and then perfom some sort of the operation on this particular group

-- there are two types of the windowing function 
	-- 1. Aggregated windowing function
	-- 2. analytical windowing function
    
-- 1. working on the aggregated 
-- So create one dataset
CREATE DATABASE IF NOT EXISTS WIN_FUN;

-- Now creating the data table that work on the window function
CREATE TABLE IF NOT EXISTS INEURON_STUDENT
(	
	STUDENT_ID INT,
    STUDENT_BATCH VARCHAR(40),
    STUDENT_NAME VARCHAR(40),
    STUDENT_STREAM VARCHAR(40),
    STUDENT_MARKS INT,
    STUDENT_MAIL_ID VARCHAR(40)
);

-- Now see the table structure
SELECT * FROM INEURON_STUDENT;

-- Now fill some sort of the data into the table

INSERT INTO INEURON_STUDENT(student_id, student_batch, student_name, student_stream, student_marks, student_mail_id)
VALUES 
(101, 'fsda', 'saurabh', 'cs', 80, 'saurabh@gmail.com'),
(100, 'fsda', 'saurabh', 'cs', 80, 'saurabh@gmail.com'),
(102, 'fsda', 'sanket', 'cs', 81, 'sanket@gmail.com'),
(103, 'fsda', 'shyam', 'cs', 80, 'shyam@gmail.com'),
(104, 'fsda', 'sanket', 'cs', 82, 'sanket@gmail.com'),
(105, 'fsda', 'shyam', 'ME', 67, 'shyam@gmail.com'),
(106, 'fsda', 'ajay', 'ME', 45, 'ajay@gmail.com'),
(106, 'fsds', 'ajay', 'ME', 78, 'ajay@gmail.com'),
(108, 'fsds', 'snehal', 'CI', 89, 'snehal@gmail.com'),
(109, 'fsds', 'manisha', 'CI', 34, 'manisha@gmail.com'),
(110, 'fsds', 'rakesh', 'CI', 45, 'rakesh@gmail.com'),
(111, 'fsde', 'anuj', 'CI', 43, 'anuj@gmail.com'),
(112, 'fsde', 'mohit', 'EE', 67, 'mohit@gmail.com'),
(113, 'fsde', 'vivek', 'EE', 23, 'vivek@gmail.com'),
(114, 'fsde', 'gaurav', 'EE', 45, 'gaurav@gmail.com'),
(115, 'fsde', 'prateek', 'EE', 89, 'prateek@gmail.com'),
(116, 'fsde', 'mithun', 'ECE', 23, 'mithun@gmail.com'),
(117, 'fsbc', 'chaitra', 'ECE', 23, 'chaitra@gmail.com'),
(118, 'fsbc', 'pranay', 'ECE', 45, 'pranay@gmail.com'),
(119, 'fsbc', 'sandeep', 'ECE', 65, 'sandeep@gmail.com');

-- Now see the data into the table
SELECT * FROM INEURON_STUDENT;

-- Give me the batch wise total number of students 
SELECT STUDENT_BATCH, COUNT(*) AS NUMBER_OF_STUDENT FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

-- Now perform some sort of the windowing function into the same data table
-- 1 first use the aggregation function

-- Can you give me the sum of the student marks from the particular student_batch group
SELECT STUDENT_BATCH , SUM(STUDENT_MARKS) AS TOTAL_MARKS FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

-- Can you give me the minimum marks form the particular student_batch group
SELECT STUDENT_BATCH ,MIN(STUDENT_MARKS) AS STUDENT_MIN_MARKS FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

-- Can you show the maximum marks form the particular student_batch group
SELECT STUDENT_BATCH, MAX(STUDENT_MARKS) AS STUDENT_MAX_MARKS FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

-- Can you show the average marks from the particular student_batch group
SELECT STUDENT_BATCH , AVG(STUDENT_MARKS) AS STUDENT_AVG_MARKS FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

-- Can you show the how many particular stream are availble into the ineuron_student table
SELECT STUDENT_STREAM, COUNT(STUDENT_BATCH)  AS NUMBER_OF_STREAM FROM INEURON_STUDENT GROUP BY STUDENT_STREAM;

-- Can you try to find out the minimum marks score in the particular stream
SELECT STUDENT_STREAM , MIN(STUDENT_MARKS) AS MINIMUM_STUDENT_MARKS FROM INEURON_STUDENT GROUP BY STUDENT_STREAM;

-- Same as find out the maximum marks score in the particular stream
SELECT STUDENT_STREAM ,MAX(STUDENT_MARKS) AS MAXIMUM_MARKS_OBTAIN FROM INEURON_STUDENT GROUP BY STUDENT_STREAM;

-- Try to find out the average marks obtain into the each stream 
SELECT STUDENT_STREAM , AVG(STUDENT_MARKS) AS AVERAGE_MARKS_OBTAIN FROM INEURON_STUDENT GROUP BY STUDENT_STREAM;

-- Now see the table structure
SELECT * FROM INEURON_STUDENT;

-- can you show the who is obtain the highest marks into the fsda batch
SELECT * FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" AND STUDENT_MARKS=(SELECT MAX(STUDENT_MARKS) FROM INEURON_STUDENT);

SELECT STUDENT_BATCH, MAX(STUDENT_MARKS) FROM INEURON_STUDENT GROUP BY STUDENT_BATCH;

# OR
SELECT * FROM INEURON_STUDENT WHERE STUDENT_MARKS=(SELECT MAX(STUDENT_MARKS) FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA");

-- Who is receive the 2nd highest marks in the fsda batch
SELECT * FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS  DESC LIMIT 1,1;

-- Now veryfy its give the correct output or not
SELECT STUDENT_BATCH, STUDENT_MARKS FROM INEURON_STUDENT WHERE STUDENT_BATCH= "FSDA" ORDER BY STUDENT_MARKS DESC;

SELECT STUDENT_NAME, STUDENT_MARKS FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS DESC LIMIT 1 OFFSET 1;

-- Show the student_name and student_marks of the fsda batch
SELECT STUDENT_NAME,STUDENT_MARKS,STUDENT_BATCH FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS DESC;

-- Try to show me who is getting the highest 5th postion marks into the fsda batch
SELECT STUDENT_NAME,STUDENT_MARKS, STUDENT_BATCH FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS DESC LIMIT 1 OFFSET 4;

-- OR
SELECT STUDENT_NAME,STUDENT_MARKS, STUDENT_BATCH FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS DESC LIMIT 4,1;

-- in privious we use the bydefault approaches now use to the analytical window functin ans using to the rank as well as another another function to get the data

-- If i have 3rd position there are 3 same highest marks then how to show the these 3 or 3rd highst obtain student name and its details 
-- use simple method 
SELECT STUDENT_NAME,STUDENT_MARKS,STUDENT_BATCH FROM INEURON_STUDENT WHERE STUDENT_BATCH="FSDA" ORDER BY STUDENT_MARKS DESC LIMIT 2,3;

-- But in this time i know the how much same marks avl at the 3rd position that i print alter

-- so find the above proble solution use the analytical window function

-- First i see the tablee structure
SELECT * FROM INEURON_STUDENT;

-- Try to go thorough the knowing the row_number
SELECT STUDENT_ID,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,
ROW_NUMBER() OVER(ORDER BY STUDENT_MARKS) AS 'ROW_NUMBER' FROM INEURON_STUDENT;

-- Now partitaion use
SELECT STUDENT_ID,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS) AS "ROW_NUMBER" FROM INEURON_STUDENT;

-- Can you try to give me a record that give me the topper from every batches Without use of the window function
SELECT STUDENT_NAME,STUDENT_MARKS,STUDENT_BATCH FROM INEURON_STUDENT WHERE (STUDENT_BATCH,STUDENT_MARKS) IN (SELECT STUDENT_BATCH,MAX(STUDENT_MARKS) FROM INEURON_STUDENT GROUP BY STUDENT_BATCH);


-- use to the window function 
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS) AS 'ROW_NUM' FROM INEURON_STUDENT ) AS TEST  WHERE ROW_NUM=1;
-- This will give me the lowest number obtain into the its batch

 -- give me the topper of each batch student details
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS 'ROW_NUM' FROM INEURON_STUDENT) AS TEST WHERE ROW_NUM=1;

-- In this record fsbc highest score is 65 so add one recored on the fsbc batch and its also mark is same
INSERT INTO INEURON_STUDENT VALUE(119, 'fsbc', 'sandeep', 'ECE', 65, 'sandeep@gmail.com'); 

-- Now see the table of highest marks into the batch wise
SELECT STUDENT_ID,STUDENT_NAME,STUDENT_STREAM,STUDENT_BATCH,STUDENT_MAIL_ID ,
ROW_NUMBER() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS 'ROW_NUM' FROM INEURON_STUDENT;

-- Now execute the above query to fetch the highest score details getting into the each batch
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MAIL_ID,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS) AS 'ROW_NUM' FROM INEURON_STUDENT) AS TEST WHERE ROW_NUM=1;

-- This is not the true result because the fsbc batch there are two topper student but here i am getting the only one 

-- So the concept getting is Rank function

SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID ,
ROW_NUMBER() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS 'ROW_NUMBER',
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS 'RANK_NUM' FROM INEURON_STUDENT;

-- Now fetch the highest of the each batch topper studdent
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID ,
ROW_NUMBER() OVER (PARTITION BY STUDENT_STREAM ORDER BY STUDENT_MARKS DESC) AS "ROW_NUM" ,
RANK() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS "RANK_NUM" FROM INEURON_STUDENT) AS TEST WHERE RANK_NUM=1;

-- Getting the correct result

-- Now another problem is that can you give me the 2nd topper of the each batches student details
	-- this problem is not solving with the row_number() as well as rank() 
-- So the concept dewn is using the DencRank

-- this is the query
SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID,
ROW_NUMBER() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC ) AS 'ROW_NUM',
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC ) AS 'RANK_NUM',
DENSE_RANK() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS 'DENSE_RANK' FROM INEURON_STUDENT;

-- Now try to find the second highest or second topper of each batch
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID ,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS "ROW_NUM",
RANK() OVER( PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS "RANK_NUM" ,
DENSE_RANK() OVER( PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARkS DESC ) AS "DENSE_RANK" FROM INEURON_STUDENT)
AS TEST WHERE `DENSE_RANK`=2;


-- can you show me the third highest socre getting in each batchess student details
SELECT * FROM (SELECT STUDENT_ID,STUDENT_NAME,STUDENT_BATCH,STUDENT_STREAM,STUDENT_MARKS,STUDENT_MAIL_ID,
ROW_NUMBER() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS "ROW_NUM",
RANK() OVER(PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC) AS "RANK_NUM",
DENSE_RANK() OVER (PARTITION BY STUDENT_BATCH ORDER BY STUDENT_MARKS DESC ) AS "DENSE_RANK" FROM INEURON_STUDENT)
AS TEST WHERE `DENSE_RANK`=3;


-- Now i am focus into the partitioning
-- first know about the partitioning
	-- partitioning is one of the way or approach to reduce the time of execution
    -- partitioning is like splitting one large table into many smallar, individual mini table call partition . based on rules you defined

-- Now create one another database to perform some sort of the partitioning operation
CREATE DATABASE IF NOT EXISTS INEURON_PARTITION;

-- Now use this same database to perform operation
USE INEURON_PARTITION;

-- Use to create another table that i perform operation upon the partition
CREATE TABLE IF NOT EXISTS INEURON_COURSE
(
	COURSE_NAME VARCHAR(40),
    COURSE_ID INT(10),
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(40),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(40),
    COURSE_LAUNCH_YEAR INT
);
-- Now see the table structure
SELECT * FROM INEURON_COURSE;

-- Now fill the some sort of the data into this table 'ineuro_course'
insert into Ineuron_course values
('aiops', 101, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
('dlcvnlp', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
('aws cloud', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
('blockchain', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
('RL', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
('Dl', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
('interview prep', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
('big data', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
('data analytics', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
('fsds', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
('fsda', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
('fabe', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
('java', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
('MERN', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);

-- See the table data
SELECT * FROM INEURON_COURSE;

-- Can you fetch the record for the course_launch_year =2019
SELECT * FROM INEURON_COURSE WHERE COURSE_LAUNCH_YEAR=2019;

-- In this query we are try to check the entire record if course_launch_year=2019 
	-- then it should accept
    -- other will be reject
-- if i use to create one table that not looking into the entire table it looking into the specific record directly 

-- so try to based on your course_launch_date in table
-- use to partition

CREATE TABLE IF NOT EXISTS INEURON_COURSE_1
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT(10),
    COURSE_TITLE VARCHAR(20),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY RANGE (COURSE_LAUNCH_YEAR)
(
	PARTITION P0 VALUES LESS THAN (2019),
    PARTITION P1 VALUES LESS THAN (2020),
    PARTITION P2 VALUES LESS THAN (2021),
    PARTITION P3 VALUES LESS THAN (2022),
    PARTITION P4 VALUES LESS THAN (2023)
);

-- Now see the table structure
SELECT * FROM INEURON_COURSE_1;

-- Now insert some sort of the data into this table
insert into Ineuron_course_1 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 101, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);
    
-- See the table data
SELECT * FROM INEURON_COURSE_1;

-- Now again try to fetch the data whose course_launch_year is 2020 without suse the partition table
SELECT * FROM INEURON_COURSE WHERE COURSE_LAUNCH_YEAR=2020;
	-- its exection time is : 0.00047770
    -- wait lock time is: 0.000000500
    
-- Now check the partition wise table 
SELECT * FROM INEURON_COURSE_1 WHERE COURSE_LAUNCH_YEAR=2020;
	-- It take the 0.00041670
    -- wait time is: - 000000400
    
-- Means partition is reduce the time  of execution  if i use the large data set then it show the clear differences 

-- How to check what kind of the partion is used on the table and all information  about the partion in the table
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME="INEURON_COURSE_1";


-- Now create another partition using the Range

CREATE TABLE IF NOT EXISTS INEURON_COURSE_2
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(40),
    COURSE_DESC VARCHAR(50),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY RANGE COLUMNS (COURSE_DATE)
(
	PARTITION P0 VALUES LESS THAN ('2019-07-07'),
    PARTITION P1 VALUES LESS THAN ('2020-07-07'),
    PARTITION P3 VALUES LESS THAN ('2021-07-07'),
    PARTITION P4 VALUES LESS THAN ('2022-07-07'),
    PARTITION P5 VALUES LESS THAN ('2023-07-07')
);

-- With converting date into int creating the partition using the range ccolumn

-- Now insert some sort of the data into this table like
insert into Ineuron_course_2 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 101, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);
    
-- Now see the table data
SELECT * FROM INEURON_COURSE_2;

-- Now fetch the record that the course date is '2019-07-07' without use the partition
SELECT * FROM INEURON_COURSE WHERE COURSE_DATE='2019-07-07';
-- Take 50900
-- Now use the partion column 
SELECT * FROM INEURON_COURSE_2 WHERE COURSE_DATE='2019-07-07';
-- Its take the 39900 

-- another
SELECT * FROM INEURON_COURSE_2 WHERE COURSE_DATE='2022-07-07';
-- it take the 41030 time 

-- Now use the another partition 
-- THAT IS THE HASH PARTITION

CREATE TABLE IF NOT EXISTS INEURON_COURSE_3
(
	COURSE_NAME VARCHAR(50),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY HASH (COURSE_LAUNCH_YEAR) 
	PARTITIONS 5;
    
-- Now see the table structure
SELECT * FROM INEURON_COURSE_3;

-- Now see the all infromation about the ineuron_course_3 table of partition
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS  WHERE TABLE_NAME='INEURON_COURSE_3';
    
-- It give the table that bydefault containing the partition values wise
	-- p0 to p4 because i want to give 5 partition
		-- without inserting the data
-- if i want to 10 partition based on the course_launch_year

CREATE TABLE IF NOT EXISTS INEURON_COURSE_4
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR_NAME VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY HASH (COURSE_LAUNCH_YEAR)
PARTITIONS 10;

-- Now see the information about the partition
SELECT PARTITION_NAME, TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_4';
-- In this there are 10 partition p0 to p9

-- one problem i have that is the i have only 5 year of data but i am creating the 10 partition
	-- then how it will be divide the data which data comes into this partition or that partition
    
-- so first i insert the data into the INEURON_COURSE_4 TABLE
insert into Ineuron_course_4 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 101, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 101, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 101, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 101, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 101, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);

-- Now see the data into the table
SELECT * FROM INEURON_COURSE_4;

-- Now i check which partition take how many of record 
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_4';

-- The result was schokking
	-- p0=4,p1=3,p2=4 and p3-p8=0 and p9=4
-- so the final answer is: how to choose which partition will take
-- total record=10
-- based on your year=2019,2020,2021,2022,2023 what ever
	-- take anyone year and divide into the 10 and look into the remender
		-- if your remender=0 then it will go to the p0
        -- if your remender =1 then it will go to the p1
        -- and so on----
	-- this is the method hash  partition chose which partition will take

-- then what ever i fetch that find out not going to every data only goes to specific partition 

-- Now moving into the Key_partition
-- Create one table that i am using to perform some sort of the key partition

CREATE TABLE IF NOT EXISTS INEURON_COURSE_5
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(40),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY KEY(COURSE_LAUNCH_YEAR)
PARTITIONS 10;

-- See the table structure
SELECT * FROM INEURON_COURSE_5;

-- information about the partitions
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_5';

-- Now fill the data into this table
insert into Ineuron_course_5 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);

-- Now see the data
SELECT * FROM INEURON_COURSE_5;

-- Now see the which partition take how many record
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_5';

-- In this time it also give me the shocking result like
	-- p0=0
	-- p1=8
    -- p3=3
    -- p5=4
    -- and other is 0
-- so how in this time, how to chose the which partiton  will take

	-- so in this time it take based on the MD5 algorithms
		-- it take the input and generate the hashing value or encrypted hash value
        -- on this hashing value perform some sort of the partition 
-- lets example
SELECT MD5("SUBODH"); -- it give me '2ad4389aaf0ae0ed18a7eb5b759e1167'
SELECT MD5(101); -- it give me '38b3eff8baf56627478ec76a704e9b52' 

-- based on this encrypted data partition will do the partitioning


-- Now focusing into the another partitioning -- List partingig
-- So create one table
CREATE TABLE IF NOT EXISTS INEURON_COURSE_6
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(40),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY LIST(COURSE_LAUNCH_YEAR)(
	PARTITION P0 VALUES IN (2019,2020),
	PARTITION P1 VALUES IN (2022,2021)
);

-- See the table structure
SELECT * FROM INEURON_COURSE_6;

-- Now see the partition information 
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME="INEURON_COURSE_6";

-- now insert the record 
insert into Ineuron_course_6 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);

-- See the table data structure
SELECT * FROM INEURON_COURSE_6;

SELECT COUNT(*) FROM INEURON_COURSE_6;

-- Now again see the partiton data
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="Ineuron_course_6";

-- it give the total 2 partition and take the p0=8 and p1=7 
	-- it use to the range method to insert the record into the Partitin records;

-- Now focus into the another partition 
# Range column
-- create table
CREATE TABLE IF NOT EXISTS INEURON_COURSE_7
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY RANGE COLUMNS(COURSE_NAME,COURSE_ID,COURSE_LAUNCH_YEAR)(
	PARTITION P0 VALUES LESS THAN ("AIOPS", 101,2019),
    PARTITION P1 VALUES LESS THAN ("BIG DATA",102,2022),
    PARTITION P2 VALUES LESS THAN ("DATA ANALYTICS" , 104,2021),
    PARTITION P3 VALUES LESS THAN ("FSDA",111,2022)
);

-- Now insert some sort of the data
insert into Ineuron_course_7 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);
-- It will give me the error then i use to 
-- Error is :- table has not partition for value from column_list
-- means some of the partition that i give  that not  fall under the column 
insert ignore into Ineuron_course_7 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);
    
-- now i see the recored
SELECT * FROM INEURON_COURSE_7;

-- See the information about the partition
SELECT PARTITION_NAME,TABLE_NAME,TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME="INEURON_COURSE_7";

-- Now i use to another partition
#LIST COLUMN

-- Create another talble
CREATE TABLE IF NOT EXISTS INEURON_COURSE_8
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY LIST COLUMNS(COURSE_NAME)
(
	partition p0 values in ('dlcvnlp','aws cloud''big data''fsds'),
    partition p1 values in ('Machine-Learning','Dl','MERN'),
    partition p2 values in ('java','fabe','data analytics'),
    partition p3 values in ('RL','interview prep')
); 

-- check the table sturcture
SELECT * FROM INEURON_COURSE_8;

-- Now i get the information about the table
SELECT PARTITION_NAME,TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_8';

-- Fill the value into this table
-- now insert some sort of the data into this table ineuron_course-9
	INSERT IGNORE INTO INEURON_COURSE_8 values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);	

-- Now i see the table structure
SELECT * FROM INEURON_COURSE;

-- Now see the table information or partition information
SELECT PARTITION_NAME,TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_8';

-- Now i use to the another partition 
	-- Sub partition
-- partititon under the partition

-- CREATE ONE TABLE AND PERFORM SOME SORT OF THE SUBPARTITION  OPERATION

CREATE TABLE IF NOT EXISTS INEURON_COURSE_9
(
	COURSE_NAME VARCHAR(30),
    COURSE_ID INT,
    COURSE_TITLE VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_DATE DATE,
    COURSE_FEE INT,
    COURSE_MENTOR VARCHAR(30),
    COURSE_LAUNCH_YEAR INT
)
PARTITION BY RANGE(COURSE_LAUNCH_YEAR )
SUBPARTITION BY HASH(COURSE_LAUNCH_YEAR)
subpartitions 5 (
	partition p0 values less than (2019),
    partition p1 values less than (2020),
    partition p2 values less than (2021),
    partition p3 values less than (2022)
);

-- Now see the table structure
SELECT * FROM INEURON_COURSE_9;

-- Now see the information about the table
SELECT PARTITION_NAME,TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_9';

-- Now fill some sort of the data
INSERT IGNORE INTO INEURON_COURSE_9 VALUES
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019),
    ('aiops', 102, 'ai-', "this is aiops course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('dlcvnlp', 103, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('aws cloud', 104, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('blockchain', 105, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('RL', 106, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('Dl', 107, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('interview prep', 108, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019),
	('big data', 109, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('data analytics', 110, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fsds', 111, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('fsda', 112, 'ML', "this is ML course", '2021-07-07', 3540, 'sudhanshu', 2021),
	('fabe', 113, 'ML', "this is ML course", '2022-07-07', 3540, 'sudhanshu', 2022),
	('java', 114, 'ML', "this is ML course", '2020-07-07', 3540, 'sudhanshu', 2020),
	('MERN', 115, 'ML', "this is ML course", '2019-07-07', 3540, 'sudhanshu', 2019);
    
    -- See the table structure
SELECT * FROM INEURON_COURSE_9;

-- Check the partition information
SELECT PARTITION_NAME,TABLE_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME='INEURON_COURSE_9';

-- it show the total number of partition just like :
	-- firstly  partition in the p0,p1,p2,p3 then 
		-- it divided into the 
			-- p0 five time
			-- p1 five time
            -- p2 five time
            -- p3 five time
-- firstly the partition will execute that p0 to p3 then
	-- supartition will execute it divide the data into all partition are available divide into 5 gimes

-- Now perform some sort of the joins operation

-- So create new database to perorm new operation
CREATE DATABASE IF NOT EXISTS OPERATION;

-- Now use to this database to perform some sort of the operation so use it
USE OPERATION;

-- Just i create one new table 
CREATE TABLE IF NOT EXISTS COURSE
(
	COURSE_ID INT,
    COURSE_NAME VARCHAR(30),
    COURSE_DESC VARCHAR(40),
    COURSE_TAG VARCHAR(40)
);

-- now create another table that name is student
CREATE TABLE IF NOT EXISTS STUDENT
(
	STUDENT_ID INT,
    STUDENT_NAME VARCHAR(30),
    STUDENT_MOBILE VARCHAR(40),
    STUDENT_COURSE_ENROLL VARCHAR(60),
    STUDENT_COURSE_ID INT
);

-- Now insert some sort of the data into the course table
INSERT INTO COURSE VALUES
	(101,"fsda","full stack data analyst","analytics"),
    (102,"fdsa","full stack data Science","analytics"),
    (103,"big_data","full stack big data","bD"),
    (104,"mern","web dev","mern"),
    (105,"bloackchanin","full stack blockchain","java"),
    (106,"java","backend java","java"),
    (101,"cybersecurity","full stack cybersecutiry","cybersecurity"),
    (102,"testing","testing developer","testing"),
    (105,"c","c programming","c"),
    (108,"c++","game developer","c++"),
    (109,"cloud","cloud computiong","cloud"),
    (107,"plc","automation","plc");
    
-- See the course_coulumn data
SELECT * FROM COURSE;

-- Now fill the student table
INSERT INTO STUDENT VALUES 
	(301,"subodh",970795935,"yes",101),
    (302,"sonu",970795935,"yes",103),
    (303,"sanju",456155,"NO",102),
    (302,"monu",4566,"yes",101),
    (303,"rakesh",654465,"NO",105),
    (304,"suraj",564645564,"NO",107),
    (305,"monuy",78996564,"NO",108),
    (306,"subodh",6465,"yes",101),
    (307,"radha",46678,"yes",107),
    (304,"ranu",7456465,"NO",101),
    (304,"punam",970795935,"NO",103),
    (302,"vishal",78945561,"NO",101);
    
-- Now see the data into the table
SELECT * FROM STUDENT;

-- Now perform the inner join on these data tables
SELECT C.COURSE_ID,C.COURSE_NAME,C.COURSE_DESC,S.STUDENT_ID,STUDENT_NAME,STUDENT_COURSE_ID
FROM COURSE C 
INNER JOIN STUDENT S
ON  C.COURSE_ID = S.STUDENT_COURSE_ID;

-- OR 
SELECT * FROM COURSE C INNER JOIN STUDENT S ON  C.COURSE_ID = S.STUDENT_COURSE_ID ORDER BY COURSE_ID ASC;

-- Inner join says that the common of both the table based on the condition show it record

-- list of all students along with its full details course title that they are enroll  of any course
SELECT S.STUDENT_NAME,C.COURSE_DESC 
FROM COURSE C
INNER JOIN STUDENT S
ON C.COURSE_ID=S.STUDENT_COURSE_ID
WHERE S.STUDENT_COURSE_ENROLL="YES";

-- ANOTHER METHOD
SELECT S.STUDENT_NAME,C.COURSE_DESC
FROM STUDENT S
LEFT JOIN COURSE C
ON C.COURSE_ID=S.STUDENT_COURSE_ID
WHERE S.STUDENT_COURSE_ENROLL="YES";

-- Try to find out those course record who have enroll at least one student
SELECT C.COURSE_ID,C.COURSE_NAME,S.STUDENT_NAME
FROM COURSE C
INNER JOIN STUDENT S 
ON C.COURSE_ID=S.STUDENT_COURSE_ID;

-- Left join
SELECT C.COURSE_ID,C.COURSE_NAME,C.COURSE_DESC,S.STUDENT_ID,S.STUDENT_NAME,S.STUDENT_COURSE_ID,S.STUDENT_MOBILE
FROM COURSE C
LEFT JOIN STUDENT S
ON C.COURSE_ID=S.STUDENT_COURSE_ID;

-- OR
SELECT * FROM COURSE 
LEFT JOIN STUDENT 
ON COURSE.COURSE_ID =STUDENT.STUDENT_COURSE_ID;

-- Can you find those record of course that have not inroll anyone
-- ----------------------------------------------------------------------JOIN ARE MISSING LEARN NEXT------------------------------------------------------------------

-- Now just focus into the indexing 
-- indexing are used to retrive data from the database more quickly than other wise the use can not see the indexes they are just used to speed up searches quesry
-- index is also used to table creation

-- now focus into the indexing indepth
-- show the information about the indexing from the course table
SHOW INDEX FROM COURSE;

-- Create one table and perform indexing operation
CREATE TABLE IF NOT EXISTS COURSE_1
(
	COURSE_ID INT,
    COURSE_NAME VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_TAG VARCHAR(30),
    INDEX(COURSE_ID) -- INDEX APPLY ON THE COURSE_ID COLUMN
);

-- Now see the indexing from the course table 1
SHOW INDEXES  FROM COURSE_1;

-- Now fill the some sort of the data into the table
insert into course_1 values(
	101,"fsda","full stack data analyst","analytics"),
    (102,"fdsa","full stack data Science","analytics"),
    (103,"big_data","full stack big data","bD"),
    (104,"mern","web dev","mern"),
    (105,"bloackchanin","full stack blockchain","java"),
    (106,"java","backend java","java"),
    (101,"cybersecurity","full stack cybersecutiry","cybersecurity"),
    (102,"testing","testing developer","testing"),
    (105,"c","c programming","c"),
    (108,"c++","game developer","c++"),
    (109,"cloud","cloud computiong","cloud"),
    (107,"plc","automation","plc"
);

-- Now again show the indexes from the course_1 table
SHOW INDEXES FROM COURSE_1;

-- Create another table that is also used the indexing 
CREATE TABLE IF NOT EXISTS COURSE_2
(
	COURSE_ID INT,
    COURSE_NAME VARCHAR(30),
    COURSE_DESC VARCHAR(30),
    COURSE_TAG VARCHAR(30),
    INDEX(COURSE_ID,COURSE_NAME)
);

-- Now show the index from the course_2
SHOW INDEXES FROM COURSE_2;

-- Explain the index tablle
EXPLAIN SELECT * FROM  COURSE_1;

-- Analyze the table
ANALYZE TABLE COURSE_1;

-- Now see the some of the execution plan in the indexing table
SELECT * FROM COURSE_1 WHERE COURSE_ID =106;

-- Now unique indexes -- so table creation
CREATE TABLE IF NOT EXISTS COURSE_3
(
	COURSE_ID INT,
    COURSE_NAME VARCHAR(40),
    COURSE_DESC VARCHAR(30),
    COURSE_TAG VARCHAR(30),
    UNIQUE INDEX(COURSE_DESC)
);

-- Now see the table detailes in the related to the indexes
SHOW INDEXES FROM COURSE_3;


-- Now perfom the union operation
-- see the student and course_table
SELECT * FROM STUDENT,COURSE;

-- Now perfom the union operation on the student and course table
SELECT COURSE_ID,COURSE_NAME, COURSE_DESC FROM COURSE
UNION 
SELECT STUDENT_ID ,STUDENT_NAME FROM STUDENT;

-- It give me the error because number of column must be same in each of the select statement

-- If data type is different  but still i combine the data from singal table in the vartical format
SELECT STUDENT_ID,STUDENT_NAME FROM STUDENT
UNION 
SELECT COURSE_NAME,COURSE_ID FROM COURSE;

-- Create another table 
CREATE TABLE IF NOT EXISTS LIBRARY 
(
	LIBRARY_ID INT,
    LIBRARY_NAME VARCHAR(30),
    LIBRARY_BOOKS_NAME VARCHAR(30)
);

-- Now see the table structure
SELECT * FROM LIBRARY;

-- insert some of the data
insert into library values
	(1,"rajaram","math"),
    (2,"rohit","science"),
    (3,"mukundar","sst");

-- Can i use the 2 union operation on the single query 
SELECT STUDENT_ID,STUDENT_NAME FROM STUDENT
UNION
SELECT COURSE_NAME,COURSE_ID FROM COURSE
UNION
SELECT LIBRARY_ID,LIBRARY_NAME FROM LIBRARY;

-- Union Remove the duplicate record as well
-- if i show the all record with add on duplicassy as well then i use to the union operation 

-- first i insert some of the duplication element into the table
INSERT INTO LIBRARY VALUES
(1,"RAJARAM","MATH"),
(2,"ROHIT","SCIENCE"),
(3,"MUKUMDAR","SST");

-- also insert into the course_1 values
INSERT INTO COURSE_1 VALUES
	(101,"fsda","full stack data analyst","analytics"),
    (102,"fdsa","full stack data Science","analytics"),
    (103,"big_data","full stack big data","bD");
    
-- Insert into student values as well 
INSERT INTO STUDENT VALUES
	(301,"subodh",970795935,"yes",101),
    (302,"sonu",970795935,"yes",103),
    (303,"sanju",456155,"NO",102),
    (302,"monu",4566,"yes",101);

-- Firstly count all the table that how much record have
SELECT COUNT(*) AS TOTAL_NUMBER_OF_RECORD FROM STUDENT;-- 16
SELECT COUNT(*) AS TOTAL_NUMBER_OF_RECORD FROM COURSE; -- 12
SELECT COUNT(*) AS TOTAL_NUMBAR_OF_RECORD FROM LIBRARY; -- 6

-- Means if i combine all the table of the record  then 34

SELECT COUNT(*) AS TOTAL_NUM_OF_RECORED_AFTER_UNION FROM (
	SELECT STUDENT_ID,STUDENT_NAME FROM STUDENT
    UNION
    SELECT COURSE_ID,COURSE_NAME FROM COURSE
    UNION 
    SELECT LIBRARY_ID,LIBRARY_NAME FROM LIBRARY
) AS COMBINE_DATA;

-- It show only 27 record 
	-- But i have 34 record there are 7 record was missing
    -- means it delete the duplicate record bydefault
    
-- if i show the duplicate element as well the i used to the union all operation
SELECT STUDENT_ID,STUDENT_NAME FROM STUDENT
UNION ALL 
SELECT COURSE_ID, COURSE_NAME FROM COURSE
UNION ALL
SELECT LIBRARY_ID,LIBRARY_NAME FROM LIBRARY;

-- Now i check the total number of record
SELECT COUNT(*) AS TOTAL_NUM_OF_RECORD_AFTER_UNION_ALL FROM 
(
	SELECT STUDENT_ID,STUDENT_NAME FROM STUDENT
	UNION ALL 
	SELECT COURSE_ID, COURSE_NAME FROM COURSE
	UNION ALL
	SELECT LIBRARY_ID,LIBRARY_NAME FROM LIBRARY
) AS TOTAL_RECORD;

-- it give the correct record

-- |--> CTE (Common Table Expressions)
-- |--> Simple CTE
-- |--> Multiple CTEs
-- |--> Nested CTE
-- |--> Recursive CTE

-- Use the existing Operation database
use Operation;

-- ============================================================
-- SECTION 1: SIMPLE CTE
-- ============================================================

-- A CTE is a temporary named result set defined using the WITH keyword.
-- It exists only for the duration of the query.

-- Syntax:
-- WITH cte_name AS (
--     SELECT ...
-- )
-- SELECT * FROM cte_name;

-- Example 1: Get all students who are enrolled in a course
WITH enrolled_students AS (
    SELECT student_id, student_name, student_course_id
    FROM student
    WHERE student_course_enroll = 'yes'
)
SELECT * FROM enrolled_students;

USE OPERATION;



-- Example 2: Get all courses that belong to the 'analytics' tag
WITH analytics_courses AS (
    SELECT course_id, course_name, course_tag
    FROM course
    WHERE course_tag = 'analytics'
)
SELECT * FROM analytics_courses;


-- ============================================================
-- SECTION 2: CTE WITH AGGREGATION
-- ============================================================

-- Find the total number of students enrolled per course_id
WITH enrollment_count AS (
    SELECT student_course_id, COUNT(*) AS total_enrolled
    FROM student
    WHERE student_course_enroll = 'yes'
    GROUP BY student_course_id
)
SELECT * FROM enrollment_count;

-- Join the CTE result back with the course table to get course names
WITH enrollment_count AS (
    SELECT student_course_id, COUNT(*) AS total_enrolled
    FROM student
    WHERE student_course_enroll = 'yes'
    GROUP BY student_course_id
)
SELECT c.course_id, c.course_name, ec.total_enrolled
FROM course c
JOIN enrollment_count ec ON c.course_id = ec.student_course_id;


-- ============================================================
-- SECTION 3: MULTIPLE CTEs (chained with comma)
-- ============================================================

-- You can define multiple CTEs in one WITH clause, separated by commas.
WITH enrolled_students AS (
    SELECT student_id, student_name, student_course_id
    FROM student
    WHERE student_course_enroll = 'yes'
),
analytics_courses AS (
    SELECT course_id, course_name
    FROM course
    WHERE course_tag = 'analytics'
)
SELECT es.student_name, ac.course_name
FROM enrolled_students es
JOIN analytics_courses ac ON es.student_course_id = ac.course_id;


-- ============================================================
-- SECTION 4: CTE vs SUBQUERY (same result, better readability)
-- ============================================================

-- Using a subquery (harder to read):
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
);

-- Using a CTE (cleaner and reusable):
WITH analytics_courses AS (
    SELECT course_id FROM course WHERE course_tag = 'analytics'
)
SELECT student_name, student_course_id
FROM student
WHERE student_course_id IN (SELECT course_id FROM analytics_courses);


-- ============================================================
-- SECTION 5: RECURSIVE CTE
-- ============================================================

-- A Recursive CTE calls itself to process hierarchical or sequential data.
-- Syntax:
-- WITH RECURSIVE cte_name AS (
--     -- Anchor member (starting point)
--     SELECT ...
--     UNION ALL
--     -- Recursive member (repeating logic)
--     SELECT ... FROM cte_name WHERE <condition>
-- )
-- SELECT * FROM cte_name;

-- Example: Generate a number series from 1 to 10
WITH RECURSIVE number_series AS (
    SELECT 1 AS num          -- anchor: start at 1
    UNION ALL
    SELECT num + 1           -- recursive: increment by 1
    FROM number_series
    WHERE num < 10           -- termination condition
)
SELECT * FROM number_series;

-- Example: Create an employee-manager hierarchy table
CREATE TABLE IF NOT EXISTS employee (
    emp_id   INT,
    emp_name VARCHAR(40),
    manager_id INT           -- NULL means top-level (no manager)
);

INSERT INTO employee VALUES
    (1, 'Alice',   NULL),    -- CEO
    (2, 'Bob',     1),       -- reports to Alice
    (3, 'Charlie', 1),       -- reports to Alice
    (4, 'David',   2),       -- reports to Bob
    (5, 'Eve',     2),       -- reports to Bob
    (6, 'Frank',   3);       -- reports to Charlie

-- Traverse the hierarchy starting from the top (Alice)
WITH RECURSIVE emp_hierarchy AS (
    -- Anchor: start with the top-level employee (no manager)
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: find employees whose manager_id matches a previous row
    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employee e
    JOIN emp_hierarchy eh ON e.manager_id = eh.emp_id
)
SELECT * FROM emp_hierarchy
ORDER BY level, emp_id;
-- Level 1 = Alice (CEO)
-- Level 2 = Bob, Charlie (direct reports)
-- Level 3 = David, Eve, Frank (second tier)


-- ============================================================
-- SECTION 6: QUICK COMPARISON
-- ============================================================

-- | Feature         | Subquery        | CTE                  |
-- |-----------------|-----------------|----------------------|
-- | Readability     | Hard to read    | Easy to read         |
-- | Reusability     | Cannot reuse    | Can reference again  |
-- | Recursion       | Not possible    | Supported            |
-- | Performance     | Similar         | Similar (optimizer)  |


-- example no. 1
With sample_student as (
	select * from course where course_id in (101,102,106)
)
select * from sample_student where course_tag='java';

-- on the cross join perform the cte
with outcome_cross_join as(
select c.course_id,c.course_name,c.course_desct,
s.student_id,s.student_name,s.student_course_enroll from course c
cross join student s)
select student_id,student_name,course_id,course_name,student_course_enroll from outcome_cross_join where student_id=306;

-- another example
with ctetest as (
	select 1 as col1 , 2 as col2
    union all 
    select 3,4
)
select col1 from ctetest;

-- Now go the next cte that name is CTE Recursive
with recursive cte(n) as(
	select 1 union all select n+1 from cte where n<5)
select * from cte;

-- another example of the recursive cte
with recursive cte as(
	select 1 as n, 10 as p ,20 as q 
    union all
    select n+1,p+1,q+1 from cte where n<5)
select * from cte;


select * from course;

-- Now focus into the Triggers
-- Trigger are applicable in the insert update and delete operation

-- there are mainly 6 kind of trigger are present in general

-- 1. Before insert
-- 2. After insert 
-- 3. before update
-- 4. After update
-- 5. Before delete
-- 6. After Delete 

-- -- Now create a database 
CREATE DATABASE IF NOT EXISTS INEURON_1;

-- use this database to perform the trigger operation
USE INEURON_1;

--  Now create one table 
CREATE TABLE IF NOT EXISTS COURSE
(
	COURSE_ID INT,
    COURSE_DESC VARCHAR(30),
    COURSE_MENTOR VARCHAR(30),
    COURSE_PRICE INT,
    COURSE_DESCOUNT INT,
    CREATE_DATE DATE
);

-- Create another table 
CREATE TABLE IF NOT EXISTS COURSE_UPDATE
(
	COURSE_MENTOR_UPDATE VARCHAR(40),
    COURSE_PRICE_UPDATE INT,
    COURSE_DISCOUNT_UPDATE INT
);

-- Now perform the Triggere operation on these table

-- Insert operation 
	-- before insert
DELIMITER //
CREATE TRIGGER COURSE_BEFORE_INSERT
BEFORE INSERT
ON 
COURSE FOR EACH ROW
BEGIN 
	SET NEW.CREATE_DATE=SYSDATE();
END //
DELIMITER ;

-- If i insert some sort of the values in the course table 
INSERT INTO COURSE VALUES(101,"full stack data analyst","sudhanshu",4000,10); 	
	-- It show the error because the course table contain 6 column but i pass only 5 column values and missing the create_date are missing
		-- so i use the trigger on this column it automattically fill the values on course_date_column
			-- but some sort of the mapping are missing here
				-- firstly mapping then it not show error
-- so
INSERT INTO COURSE(COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DESCOUNT) VALUES (101,"full stack data analyst","sudhanshu",4000,10); 

-- See the table data insert or not
SELECT * FROM COURSE;	

-- When execute this query to show the full data into the table -- inside the table create_date containing null 

-- then i execute the above trigger operation before insert 

-- Now once again insert the data into the table
INSERT INTO COURSE(COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DESCOUNT) VALUES (101,"full stack data analyst","sudhanshu",4000,10); 

-- see the data table
SELECT * FROM COURSE;

-- Get the result as '101', 'full stack data analyst', 'sudhanshu', '4000', '10', '2026-09-26'
-- it means it automaticlly fill the create_date column as today_date

-- now perform some operation to the another column
	-- who has inserted this record
ALTER TABLE COURSE
ADD COLUMN USER_INFO VARCHAR(40);

-- See the table structure
SELECT * FROM COURSE;

-- Curse table user_info contain the null null values so next row fill it
DELIMITER //
CREATE TRIGGER BEFORE_INSERT_TRIGGER
BEFORE INSERT 
ON COURSE FOR EACH ROW 
BEGIN
	DECLARE USER_VAL VARCHAR(30);
    SET NEW.CREATE_DATE=NOW();
    SELECT USER() INTO USER_VAL;
    SET NEW.USER_INFO=USER_VAL;
END //
DELIMITER ;

-- Now i insert the data into the course or same column
INSERT INTO COURSE(COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DESCOUNT) VALUES (101,"full stack data SCIENCE","sudhanshu",14000,20); 

-- See the data
SELECT * FROM COURSE;
-- it fill the record as the create_date=today_date as well as the user_info= root@localhost 

-- Now perform some of the more thing on before insert as well

-- Now create one reference table
CREATE TABLE IF NOT EXISTS REF_COURSE
(
	RECORD_INSERT_DATE DATE,
    RECORD_INSERT_USER VARCHAR(40)
);

-- Now see the table structure
SELECT * FROM REF_COURSE;

-- nothing is present into this ref_course

-- try to one thing that
-- insert some of the data into the course table and when ever insert the record on the course table it automatticaly insert to the 
	-- ref_course table
DELIMITER //
CREATE TRIGGER INSERT_BEFORE_BOTH_TABLE
BEFORE INSERT
ON COURSE FOR EACH ROW 
BEGIN 
DECLARE VAL VARCHAR(30);
SET NEW.CREATE_DATE=SYSDATE();
SELECT USER() INTO VAL;
SET NEW.USER_INFO=VAL;
INSERT INTO REF_COURSE VALUES(NOW(),VAL);
END //
DELIMITER ;

-- now insert the record into the course table
INSERT INTO COURSE(COURSE_ID,COURSE_DESC,COURSE_MENTOR,COURSE_PRICE,COURSE_DESCOUNT) VALUES (105,"full stack data engineering","subodh",12000,22); 

-- see the COURSE_TABLE
SELECT * FROM COURSE;

-- see the ref_course table
SELECT * FROM REF_COURSE;

-- Create one column on course table that store the integer type data and also add one column into the ref_course table 
	-- when insert the data into the course table column then automattically fill the sq of the course table data
    
ALTER TABLE COURSE 
ADD COLUMN COURSE_VAL INT;

ALTER TABLE REF_COURSE 
ADD COLUMN COURSE_VALUE_SQUARE INT;

-- Now create the procedure
DELIMITER //
CREATE TRIGGER BEFORE_INSERT_VALUES_AND_SQUARE 
BEFORE INSERT
ON COURSE FOR EACH ROW
BEGIN
    SET NEW.CREATE_DATE=SYSDATE();
    SET NEW.USER_INFO=USER();
    INSERT INTO REF_COURSE (RECORD_INSERT_DATE,RECORD_INSERT_USER,COURSE_VALUE_SQUARE) 
    VALUES (SYSDATE(),USER(),(NEW.COURSE_VAL * NEW.COURSE_VAL));
END //
DELIMITER ;

-- again fill the record
INSERT INTO COURSE
(
	COURSE_ID,
	COURSE_DESC,
    COURSE_MENTOR,
    COURSE_PRICE,
    COURSE_DESCOUNT,
    COURSE_VAL
) 
VALUES 
(500,"full stack database","afjal",45000,22,25); 

DROP TRIGGER INSERT_BEFORE_BOTH_TABLE; -- This trigger are run into the internally and not execute the after the inserting the another one column of reference table

-- Then i run the insert commant above query
-- again fill the record
INSERT INTO COURSE
(
	COURSE_ID,
	COURSE_DESC,
    COURSE_MENTOR,
    COURSE_PRICE,
    COURSE_DESCOUNT,
    COURSE_VAL
) 
VALUES 
(500,"full stack database","afjal",45000,22,25); 

SELECT * FROM COURSE;

-- See the data into the ref_course table
SELECT * FROM REF_COURSE;

-- Take another example 
INSERT INTO COURSE
(
	COURSE_ID,
	COURSE_DESC,
    COURSE_MENTOR,
    COURSE_PRICE,
    COURSE_DESCOUNT,
    COURSE_VAL
) 
VALUES
(300,"database","MONU",45440,21,75); 

SELECT * FROM COURSE;

-- See the data into the ref_course table
SELECT * FROM REF_COURSE;

-- Take another table another example
CREATE TABLE IF NOT EXISTS TEST_1
(
	C1 VARCHAR(40),
    C2 DATE,
    C3 INT
);

CREATE TABLE IF NOT EXISTS TEST_2
(
	C1 VARCHAR(30),
	C2 DATE,
    C3 INT
);

CREATE TABLE IF NOT EXISTS TEST_3
(
	C1 VARCHAR(30),
    C2 DATE,
    C3 INT
);

-- TRIGGER 
DELIMITER //
CREATE TRIGGER TO_UPDATE_OTHERS_
BEFORE INSERT
ON TEST_1 FOR EACH ROW
BEGIN
	INSERT INTO TEST_2 VALUES(NEW.C1, NEW.C2, NEW.C3);
    INSERT INTO TEST_3 VALUES(NEW.C1, NEW.C2, NEW.C3);
END //
DELIMITER ;


INSERT INTO TEST_1 VALUES("ZZZ",SYSDATE(),230); -- Insert into one time to add the data into the test_1

SELECT * FROM TEST_1;
SELECT * FROM TEST_2;
SELECT * FROM TEST_3;

insert into test_2 values("xyz",sysdate(),23);
insert into test_3 values("sss",now(),43);

-- Now focus into the After insert
# AFTER INSERT
DELIMITER //
CREATE TRIGGER TO_UPDATE_ANOTHER_TABLE_
AFTER INSERT
ON TEST_1 FOR EACH ROW
BEGIN
	UPDATE TEST_2 SET C1="ABC" WHERE C1="ZZZ";
    DELETE FROM TEST_3 WHERE C1="SSS";
END //
DELIMITER ;
SET SQL_SAFE_UPDATES=0;

INSERT INTO TEST_1 VALUES("SUBODH",SYSDATE(),333);

-- See the data
SELECT * FROM TEST_1;
SELECT * FROM TEST_2;
SELECT * FROM TEST_3;

-- Now focus into the delete trigger
DELIMITER //
CREATE TRIGGER TO_DELETE_OTHER_TABLE
AFTER DELETE 
ON TEST_1 FOR EACH ROW
BEGIN
	UPDATE TEST_2 SET C1="NARENDRA MODI" WHERE C1="ABC";
    INSERT INTO TEST_3(C1,C2,C3) VALUES(OLD.C1,OLD.C2,OLD.C3);
END //
DELIMITER ;

DELETE FROM TEST_1 WHERE C1="SUBODH";

-- See the data
SELECT * FROM TEST_1;
SELECT * FROM TEST_2;
SELECT * FROM TEST_3;

-- some of  the trigger are move to next practive like before_delete, after update,before_update and other other thing


-- Now focus into the case statement 

# Today focus into the case statement
-- using the ineuron partiton to perform some of the operation
USE INEURON_PARTITION;

-- see what kind of data table are present into this table
SHOW TABLES;

-- Show the data from the ineuron_course_table
SELECT * FROM INEURON_COURSE;

-- Try to one thing that --
	-- when ever fsda batch try to return me 'this is your batch" 
		-- other case it is suppose to tell me this is not your course or batch
	-- this type of situation come into the case statement
    
SELECT * ,
CASE
	WHEN COURSE_NAME="FSDA" THEN "THIS IS YOUR COURSE"
	ELSE
		"THIS IS NOT YOUR COURSE"
END AS STATEMENT FROM INEURON_COURSE;

-- Also add two or more condition
SELECT *,
CASE
	WHEN COURSE_NAME="FSDA" THEN "THIS IS YOUR COURSE" 
    WHEN COURSE_NAME="FSDS" THEN "THIS IS YOUR COURSE"
    ELSE "THIS IS NOT YOUR COURSE"
END AS STATEMENT FROM INEURON_COURSE;

-- Try to one another example
SELECT *,
CASE
	WHEN LENGTH(COURSE_NAME)=4 THEN "LENGTH IS 4"
    WHEN LENGTH(COURSE_NAME)=3 THEN "LENGTH IS 3"
    WHEN LENGTH(COURSE_NAME)=2 THEN "LENGTH IS 2"
ELSE
	"LENTHT IS OTHER"
END AS STATEMENT FROM INEURON_COURSE;

-- FIRSTLY CHECK THE TABLE NAME 
DESCRIBE INEURON_COURSE;
-- The course_launch_year d_type is int
	-- so use the case statement i need to check the coursee_launch_year 
		-- if it is divided by 2 then show even
	-- also if divided by 3 and 5 then its divided number as well

-- It show some sort of the null values contain becauese i am not  use the default case condition 
	-- if i use to the default conditioon then it change all the record that are not match to the case
-- another example of the case statement

UPDATE INEURON_COURSE SET COURSE_ID	=CASE
WHEN COURSE_TITLE="Ml" THEN "110"
WHEN COURSE_TITLE="AI-" THEN "130"
END;

-- see the record
SELECT * FROM INEURON_COURSE;

-- Also update the course_name
UPDATE INEURON_COURSE SET COURSE_NAME=CASE
WHEN COURSE_NAME IS NULL THEN "MISSING_COURSE_NAME"
ELSE COURSE_NAME
END ;

SELECT * FROM INEURON_COURSE;


-- create one database and perform some of the normal form
CREATE DATABASE IF NOT EXISTS NORMALFORMS_DB;

-- use this data base to perform some of the operation
USE NORMALFORMS_DB;

-- 1NF= FIRST NORMAL FORM
	-- each column contain atomic values  or individual values
    -- each column contain values  of single typed 	
    -- each row must be unique(primary key should exists)
    -- no repeating group of array in a column
    
-- violation of 1nf= student course column has multiple values (not atomic)


-- all kind of working do basis of the project


-- Now focus into the Pivot operation
-- Create one database to perform the pivoting opeation
CREATE DATABASE IF NOT EXISTS PIVOT;

-- use this database
USE PIVOT;

-- CREATE ONE TABLE TO PERFORM OPERATION
CREATE TABLE IF NOT EXISTS ORDER_TABLE
(
	ORDER_ID INT,
    EMPLOYED_ID INT,
    VENDOR_ID INT
);

-- now see the table structure
SELECT * FROM ORDER_TABLE;

-- Now insert some sort of the record in this table
insert into order_table values (
	1, 258, 1580),
	(2, 254, 1496),
	(3, 257, 1494),
	(4, 261, 1650),
	(5, 251, 1654),
	(6, 253, 1664	
);

-- see the data
SELECT * FROM ORDER_TABLE;

-- NOW CONVERT INTO THE PIVOT TABLE
SELECT ORDER_ID,
IF(EMPLOYED_ID=258,VENDOR_ID,NULL) AS "258",
IF(EMPLOYED_ID=254,VENDOR_ID,NULL) AS "254",
if(employed_id=257,vendor_id,Null) as "257",
if(employed_id=261,vendor_id,Null) as "261",
if(employed_id=251,vendor_id,Null) as "251",
if(employed_id=253,vendor_id,Null) as "251"
FROM ORDER_TABLE;

-- lets another example
	-- Create one table to perfrorm the pivot operation 
    
 CREATE TABLE IF NOT EXISTS STUDENT
 (
	STUDENT_NAME VARCHAR(40),
    STUDENT_COURSE VARCHAR(30),
    STUDENT_MARK INT
);

-- Now i fill some sort of the data into theis table
INSERT INTO STUDENT VALUES
(
	"subodh","fsda",99),
    ("sonu","fsds",44),
    ("mohan","big_data",55),
    ("mohit","machine_learning",45),
    ("subodh","fsds",33),
    ("mohit","deep_learing",98),
    ("bikash","java full stack",40),
    ("madhav","data science",90),
    ("sonu","machine_learning",33
);

-- Now see the data into the table
SELECT * FROM STUDENT;

-- now use the pivot operation into the student table

select student_name,
if(student_course="fsda",student_mark,null) as "fsda",
if(student_course="fsds",student_mark,null) as "fsds",
if(student_course="big_data",student_mark,null) as "big_data",
if(student_course="machine_learning",student_mark,null) as "machine_learning",
if(student_course="java full stack",student_mark,null) as "deep_learing",
if(student_course="data science",student_mark,null) as "data science"
from student
group by student_name;

 -- it show error like 
-- Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains 
-- nonaggregated column 'pivot.students.student_course' which is not functionally dependent
--  on columns in GROUP BY clause; 
-- this is incompatible with sql_mode=only_full_group_by

-- Error 1055 : Group By ke sath Aggregation (MAX/SUM)
--  lagana zaruri hai taaki non-grouped data merge ho sake.

-- then i use to the aggregation function

-- Use MAX or MIN if you want to see the specific value (like Marks/ID).
-- Use SUM if you want to see the total.
-- Use COUNT if you want to see how many.

-- use to max and see the result
select student_name,
max(if(student_course="fsda",student_mark,null)) as "fsda",
max(if(student_course="fsds",student_mark,null)) as "fsds",
max(if(student_course="big_data",student_mark,null)) as "big_data",
max(if(student_course="machine_learning",student_mark,null)) as "machine_learning",
max(if(student_course="java full stack",student_mark,null)) as "deep_learing",
max(if(student_course="data science",student_mark,null)) as "data science"
from student
group by student_name;

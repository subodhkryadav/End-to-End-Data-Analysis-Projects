-- ------------------------- Day -05 --------------------------------------------
# H.W is that
-- 1. Try to load the online retails data into the database
-- create the database online_Retail
create database Online_Retails;

# use this data base to perform some of the operatin
use Online_Retails;

# use to this command i create the table structure
-- C:\Users\subod>csvsql --dialect mysql --snifflimit 100000 "D:\sqll\sql practice\End-to-End-Data-Analysis-Projects\SQL\Practice\Day_05\online-retail-dataset.csv" > "D:\sqll\sql practice\End-to-End-Data-Analysis-Projects\SQL\Practice\Day_05\online.sql"

CREATE TABLE `online-retail`(
	`InvoiceNo` VARCHAR(7) NOT NULL, 
	`StockCode` VARCHAR(12) NOT NULL, 
	`Description` VARCHAR(35), 
	`Quantity` DECIMAL(38, 0) NOT NULL, 
	`InvoiceDate` TIMESTAMP NULL, 
	`UnitPrice` DECIMAL(38, 3) NOT NULL, 
	`CustomerID` DECIMAL(38, 0), 
	`Country` VARCHAR(20) NOT NULL
);
# Now show the table structure
select * from `online-retail`;

# Now use to the query insert the data 
load data infile "D:/sqll/sql practice/End-to-End-Data-Analysis-Projects/SQL/Practice/Day_05/online-retail-dataset.csv"
into table `online-retail`
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

# above are show one column are error invoicedate
alter table `online-retail`
modify column InvoiceDate varchar(30);

alter table `online-retail`
modify column `CustomerID` varchar(30);

select * from `online-retail`;

# in this table the invoiceDate are present in the varchar how to convert into the datetime
alter table `online-retail`
add column InvoiceDate_new date after InvoiceDate;
-- column is created now fill the data from the InvoiceDate column

alter table `online-retail`
modify column InvoiceDate_new datetime;

select * from `online-retail`;

# Now fill the value from the InvoiceDate column to the InvoiceDate_new column that contain to the Datetime datatype
set sql_safe_updates=0;

UPDATE `online-retail`
SET InvoiceDate_new = STR_TO_DATE(REPLACE(InvoiceDate, '-', '/'), '%m/%d/%Y %H:%i');

# all data are inserted to the new column and its type was also fixed 
		-- now check how many number of record are inserted to that column
select count(InvoiceDate_new) from `online-retail`;
 
## now perform some of the operation obout it 

-- 1. find the total number of record are present in this table
select count(*)  as total_record from `online-retail`;

# show how many column are present in this table
show columns from `online-retail`;

# show the total record using the column name
select InvoiceNo,StockCode,`Description`,Quantity,InvoiceDate,InvoiceDate_new,UnitPrice,CustomerID,Country from `online-retail`;

# show only 5 record in this table data 
select * from `online-retail`limit 5;

# can you show the last 5 record 
select count(*) from `online-retail`;
SELECT * FROM `online-retail` 
LIMIT 5 OFFSET 541904;

# can you show the only 2 record after the 3lack
select * from `online-retail` limit 2 offset 300000;

select * from `online-retail`;

# find the any 5 record from the table
select * from `online-retail` order by rand() limit 5;

# can you show the info of the table 
describe `online-retail`;

# can you show the how many total Country is avl and how many record in ascending order;
select distinct Country , count(Country) as total_county from `online-retail`  group by Country order by count(Country) asc  ;

# show the table
select * from `online-retail`;


-- ------------------------ Day 05 ------ H-W completed -------------------------------
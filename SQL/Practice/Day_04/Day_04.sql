create database if not exists sales;

use sales;
CREATE TABLE sales (
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
select * from sales;

set session sql_mode= '';

load data infile "D:/sqll/sql practice/End-to-End-Data-Analysis-Projects/SQL/Practice/Day_04/sales_data_final.csv"
into table sales
fields Terminated by ","
Enclosed by '"'
lines terminated by '\n'
Ignore 1 rows;

select * from sales;

select count(*)  as total_record from sales;
SELECT 
    STR_TO_DATE(REPLACE(order_date, '-', '/'), '%m/%d/%Y') AS final_date 
FROM sales;

alter table sales
add column order_date_new date
after order_date;

set sql_safe_updates=0;

update sales
set order_date_new=str_to_date(replace(order_date,'-','/'),'%m/%d/%Y');

select * from sales;


alter table sales add column ship_date_new date after
ship_date;

update sales
set ship_date_new=str_to_date(replace(ship_date,'-','/'),'%m/%d/%Y');

select * from sales;

select * from sales where ship_date_new='2011-01-05';
select * from sales where ship_date_new>'2011-01-05';
select * from sales where ship_date_new<'2011-01-05';

-- Fetch records where ship date is after '2011-01-05'
SELECT * FROM sales WHERE ship_date_new > '2011-01-05'
LIMIT 0, 2000;

-- Count records where ship date is after '2011-01-05'
SELECT COUNT(*) AS record_count FROM sales WHERE ship_date_new > '2011-01-05';
-- Fetch records where ship date is before '2011-01-05'
SELECT * FROM sales WHERE ship_date_new < '2011-01-05'
LIMIT 0, 2000;

-- Fetch records where ship date is between May 1, 2011 and August 30, 2011
SELECT * FROM sales WHERE ship_date_new BETWEEN '2011-05-01' AND '2011-08-30'
LIMIT 0, 2000;

-- Get current date and time
SELECT NOW();

-- Get current time only
SELECT CURTIME();

-- Get current date only
SELECT CURDATE();
-- OR
SELECT CURRENT_DATE();

-- Get current timestamp
SELECT CURRENT_TIMESTAMP();

-- Get current logged-in user
SELECT CURRENT_USER();

-- Get date and time 1 week ago from now
SELECT DATE_SUB(NOW(), INTERVAL 1 WEEK) AS last_week_datetime;

-- Get date and time 3 days ago from now
SELECT DATE_SUB(NOW(), INTERVAL 3 DAY) AS before_3_days;

-- Get date and time 100 days ago from now
SELECT DATE_SUB(NOW(), INTERVAL 100 DAY) AS before_100_days;

-- Get date and time 10 years ago from now
SELECT DATE_SUB(NOW(), INTERVAL 10 YEAR) AS before_10_years;

-- Get date and time 12 years ago from now
SELECT DATE_SUB(NOW(), INTERVAL 12 YEAR) AS before_12_years;

-- Extract year from current date
SELECT YEAR(NOW());

-- Extract month from current date
SELECT MONTH(NOW());

-- Extract time from current datetime
SELECT TIME(NOW());

-- Get day name of current date (e.g., Monday, Tuesday)
SELECT DAYNAME(NOW());

-- Get day name for a specific past date
SELECT DAYNAME('2003-03-15 15:29:04') AS past_day;

-- Get day name for a specific future date
SELECT DAYNAME('2028-12-02 15:29:04') AS future_day;

-- Fetch records where ship date is older than 1 week from current date
SELECT * FROM sales WHERE ship_date_new < DATE_SUB(NOW(), INTERVAL 1 WEEK)
LIMIT 0, 2000;

-- Count records where ship date is older than 1 week
SELECT COUNT(*) FROM sales WHERE ship_date_new < DATE_SUB(NOW(), INTERVAL 1 WEEK);


ALTER TABLE sales ADD COLUMN flag DATE AFTER order_id;
SET SQL_SAFE_UPDATES = 0;

-- Update all rows in 'flag' column with current timestamp
UPDATE sales SET flag = NOW();

-- Re-enable safe update mode (recommended for safety)
SET SQL_SAFE_UPDATES = 1;

select * from sales;

-- Correct way to update date column with current date only
UPDATE sales SET flag = CURDATE();

-- Disable strict SQL mode to allow data type conversions with warnings instead of errors
SET SESSION sql_mode = ''; 

-- Modify 'year' column to DATETIME type (requires sql_mode disabled if data exists)
ALTER TABLE sales MODIFY COLUMN year YEAR;
UPDATE sales SET year = YEAR(order_date_new);

select * from sales;


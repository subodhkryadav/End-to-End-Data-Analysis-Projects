-- - -------------- Day-11-----------focus-on-the-Partition ------------------------------------------ 

-- Create New databases to perform the Partitioning operation
create database if not exists Ineuron_partition;

-- Now use to this database to perform some of the operation 
use Ineuron_partition;

-- Creat table for perform the Partition
Create table if not exists Ineuron_course(
	course_name varchar(50),
    course_id int(10),
    course_title varchar(50),
    course_desc varchar(60),
    launch_date date,
    course_fee int,
    course_mentor varchar(60),
    course_launch_year int
);
-- Now see the structure of the table
select * from ineuron_course;

-- insert the data into the Ineuron_course table
insert into Ineuron_course values
	("Machine-Learning",101,'ML',"This is Ml course",'2019-07-07',3400,"sudhanshu",2019);

-- Now see the first record of the table
select * from Ineuron_course;

-- Now insert the more couple of thing
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

-- See the record
select * from Ineuron_course;

-- Can you try to fectch the for a course which was launch in year 2019
select * from Ineuron_course where course_launch_year=2019;

-- In this query we are try to check the entire record if course_launch_year == 2019 :
	-- then it should accept
		-- other wise it will be descarded

-- if i use to create one table that not loking into the entire table it looking into the specific record directly

-- SO try to bydefault based on year_launch_date in a table
-- use to partitioning
Create table if not exists Ineuron_course_1(
	course_name varchar(60),
    course_id int(10),
    course_title varchar(60),
    course_desc varchar(60),
    course_date date,
    course_fee int,
    course_mentor varchar(60),
    course_launch_year int)
    partition by range (course_launch_year) (
    partition P0 values less than (2019),
    partition p1 values less than (2020),
    partition p2 values less than (2021),
    partition p3 values less than (2022),
    partition p4 values less than (2023)
);
    
-- Now see the table structure
select * from Ineuron_course_1;
    
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
-- Now see the record
select * from Ineuron_course_1;

-- Now again try to fetch the data which course_launch_year is 2020 

-- 1. i use without use partition table
select * from Ineuron_course where course_launch_year=2020;

	-- It take Execution time = 0:00:0 00065900
    -- it take lock wait time=0:00:0 00000700

-- 2. I use with the partition used table
select * from Ineuron_course_1 where course_launch_year=2020; 
	-- when i use the Partition used table to feath the record 
		-- It take Execution time = 0:00:0 00053330
		-- it take lock wait time=0:00:0 00000700
        
-- Means partition is reduce the time of execution if i used that dataset that contain the large amount of data then it show clear difference


-- How to check what kind of partition is used on the table and all information about the partition in the table
select partition_name,table_name,table_rows 
from Information_schema.partitions where table_name="Ineuron_course_1"; 

-- Now create another partition using the range 
CREATE TABLE IF NOT EXISTS ineuron_course_2 (
    course_name VARCHAR(40),
    course_id INT,
    course_title VARCHAR(40),
    course_desc VARCHAR(50),
    course_date DATE,
    course_fee INT,
    course_mentor VARCHAR(50),
    course_launch_year INT
) 
PARTITION BY RANGE columns(course_date) (
    PARTITION P0 VALUES LESS THAN ('2019-07-07'),
    PARTITION P1 VALUES LESS THAN ('2020-07-07'),
    PARTITION P2 VALUES LESS THAN ('2021-07-07'),
    PARTITION P3 VALUES LESS THAN ('2022-07-07'),
    PARTITION P4 VALUES LESS THAN ('2023-07-07')
);
-- without converting date to int using range-column that create the partion

-- Now insert the data
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
-- Now see the result
select * from Ineuron_course_2;

-- now fetch the record where the course launch date is '2022-07-07'
-- without use partiontion
select * from Ineuron_course where launch_date='2022-07-07';
 -- it take time to execute is: 106330
 
-- use another partioning here not use course_date column in partitin used in launc year
select * from Ineuron_course_1 where course_date='2022-07-07';
	-- it take time to execute is: 97270

-- use another partioning use in partitioning in course_date column
select * from Ineuron_course_2 where course_date='2022-07-07';
	-- it take time to execute is: 98790


# Now use to another Partition 
	-- Use to Hash partition
    
CREATE TABLE IF NOT EXISTS ineuron_course_3 (
    course_name VARCHAR(40),
    course_id INT,
    course_title VARCHAR(40),
    course_desc VARCHAR(50),
    course_date DATE,
    course_fee INT,
    course_mentor VARCHAR(50),
    course_launch_year INT
) 
partition by hash (course_launch_year)
	partitions  5;
-- see the table structure
select * from Ineuron_course_3;

-- Now see the all information ineuron_course_3 table of partitions
select partition_name,table_name,table_rows from 
information_schema.partitions where table_name="Ineuron_course_3";

-- it give me one table that bydefault contation the partition values like
	-- p0 to p4 because i want go 5 partition 
		-- without inserting the data 

-- if i want to 10 partition on the course_launch_year 
create table if not exists Ineuron_course_4(
	course_name varchar(40),
    course_id int,
    course_title varchar(40),
    course_desc varchar(40),
    course_date date ,
    course_fee  int,
    course_mentor_name varchar(40),
    course_launch_year int
)
partition by Hash (course_launch_year)
	partitions 10;
-- Now see the information
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="ineuron_course_4";
-- it has create the 10 partition p0 to p9 

-- problem is that i have only 5 year of data available but i create 10 partion 
	-- then how it will be divide the data ,which data comes into this partition or that partition
-- first insert the data into this table
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

-- now see the record
select * from Ineuron_course_4;

-- Now check the which partition take how many record
select partition_name,table_name,table_rows from
information_schema.partitions  where table_name="Ineuron_course_4";

-- the results shows p0=4
			--       p1=3
			--       p2=4
			--  (p3-p8)=0
			-- 	     p9=4
            
-- so the final answer is how chose which partition will take
	-- total_record = 10 
		-- based on year =2019,2020,2021,2022,2023 what ever
			-- take any one  year and diveide 10 and look into the reminder
				-- if reminder= 0 then go to the p0
				-- if reminder= 1 then go to the p1
                -- if reminder= 5 then go to the p5
                -- if reminder =9 then go to the p9 
		-- this is the method hash partition chose to which partition will take 

# Now going to another partition that name is : Key_partition
-- create the table
create table if not exists Ineuron_course_5(
	course_name varchar(40),
    course_id int primary key,
    course_title varchar(40),
    course_desc varchar(45),
    launch_date date,
    course_fee int,
    course_mentor varchar(50),
    course_launch_year int
)
partition by key()
partitions 10;
-- see the table sturcture
select * from ineuron_course_5;

-- now see the partition information
select partition_name,table_name,table_rows
from information_schema.partitions where table_name="Ineuron_course_5";

-- Now insert some short of the data into this column
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

-- now check the table infromation
select * from ineuron_course_5;

-- now see the partition information
select partition_name,table_name,table_rows
from information_schema.partitions where table_name="Ineuron_course_5";

-- it give me total 10 parttion but in this time it take the other- other partition 
	-- p1=3
    -- p6=4
    -- p8 =4
    -- p9 =4
    -- other is 0

-- so in this time how to chose the which partiton will take 
--
	-- So here use the MD5 algorithms 
		-- it take the input and generate the Hashing values or Encrypted hased valued
	-- on this hashing value perform some sort of the partition 
	-- example
    select md5("subodh") ; -- it give me '2ad4389aaf0ae0ed18a7eb5b759e1167'
    select md5(101); -- it  '38b3eff8baf56627478ec76a704e9b52'
-- based on this encrypted data partition will do the partitioning


# Now another partitioning: List Partitioning
-- now create the another table
create table if not exists Ineuron_course_6(
	course_name varchar(40),
    course_id int ,
    course_title varchar(40),
    course_desc varchar(45),
    launch_date date,
    course_fee int,
    course_mentor varchar(50),
    course_launch_year int
)
partition by list(course_launch_year)(
	partition p0 values in (2019,2020),
    partition p1 values in (2022,2021)
);

-- see the table sturcture
select * from ineuron_course_6;

-- Now see the partition information
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="Ineuron_course_6";

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

-- see the talble structure
select count(*) from Ineuron_course_6;
-- create a procedure to perform show the record 
Delimiter && 
create procedure record()
begin 
	select * from Ineuron_course_6;
end &&
Delimiter ;

-- call the procedure
call record();

-- Now see the partion table to how the data will be alloted
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="Ineuron_course_6";

-- it give the total 2 partition and take the p0=8 and p1=7 
	-- it use to the range method to insert the record into the Partitin records;

-- Now i use the another partition method
# Range column
-- create table
create table if not exists Ineuron_course_7(
	course_name varchar(39),
    course_id int, 
    course_title varchar(30),
    course_desc varchar(40),
    course_date date,
    course_fee int,
    course_mentor varchar(40),
    course_launch_year int
)
partition by Range columns(course_name,course_id,course_launch_year)(
	partition p0 values less than ('aiops',101,2019),
    partition p1 values less than ('big data',102,2020),
    partition p2 values less than ('data analytics',104,2021),
    partition p3 values less than ('fsda',111,2022)
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
    
    -- it will give me the error then i used to --
    -- "Error:  Table has no partition for value from column_list "
		-- means some of the partition that i give that not fall under the column
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
    	-- so use the ignore
-- now see the record
select * from ineuron_course_7;
-- see the information of the partition
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="Ineuron_course_7";

-- Now use to another partition method
# list columns
-- create table
create table if not exists Ineuron_course_9(
	course_name varchar(30),
    course_id int,
    course_title varchar(30),
    course_desc varchar(30),
    course_data date,
    course_fee int,
    course_mentor varchar(4),
    course_launch_year varchar(40)
)
partition by  list columns(course_name)(
	partition p0 values in ('dlcvnlp','aws cloud''big data''fsds'),
    partition p1 values in ('Machine-Learning','Dl','MERN'),
    partition p2 values in ('java','fabe','data analytics'),
    partition p3 values in ('RL','interview prep')
); 

-- check the table sturcture
select * from ineuron_course_9;

-- now get the information of the table
select partition_name,table_name,table_rows from
information_schema.partitions where table_name="Ineuron_course_9";
-- In this partion always check the string comperation then insert into the partion

-- now insert some sort of the data into this table ineuron_course-9
	insert ignore into Ineuron_course_9 values
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
-- now see the record of this table
select * from Ineuron_course_9;
-- check the how many record are available inthis record 
select count(*) from Ineuron_course_9;

-- check partition structure of the ineuron_course_9 table
select partition_name, table_name,table_rows from
information_schema.partitions where table_name="ineuron_course_9";

-- here no string comeration check , here  list of the column will be inserted to the partion table 
-- now serarch the one "course_name" from the this table
select * from ineuron_course_9 where course_name="fabe";
 
 -- means of that list column is :- 
	-- list take only and only intertype of the date
    -- list columns take the both interger as well categorical data as well
    
-- Now use to the another partition call "SubPartitioning"
	-- partition inside partition
-- create one table that is used to the perform this subpartitioning
create table if not exists Ineuron_course_10(
	course_name varchar(40),
    course_id int,
    course_title varchar(30),
    course_desc varchar(30),
    course_date date,
    course_fee int,
    course_mentor varchar(40),
    course_launch_year int
)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
	partition p0 values less than (2019),
    partition p1 values less than (2020),
    partition p2 values less than (2021),
    partition p3 values less than (2022)
);

-- now see the table strucute
select * from Ineuron_course_10;

-- see the table partition information
select partition_name,table_name,table_rows from 
information_schema.partitions where table_name="Ineuron_course_10";

-- now insert some sort of the data into this table ineuron_course-10
	insert ignore into Ineuron_course_10 values
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

-- total 11 rows inserted because some of the partion are not allowed to it 
-- check the record 
select * from ineuron_course_10;

-- check the partition information
select partition_name, table_name, table_rows from 
information_schema.partitions where table_name="Ineuron_course_10";
-- it show the total number of partition just like :
	-- firstly  partition in the p0,p1,p2,p3 then 
		-- it divided into the 
			-- p0 five time
			-- p1 five time
            -- p2 five time
            -- p3 five time
-- firstly the partition will execute that p0 to p3 then
	-- supartition will execute it divide the data into all partition are available divide into 5 gimes

-- ---------------------------------- Day- 11 -- partitioning --- -------- Done-----------------------------------------------------------    
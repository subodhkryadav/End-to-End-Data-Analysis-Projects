-- ----------------------------Day-18 ---------------------------

-- -------------Today focus on the Pivoting-------------------------

-- create one database to perform the pivot operation
create database if not exists pivot;

-- use this database to perform some sort of the operation
use pivot;

-- now create table on the current database to perform the opeation of pivot
create table if not exists order_table(
	order_id int,
    employed_id int,
    vendor_id int
);

-- Now insert some sort of the record in this table
insert into order_table values (
	1, 258, 1580),
	(2, 254, 1496),
	(3, 257, 1494),
	(4, 261, 1650),
	(5, 251, 1654),
	(6, 253, 1664	
);

-- see the table structure
select * from order_table;

-- now convert into pivot
select order_id,
if(employed_id=258,vendor_id,Null) as "258",
if(employed_id=254,vendor_id,Null) as "254",
if(employed_id=257,vendor_id,Null) as "257",
if(employed_id=261,vendor_id,Null) as "261",
if(employed_id=251,vendor_id,Null) as "251",
if(employed_id=253,vendor_id,Null) as "251"
from order_table;

-- lets another one example
	-- create on table for perfom the pivot
create table if not exists students(
	student_name varchar(49),
    student_course varchar(40),
    student_marks int
);

-- now fill some sort of the data into this table
insert into students values
	("subodh","fsda",99),
    ("sonu","fsds",44),
    ("mohan","big_data",55),
    ("mohit","machine_learning",45),
    ("subodh","fsds",33),
    ("mohit","deep_learing",98),
    ("bikash","java full stack",40),
    ("madhav","data science",90),
    ("sonu","machine_learning",33);

-- see the record 
select * from students;

-- Now peroform the pivot on this table
select student_name,
if(student_course="fsda",student_marks,null) as "fsda",
if(student_course="fsds",student_marks,null) as "fsds",
if(student_course="big_data",student_marks,null) as "big_data",
if(student_course="machine_learning",student_marks,null) as "machine_learning",
if(student_course="java full stack",student_marks,null) as "deep_learing",
if(student_course="data science",student_marks,null) as "data science"
from students
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
max(if(student_course="fsda",student_marks,null)) as "fsda",
max(if(student_course="fsds",student_marks,null)) as "fsds",
max(if(student_course="big_data",student_marks,null)) as "big_data",
max(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
max(if(student_course="java full stack",student_marks,null)) as "deep_learing",
max(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;

-- now see the result using the min function
select student_name,
min(if(student_course="fsda",student_marks,null)) as "fsda",
min(if(student_course="fsds",student_marks,null)) as "fsds",
min(if(student_course="big_data",student_marks,null)) as "big_data",
min(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
min(if(student_course="java full stack",student_marks,null)) as "deep_learing",
min(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;


-- the min and max will give me the same record then what is the difference 
-- now see the first record of the student table
select * from students limit 1;
	-- subodh	fsda	99
-- insert one another record that is the same name smae course but marks is different
insert into students values ("subodh","fsda",100);

-- now again run the max function using pivot
select student_name,
max(if(student_course="fsda",student_marks,null)) as "fsda",
max(if(student_course="fsds",student_marks,null)) as "fsds",
max(if(student_course="big_data",student_marks,null)) as "big_data",
max(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
max(if(student_course="java full stack",student_marks,null)) as "deep_learing",
max(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;

	-- it give met these type of first record
		-- subodh	100	33	-- means it take the max marks
        
-- now again run the min function using pivot
select student_name,
min(if(student_course="fsda",student_marks,null)) as "fsda",
min(if(student_course="fsds",student_marks,null)) as "fsds",
min(if(student_course="big_data",student_marks,null)) as "big_data",
min(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
min(if(student_course="java full stack",student_marks,null)) as "deep_learing",
min(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;
-- it give met these type of first record
		-- subodh	99	33	-- means it take the minimum marks

-- same like perform the avg
select student_name,
avg(if(student_course="fsda",student_marks,null)) as "fsda",
avg(if(student_course="fsds",student_marks,null)) as "fsds",
avg(if(student_course="big_data",student_marks,null)) as "big_data",
avg(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
avg(if(student_course="java full stack",student_marks,null)) as "deep_learing",
avg(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;

-- it give met these type of first record
		-- 'subodh', '99.5000', '33.0000', NULL, NULL, NULL, NULL
	-- means it take the average of both 100 and 99

-- use to the sum function
select student_name,
sum(if(student_course="fsda",student_marks,null)) as "fsda",
sum(if(student_course="fsds",student_marks,null)) as "fsds",
sum(if(student_course="big_data",student_marks,null)) as "big_data",
sum(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
sum(if(student_course="java full stack",student_marks,null)) as "deep_learing",
sum(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;

-- it give met these type of first record
	-- 'subodh', '199', '33', NULL, NULL, NULL, NULL
		-- -- means it take the total addition of both 100 and 99

-- now use to the count
select student_name,
count(if(student_course="fsda",student_marks,null)) as "fsda",
count(if(student_course="fsds",student_marks,null)) as "fsds",
count(if(student_course="big_data",student_marks,null)) as "big_data",
count(if(student_course="machine_learning",student_marks,null)) as "machine_learning",
count(if(student_course="java full stack",student_marks,null)) as "deep_learing",
count(if(student_course="data science",student_marks,null)) as "data science"
from students
group by student_name;

-- now this time see the crazy record
-- subodh	2	1	0	0	0	0
-- sonu	0	1	0	1	0	0   0
-- mohan	0	0	1	0	0	0
-- mohit	0	0	0	1	0	0
-- bikash	0	0	0	0	1	0
-- madhav	0	0	0	0	0	1

-- Now this time it take the count of the marks 
	-- the first row take the two(100,99) marks for single cols
		-- so it return the 2

-- one another ex to see the today marks
-- Ek hi row mein student ka naam, in a single row show the sutdent name,
-- total-marks and also each subject particular marks

SELECT 
    student_name,
    SUM(student_marks) AS "Total_Marks", -- Sabhi subjects ka total
    MAX(IF(student_course = 'fsda', student_marks, 0)) AS "FSDA",
    MAX(IF(student_course = 'fsds', student_marks, 0)) AS "FSDS",
    MAX(IF(student_course = 'big_data', student_marks, 0)) AS "Big_Data",
    MAX(IF(student_course = 'machine_learning', student_marks, 0)) AS "ML"
from students
group by student_name
order by Total_Marks desc; --  top student upper shown

        
-- -----------------------------Day -- 18 done -------Pivot-------------------


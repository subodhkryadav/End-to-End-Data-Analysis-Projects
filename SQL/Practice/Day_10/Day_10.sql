-- ----------------- Day-09--------------------------------------
-- Today focus on the window function

-- So create one database 
create database if not exists win_fun;

-- Now use this database for some of the operation
use win_fun;

-- Create table for this database
create table if not exists Ineuron_student(
	student_id int,
    student_batch varchar(40),
    student_name varchar(40),
    student_stream varchar(30),
    student_marks int ,
	student_mail_id varchar(40)
);
-- Now insert some of the data into this Ineuron_student table
INSERT INTO Ineuron_student (student_id, student_batch, student_name, student_stream, student_marks, student_mail_id) VALUES
(100, 'fsda', 'Saurabh', 'CS', 80, 'saurabh@gmail.com'),
(102, 'fsda', 'Subodh', 'CS', 99, 'subodh@gmail.com'),
(103, 'fsds', 'Ankit', 'IT', 85, 'ankit@gmail.com'),
(104, 'fsde', 'Priya', 'ECE', 92, 'priya@gmail.com'),
(105, 'fsbc', 'Rahul', 'ME', 78, 'rahul@gmail.com'),
(106, 'fsda', 'Amit', 'CS', 88, 'amit@gmail.com'),
(107, 'fsds', 'Sneha', 'IT', 95, 'sneha@gmail.com'),
(108, 'fsde', 'Vikash', 'EE', 76, 'vikash@gmail.com'),
(109, 'fsbc', 'Neha', 'CS', 82, 'neha@gmail.com'),
(110, 'fsda', 'Rohan', 'IT', 91, 'rohan@gmail.com'),
(111, 'fsds', 'Kavita', 'ECE', 84, 'kavita@gmail.com'),
(112, 'fsde', 'Abhishek', 'ME', 79, 'abhishek@gmail.com'),
(113, 'fsbc', 'Jyoti', 'CS', 87, 'jyoti@gmail.com'),
(114, 'fsda', 'Deepak', 'EE', 73, 'deepak@gmail.com'),
(115, 'fsds', 'Simran', 'IT', 90, 'simran@gmail.com'),
(116, 'fsde', 'Manoj', 'CS', 81, 'manoj@gmail.com'),
(117, 'fsbc', 'Pooja', 'ECE', 94, 'pooja@gmail.com'),
(118, 'fsda', 'Rakesh', 'ME', 77, 'rakesh@gmail.com'),
(119, 'fsds', 'Sonia', 'EE', 83, 'sonia@gmail.com'),
(120, 'fsde', 'Varun', 'CS', 89, 'varun@gmail.com');

-- see the record 
select * from ineuron_student;

select student_batch,count(*) from Ineuron_student group by student_batch;

-- Now start to the windowing function
-- 1. firstly use the Aggregation windowing function

-- can you try to give the sum of the student_marks from the peaticular student_batch group
set global max_allowed_packet=19922944;
select student_batch ,sum(student_marks) as total_marks from Ineuron_student group by Student_batch;

-- can you try to show the minimum marks of the student from the particular student_batches group
select student_batch,min(student_marks) as minimum_marks from Ineuron_student group by student_batch;

-- can you try to show the maximum marks of the student from the particular student_batches group 
select student_batch,max(student_marks) as maximum_marks from Ineuron_student group by student_batch;

-- can you try to show the average marks of the students_bathes from the Ineuron_student table
select student_batch,avg(student_marks) as average_marks from Ineuron_student group by student_batch;

-- can you tyr to find the how many record are available or prensent in the particular student_batch 
select student_batch,count(student_batch) as total_record from Ineuron_student group by student_batch;

-- can you try to show the how much stream are available in the Ineuron_student table
select student_stream ,count(student_stream) as total_record from ineuron_student group by Student_stream;

-- can you try to find the minimum marks score of the particular stream 
select student_stream , min(Student_marks) as total_marks from Ineuron_student group by student_stream;

-- can you tyr to find the maximum marks score of the particular stream
select student_stream, max(student_marks) as maximum_marks from ineuron_student group by student_stream;

-- can you try to find the average_marks of the particular stream
select student_stream, avg(student_marks) as average_marks from ineuron_student group by student_stream;

-- show the table
select * from ineuron_student;

-- who has receive the highest mark in the fsda batch
select max(student_marks) from ineuron_student where student_batch="fsda"; -- not correct

-- who has receive the highest mark in the fsda batch
select student_name,student_marks from Ineuron_student where 
	student_marks= (select max(student_marks) from ineuron_student where student_batch="fsda"); 
    
-- -- who has receive the 2nd highest mark in the fsda batch 
select student_name,student_marks from ineuron_student 
where student_batch="fsda" order by student_marks desc limit 1,1;

-- this will also work
select student_name,student_marks from ineuron_student
where student_batch="fsda" order by student_marks desc limit 1 offset 1;

-- show the record student_name and student_marks of the fsda batch students
select student_name,student_marks from ineuron_student where student_batch="fsda" order by student_marks desc;

-- try to shwo me the who is the 5th highest mark obtain in the fsda batch
select student_name , student_marks from ineuron_student where student_batch="fsda" order by student_marks
desc limit 4,1;
-- that's meaning is limt 4,1 
	-- 4. is the offset that means i skit that record and 1 is show the record 
		-- means first 4 record skip and after that 1 record is show
        
-- Now another example of the same method
select student_name,student_marks from ineuron_student where 
student_batch="fsda" order by student_marks desc limit 1,2;-- one skip and then print 2 record


-- In the privious we use bydefault approach Now we use the windowing analytical function

-- If one column contain 3 rd Highest marks in the n student then how to show the record in the 3rd highest position in the fsda batch
select student_name,student_marks from ineuron_student where student_batch="fsda" order by
	student_marks desc limit 2,3; -- 3rd hightest marks if same marks in 3 different different students get
    
-- Use to the Windowing function
select student_id,student_name,student_batch,student_stream,student_marks,row_number()
	over(order by student_marks) as "row_number" from Ineuron_student;
-- Now i treat the entire table as window

-- now create the batch wise row_number
select student_id,student_name,student_batch,student_stream,student_marks ,
row_number() over(partition by student_batch order by student_marks) as "row_id" from Ineuron_student;
-- in this we obtain the each student_batch each record have a row_id starting from 1
-- so i can say it creat multiple window this time

-- can you try to give me the record where i can see the every batch topper student without use the rank_number
select student_name,student_marks ,student_batch
from  Ineuron_student 
where (student_batch, student_marks) in (
    select  student_batch, max(student_marks) 
    from Ineuron_student 
    group by student_batch
);

-- Now use to the window -rank_number function try to find the name of the student that get the 
		-- minimum marks in each batch
select * from (select student_id,student_name,student_batch,student_marks,
row_number() over (partition by student_batch order by student_marks) as 
"row_number" from Ineuron_student)as test where `row_number`=1;

-- Can you try to show me those record of students name and its marks
	-- that student got the highest marks in an own batches
select * from(select student_id,student_name, student_batch,student_marks,
row_number() over(partition by student_batch order by student_marks desc) 
as "row_number" from ineuron_student ) as `test` where `row_number`=1;

-- now try to one thing 
insert into Ineuron_student values
	(121, 'fsbc', 'punam', 'ECE', 94, 'pooja@gmail.com'),
	(122, 'fsda', 'diraj', 'CS', 99, 'subodh@gmail.com'),
    (123, 'fsde', 'rina', 'ECE', 92, 'priya@gmail.com'),
    (124, 'fsds', 'anu', 'IT', 95, 'sneha@gmail.com');
-- Now find the those record of student name and its marks that 
	-- got the highest marks in the own batches
select * from(select student_id,student_name, student_batch,student_marks,
row_number() over(partition by student_batch order by student_marks desc) 
as "row_number" from ineuron_student ) as `test` where `row_number`=1;

-- Now this time this will not work
		-- because more than one student got the maximum marks in each batches
			-- above query got the result only one person that got the maximum marks

-- use to the Rank() function
select student_id,student_name,student_batch,student_marks,
Rank() over(order by student_marks desc) as "row_rank" from Ineuron_student;
-- the Rank function give me the Rank of the each record 
	-- In the table there are some of the Highest marks is twoice then its ranking will be same 
    -- and go to the next of the rank will automatically increse just like first two have have index 1,1 then third one is 3
    
-- Now see this example the rank will be clear
select student_id,student_name,student_batch,student_marks ,
row_number() over(order by student_marks desc) as "row_number" ,
rank() over(order by student_marks desc) as "row_rank" from Ineuron_student ;

-- based on student batch rank the Ineuron_student table in the mark is descending order
select * , row_number() over (partition by student_batch order by student_marks desc)
	as "row_number",
	rank() over (partition by student_batch order by student_marks desc) as "row_rank"
	from Ineuron_student; 

-- so My privious proble is 
	-- can you show me those student name and its marks that got top on the own batch
select student_id,student_name,student_batch,student_marks from (select * ,rank() over(partition by student_batch order by student_marks desc)
as "rank_row" from ineuron_student) as test where rank_row=1;
					-- or
select * from (select student_id,student_name,student_batch,student_marks,
	row_number() over(partition by student_batch order by student_marks desc) as "row_number",
    rank() over (partition by student_batch order by student_marks desc )
    as "rank" from Ineuron_student ) as test where `rank`=1;

-- 
-- 
    
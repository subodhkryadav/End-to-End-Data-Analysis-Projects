-- --------------------------------- Day- 12 ------------------------------------------------
-- Today focus on the ->

-- |--> Union
-- |--> Cte (tommorow)
-- Now perform  some of the topic used to database so crate the tatabase
create database if not exists Operation;

-- used to this database to next all of the execution 
use Operation;

-- create the table 
create table if not exists course(
	course_id int,
    course_name varchar(30),
    course_desct varchar(40), -- course desctriction
    course_tag varchar(40)
);

-- create another table student
create table if not exists  Student(
	student_id int ,
    student_name varchar(40),
	student_mobile varchar(40),
    student_course_enroll varchar(60),
    student_course_id int
);

-- now insert into some of the data into the course
insert into course values(
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
    (107,"plc","automation","plc")
);
    
-- Now see the record of the course table
select * from course ;

-- now same as student table
insert into student values(
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
    (302,"vishal",78945561,"NO",101)
);

-- Now see the table record 
select * from student;

-- Union operation

-- see the student table data
select * from student;
-- see the course table data
select * from course;

-- now perform the Union operation
select course_id,course_name from course
union
select student_id,student_name from student;

-- It store the data in the vartical format and in case join store the data into the Horizontally 

-- now take another example
select course_id,course_name,course_desc from course
union 
select student_id,student_name from student;
-- it raise error because no of column count must be same in each select statement just like above example

-- If data type is different but still i combine the data from single table in the vartically format
select student_id,student_name from student
union
select course_name, course_id from course;

-- create another table
create table if not exists library(
	library_id int,
    libraryan_name varchar(20),
    library_books_name varchar(40)
);

-- insert some of the data
insert into library values
	(1,"rajaram","math"),
    (2,"rohit","science"),
    (3,"mukundar","sst");

-- can i use the 2 union opeation in a single query
(select student_id, student_name from student
union 
select course_name, course_id from course)
union 
select library_id,libraryan_name from library; 

-- union remove the duplicate record as well
	-- if i show the all record with add on duplicassy as weel then i use the union all opeation
-- first insert some of the duplicate element
insert into library values
	(1,"rajaram","math"),
    (2,"rohit","science"),
    (3,"mukundar","sst");
    
insert into course_1 values
	(101,"fsda","full stack data analyst","analytics"),
    (102,"fdsa","full stack data Science","analytics"),
    (103,"big_data","full stack big data","bD"); 

insert into student values
	(301,"subodh",970795935,"yes",101),
    (302,"sonu",970795935,"yes",103),
    (303,"sanju",456155,"NO",102),
    (302,"monu",4566,"yes",101);
    
-- firstly count all the table how much records
select count(*) from student;-- 17
select count(*) from library; -- 6
select count(*) from course; -- 12

-- means total record if i combilen in all the table 35
SELECT COUNT(*) FROM (
    SELECT student_id, student_name FROM student
    UNION
    SELECT course_id, course_name FROM course
    UNION 
    SELECT library_id, libraryan_name FROM library
) AS combined_data;
-- it show the total 27 record 
-- but i have total 35 record -- means it delete the duplicate record bydefault

-- if i show the duplicate element as well then i use to union all operation

select student_id, student_name from student
union all
select course_id, course_name from course
union all 
select library_id, libraryan_name from library;

-- now i check the total count
select count(*) as combine_data from (
	select student_id, student_name from student
	union all
	select course_id, course_name from course
	union all 
	select library_id, libraryan_name from library
)as combined_data;
-- total 35


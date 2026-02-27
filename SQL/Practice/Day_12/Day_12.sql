-- --------------------------------- Day- 12 ------------------------------------------------
-- Today focus on the ->
-- |--> join
-- |--> Indexing
-- |--> Union
-- |--> Class
-- |--> CTE

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

 -- Join
-- 1. Inner Join
select c.course_id,c.course_name,c.course_desct ,s.student_id,s.student_name,s.student_course_id
from course c 
inner join student s
on c.course_id=s.student_course_id;

-- Inner join says that the common of both the table based on the condition show it record

-- list of students along with its full details course title that they are enroll of any courses
select s.student_name,c.course_desct
from course c
inner join student s
on c.course_id=s.student_course_id
where s.student_course_enroll="yes";

select s.student_name, c.course_desct
from course c
left join  student s
on s.student_course_id = c.course_id
where s.student_course_enroll = "yes";

-- try to find out those course recrd who have enroll at least one student
select c.course_id,c.course_name,s.student_name
from course c
inner join student s
on c.course_id=s.student_course_id;
-- 


-- 2. left join
select c.course_id,course_name,c.course_desct ,s.student_id,s.student_name,s.student_course_id
from course c 
left join student s
on c.course_id=s.student_course_id;

-- or
select * from course
left join student
on course.course_id=student.student_course_id;

-- can you find those course which has not enroll nayone
select c.course_id,c.course_name,c.course_desct ,s.student_id,s.student_name,s.student_course_id
from course c 
left join student s
on c.course_id= s.student_course_id 
where s.student_course_id is null;

-- Right join
select c.course_id,c.course_name,c.course_desct,s.student_id,s.student_name,s.student_course_id
from course c
Right join student s
on c.course_id=s.student_course_id ;

-- now see 
insert into student values
	(301,"subodh",970795935,"yes",122);
-- now right join
select c.course_id,c.course_name,c.course_desct,s.student_id,s.student_name,s.student_course_id
from course c
Right join student s
on c.course_id=s.student_course_id ;
-- ( '301', 'subodh', '122') this student not enroll any corses

-- how to find the manually which student are not enroll any courses
select c.course_id,c.course_name,c.course_desct,s.student_id,s.student_name,s.student_course_id
from course c 
Right join student s on
c.course_id= s.student_course_id
where course_id is null;



-- Indexing
-- show the information about the indexing from the course table
show indexes from course;

-- create a table to perform the indexing operation
create table if not exists course_1(
	course_id int ,
    course_name varchar(30),
    coruse_desc varchar(30),
    coruse_tag varchar(30),
    index(course_id) -- index apply on the course_id column
);

-- Now show the indexes from the course_1 table
show indexes from course_1;

-- Now fill the table some sort of the data
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

-- Now again show the table format
show indexes from course_1; 

-- create tow column as index
create table if not exists course_2(
	course_id int ,
    course_name varchar(30),
    course_desc varchar(30),
    course_tag varchar(30),
    index(course_id,course_name)
);
-- show the indexes from the course_2 table
show indexes from course_2;

-- explain course_1
explain select * from course_1;

-- analyze the table
analyze table course_1;

-- Now see the some of the execution plan in the indexing table
SELECT * FROM course_1 WHERE course_id=106;


-- Now Unique indexes
create table if not exists course_3(
	course_id int,
    course_name varchar(40),
    course_desc varchar(40),
    course_tag varchar(40),
    unique index(course_desc)
);
-- now show the uniques indexes
show index from course_3;




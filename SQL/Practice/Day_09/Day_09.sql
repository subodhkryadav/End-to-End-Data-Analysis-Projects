-- ------------------- Day_09 ------------------------------------------
# Focu on :-
	-- 1. Primary key
	-- 2. Foreigh Key

-- Create a new_database
Create database if not exists Ineuron;

-- Use this database for future working 
use Ineuron;

-- Create table 
Create table Ineuron(
	course_id int Not Null,
    course_name varchar(40),
    course_status varchar(50),
	number_of_enro int,
    primary key(course_id));
    
-- insert the data
insert into ineuron  values(01,"Fsda","Active",1000);

insert into ineuron values(01,"Fsds","NOt active", 10000);

insert into ineuron values(02,"Fsds","NOt active", 10000);

#creat new table
create table student_ineuron(
	student_id int,
    course_name varchar(20),
    student_mail varchar(20),
    student_status varchar(30),
    course_id_1 int,
    foreign key (course_id_1) References ineuron (course_id)
);
-- insert the student_ineuron table data
insert into student_ineuron values
	-- (101,"fsda","test@gmail.com","active",05),-- it show the error
    (101,"fsda","test@gmail.com","active",01), -- it execute
	(101,"fsda","test@gmail.com","active",01);

-- Create another table 
create table payment(
	course_name varchar(30),
    course_id int,
    course_live_status varchar(30),
    course_launch_date varchar(30),
    foreign key (course_id) references ineuron(course_id)
    );

-- Now insert the some data
insert into payment values
("fsda",01,"not_active","07 aug"),
("fsda",01,"not_active","07 aug");


-- create table
create table class(
	course_id int,
	class_name varchar(60),
	class_topic varchar(60),
	class_duration int ,
	primary key (course_id),
    foreign key(course_id) references ineuron(course_id)
);

-- try to define two column as primary key
alter table ineuron add constraint test_prim primary key (course_id,course_name);
-- error get multiple primary key not allowed
	-- test_prim is alias of primary key

-- drop the primary key in the ineuron table
alter table ineuron drop primary key;
-- this is not droped -- because it is related to the another table foreign key

-- now drop the primary key in the class table
alter table class drop primary key ;
-- it is also not droped because it is related to foriegn key

-- now drop the parent table ineuron
drop table ineuron;
-- the table not droped because it is related to the child table 

-- lets try to drop the child table class
drop table class;
-- yes this table was deleted because it is child table


-- if i drop the parent table firstly drop all the child table then drop its parent tbl

-- create another table
create table test(
	 id int not null,
     name varchar(60),
     mail_id varchar(40),
     mobile_no varchar(10),
     address varchar(60)
);
-- see the table structure
select * from test;

-- now add the primary key in this test table
alter table test add primary key(id); 
-- this is allow to after creation of table to add the constraint

-- now drop the primary key
alter table test drop primary key;-- droped

-- now add the two column as a primary key
alter table test add constraint  test_prim primary key(id,mail_id);


-- crate another tagle
create table parent(
	id int not null,
    primary key(id)
);

create table child (
	id int ,
    parent_id int,
    foreign key (parent_id) references parent(id)
);

insert into parent values(1);
insert into child values(1,1);

insert into child values(2,2); -- it show error because it related to the parent table

-- now i delete the entry of parent table then what is show in the child table
delete from parent where id=1;
-- access denay because it is related to the child table 

-- but still i delete
-- firstly drop the table 
drop table child;

-- create the table and use to cascade
create table child (
	id int ,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete cascade
);

-- now insert the data
insert into parent values(2);
insert into child values (1,1),(1,2),(2,2),(3,2);

-- see the table
select * from child;
select * from parent;

-- Now delete the parent table data
delete from parent where id =1;
-- now this time allowing me to delete the data

-- now i see the parent table
select * from parent;
-- also see the child table
select * from child;
-- in this child table it is automatically delete the parent_id 1;

-- now some of the updation on the parent table 
update parent set id=3 where id=2; 
-- it don't allow to me that update the parent table because it related to the child table

-- but still i update 
-- use to cascade keyword
-- firstly drop the child table then create

drop table child;

-- create table child

create table child (
	id int ,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on update cascade
);

-- insert some of the data
insert into parent values(1);
insert into child values (1,1),(1,2),(2,2),(3,2);

-- now update the parent table
update parent set id =30 where id =1;

-- now see the result on parent as well as child table
select * from parent;
select * from child;-- the child table automatically updated

-- also use to delete as well as update both in same time
create table child1(
	id int,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete cascade on update cascade
    );
    
insert into parent values(1);
insert into child1 values (1,1),(1,2),(2,2),(3,2);

# now delete as well as update the parent table
update parent set id=100 where id=30;


-- ------------------------ Day--09 done ----Focus on Primary and Foreign key------------------

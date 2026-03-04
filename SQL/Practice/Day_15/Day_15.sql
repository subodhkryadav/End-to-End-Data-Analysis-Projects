-- --------------- Day-- 15-------------------------------- 
-- Today focus on the Triggers---------------------------------

-- Triggers are applicable in the insert,update and delete operation

-- There are 6 kind of trigger are present in general
-- 1. Before Insert
-- 2. After Insert
-- 3. Before Update
-- 4. After update
-- 5. Before delete
-- 6. After delete.

-- Now create a database
create database if not exists Ineuron_1;

-- Use to this database to perform some sort of operation
use ineuron_1;

-- create a table
create table if not exists Course(
	course_id int,
    course_desc varchar(30),
    course_mentor varchar(40),
    coursr_price int,
    course_descount int,
    create_date date
);

-- see the table structure 
select * from course;

-- create another table
create table if not exists course_update(
	course_mentor_update varchar(50),
    course_price_update int,
    course_discount_update int
);

-- now see the table structure
select * from course_update;

-- Now perform the Trigger operation in these tables

-- # Insert operation
	-- Before insert
Delimiter //
create trigger course_before_insert 
before insert 
on course for each row
begin 
    set new.create_date=sysdate();
end //
Delimiter ;

-- if i insert some sort of values in the course table
insert into course values(101,"full stack data analyst","sudhanshu",4000,10) ;
-- it show the error because it contain the 6 column and i am passing the 5 column values , i miss the course_date column values 
	-- so i use the trigger on this column it automatticly fill the values on course_date column 
		-- But some sort of maping is missing here 
			-- firstly maping then it not show error

-- use to mapping
insert into course(course_id, course_desc,course_mentor,coursr_price,course_descount) values (101,"full stack data analyst","sudhanshu",4000,10) ;
-- it not show any type of the error 

-- see the table record
select * from course;
-- wnen execute this query the create_date column contain the Null 

-- Then i execute the above trigger operaion (before insert)

-- and once again execute the insert operation just like
insert into course(course_id, course_desc,course_mentor,coursr_price,course_descount) values (101,"full stack data analyst","sudhanshu",4000,10) ;

-- and see the table record
select * from course;

-- Get the result as '101', 'full stack data analyst', 'sudhanshu', '4000', '10', '2026-03-03'
-- means it automatic fill the create_date column as the current date

-- now perfrom same operation to another column 
	-- who has inserted this record 

-- add one column
alter table course
add column user_info varchar(40);

-- see the table structure
select * from course;
-- course_info contain the null null values so next row fill it

-- Now define the trigger
Delimiter //
create trigger before_insert_trigger
before insert 
on course for each row
begin	
	declare user_val varchar(40);
	set new.create_date=now();
    select user() into user_val;
    set new.user_info=user_val;
end //
Delimiter ;

-- Now i insert the data into the course or same column
insert into course(course_id, course_desc,course_mentor,coursr_price,course_descount) values (102,"full stack data science","sudhanshu",14000,20) ;

-- see the table dat
select * from course;

-- it fill the record as the create_date=today_date as well as the user_info= root@localhost 


-- Now perform some of more thing on before insert table as well
-- create one refrence table
create table if not exists ref_course(
	record_insert_date date,
    recored_insert_user varchar(50)
);

-- see the table structure
select * from ref_course;
-- nothing is present in the ref_course table

-- Try to one thing that 
	-- insert the some of the record in the course table and when ever insert the record on the course table it automaticlly insert to the 
		-- ref_course table as well with same record
Delimiter //
create trigger insert_before_both_table
before insert
on course for each row
begin
	declare val varchar(40);
    set new.create_date=sysdate();-- system date
    select user() into val;
    set new.user_info=val;
    insert into ref_course values(now(),val);
end //
Delimiter ;

-- now insert the record on the course table
insert into course(course_id, course_desc,course_mentor,coursr_price,course_descount) values 
	(1000,"full stack web development","Tech ineuron",6000,100);
    
-- see the both table record
select * from course;

select * from ref_course;
-- i am not insert the data into the ref_column seperatly it fetch or automatticly insert the record behalf of course table


-- Create one column on course table that store the integer typed valued and algong with that also add the column on the ref_course
	-- ref_course column store  the data that is square of the course column data

-- firstly add the coumn on both the table
alter table course
add column course_value int;

alter table ref_course
add column course_value_square int;

-- now create the trigger
Delimiter //
create trigger before_insert_value_and_square_1
before insert
on course for each row
begin
    set new.create_date = sysdate();
    set new.user_info = user();
    
    insert into ref_course(record_insert_date, recored_insert_user, course_value_square) 
    values(sysdate(), user(), (new.course_value * new.course_value));
    
    end //
Delimiter ;

-- Test the operation
insert into course (
    course_id, 
    course_desc, 
    course_mentor, 
    coursr_price, 
    course_descount, 
    course_value
) 
values (
    105, 
    "Mastering SQL", 
    "Sudhanshu", 
    5000, 
    15, 
    10
);


-- take another example
create table if not exists test1(
	c1 varchar(20),
    c2 date,
    c3 int
);

create table if not exists test2(
	c1 varchar(20),
    c2 date,
    c3 int
);
create table if not exists test3(
	c1 varchar(20),
    c2 date,
    c3 int
);


-- trigger
Delimiter //
create trigger to_update_others_
before insert
on test1 for each row
begin
	insert into test2 values("xyz",sysdate(),23);
    insert into test3 values("sss",now(),43);
    
end //
Delimiter ;

insert into test1 values("subodh",sysdate(),3333); -- i have execute for one times to add the data from the test1 column


select * from test1;
select * from test2;
select * from test2;


#-- After Insert
Delimiter //
create trigger to_update_others_table_
After insert
on test1 for each row
begin
	update test2 set c1="abc" where c1="xyz";
    delete from test3 where c1="sss";
    
end //
Delimiter ;

insert into test1 values("ram",sysdate(),3333);

select * from test1;
select * from test2;
select * from test3;



-- Delete triggers
Delimiter //
create trigger to_delete_other_tables
after delete on test1 
for each row
begin 
    update test2 set c1="narendra modi" where c1="abc";
    insert into test3(c1, c2, c3) values (OLD.c1, OLD.c2, OLD.c3);
end //
delimiter ;

DELETE FROM test1 WHERE c1 = 'subodh' LIMIT 1;

select * from test1;
select * from test2;
select * from test3;

-- now perform the one another after delete operation
	-- when the delete some sort of the record on the test1 insert the some record intothe test3 col
    
Delimiter //
create trigger to_delete_record_table
after delete on test1 for each row
begin
	insert into test3 values("after delete",now(),347890);
end //
Delimiter ;

select * from test1;
-- now check the test3 what is present inside the table
select * from test3;
-- it contain the 'subodh', '2026-03-04', '3333'

-- now delete some sort of the record for the test1 col
delete from test1 where c1="ram";

-- now see the test3;
select * from test3; 
-- insert successfully 'after delete', '2026-03-04', '347890'

-- # Now before Delete
	-- same kind of work in the Before Delete
Delimiter //
create trigger before_delete_operation
before delete on test1 for each row
begin	
	insert into test2 values("Mohit sir",sysdate(),49303);
end //
Delimiter ;

-- check the test 2
select * from test2; -- not name contain any type of the mohit sir 

-- then in hit the delete operation
Delete from test1 where c1="subodh";

-- Now check the test2
select * from test2;
-- add ed successfylly 'Mohit sir', '2026-03-04', '49303'


-- update  trigeer
-- # after update
Delimiter //
create trigger after_update_to_tbl_
after update
on test1
for each row
begin
	insert into test3(c1,c2,c3) values("khan sir",sysdate(),348977);
end //
Delimiter ;

-- now check the test1
select * from test3;
-- there is nothing is present in the test1 table


-- now hit the update on the test2 table
UPDATE test1 SET c1 = "Cm nitish kumar" LIMIT 1;


-- before update
Delimiter //
create trigger before_update_tble_trigger
before update 
on test1
for each row
begin
	insert into test2 values("subu",sysdate(),498077);
end //
Delimiter ;
-- update test1
UPDATE test1 SET c1 = "Cm nitish kumar" where c1="rana";

select * from test2;


-- # I show the which type of work before do same kind of word after do as well then what is the 	
	-- Then how to identify the operation is perform that the before the delete , after the delete operation 
		-- OR many more kind of trigger are differen from each other for the prospective of after and before
	-- Because it is smae to me

-- Nowing that creat the tables
create table if not exists test11(
	c1 varchar(40),
    c2 date,
    c3 int
);

create table if not exists test12(
	c1 varchar(40),
    c2 date,
    c3 int
);

create table if not exists test13(
	c1 varchar(40),
    c2 date,
    c3 int
);

-- create trigger for test11 applicable on test12
Delimiter //
create trigger delete_before
before delete 
on test11
for each row
begin 
	insert into test12(c1,c2,c3) values(old.c1,old.c2,old.c3);
end //
Delimiter ;

-- some sort of the data insertion operation
insert into test11 value("subodh",sysdate(),34897),
						("sonu",sysdate(),897),
                        ("sudu",sysdate(),5897),
                        ("ddk",sysdate(),4897);
select * from test11;

-- delete form the table test11
delete from test11 where c1="subodh";

-- see the record on the test2
select * from test12;
-- means those values are delte that are insert into the test12

-- create trigger for test11 applicable on test12
Delimiter //
create trigger delete_after
after delete 
on test11
for each row
begin 
	insert into test12(c1,c2,c3) values(old.c1,old.c2,old.c3);
end //
Delimiter ;


-- delete form the table test11
delete from test11 where c1="sonu";

-- see the record on the test2
select * from test12;
-- means those values are delte that are insert into the test12


-- after update 
Delimiter //
create trigger to_update_other
after update
on test11
for each row
begin
	insert into test12(c1,c2,c3) values(old.c1,old.c2,old.c3);
end //
Delimiter ;

select * from test11;
-- 'sudu', '2026-03-04', '5897'
-- 'ddk', '2026-03-04', '4897'

-- so update thise kind of thing whenever c1="sudu" change into somthing else

update test11 set c1="after update" where c1="sudu";

select * from test11;
select * from test12;

-- now use the new as well before update
Delimiter //
create trigger to_update_other_before
before update
on test11
for each row
begin
	insert into test12(c1,c2,c3) values(new.c1,new.c2,new.c3);
end //
Delimiter ;

select * from test11; 
-- Currently i have
-- 'after update', '2026-03-04', '5897'
-- 'ddk', '2026-03-04', '4897'

update test11 set c1="before insert" where c1='after update';

select * from test12;

 
-- ---------------------- Day-16 -------------------------------------
-- Today focus on the Case statement

-- use to the ineuron_partition database to perform the operation
use Ineuron_partition;

-- see the what kind of the data talbe are present here
show tables;

-- the the date of the ineuron_course table
select * from ineuron_course;

-- try to one thing that 
	-- when ever "fsds" batch tyr to return me "this is your batch"
		-- other case it is suppose to tell me this is not your course or batch
	-- this type of situation comes into the case statement
    
select *,
case 
	when course_name="fsds" then "This is your course"
	else "this is not your course"
end as Statement
from ineuron_course;
    
-- also add two or more as condition
select *,
case
	when course_name="fsda" then "This is your course"
	when course_name ="fsds" then "this is your course"
		
	else 
		"this is not your course"
end as Stmt
from ineuron_course;
    
-- try to one another example
select *,
case 
	when length(course_name)=4 then "length is 4"
	when length(course_name)=3 then "length is 3"
	when length(course_name)=2 then "length is 2"
		
	else
		"other length"
end  as stm
from ineuron_course;

-- firstly check the table name
describe ineuron_course;

-- the course_launch_year d_type is the int
	-- so use to case statement i need to check the course_launch_year 
			-- if it is divided by 2 
		 -- show the even
		-- if divided by 3 show the divided by 5 as well
select *,
case 
	when course_launch_year % 2 = 0 then "Even"
    when course_launch_year %3 =0 then "DIVIDED by 3"
	
    else
		"divided by another number"
end as divided_by_numbers
from ineuron_course;

-- there are n number of condition are write 
	-- last one is default condition  written
    
-- i can also use to the update statement
update ineuron_course set course_name=case
	when course_name="RL" then "Reinforcement Learinging"
    when course_name ="DL" then "Deep Learning"
	
end;

-- see the record after updation
select * from ineuron_course;

-- it show some sort of the null value contain because i am not use the default case condition
	-- if i use to the default condition then it change all the record that are not match to the case 
    
    -- another example of the case statement
update ineuron_course set course_id=case
	when course_title="ML" then "110"
    when course_title="ai-" then "130"
end;

-- see the record
select * from ineuron_course;

-- also update the course_name

UPDATE ineuron_course 
SET course_name = CASE 
    WHEN course_name IS NULL THEN 'Missing course_name' 
    ELSE course_name 
END;
-- Verify the records
SELECT * FROM ineuron_course;

-- -------------- day_ 16 completed-----------------------------------------------------------
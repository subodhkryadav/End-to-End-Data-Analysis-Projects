# Day-02 
# Work on the ineuron_fsda database so use it
use ineuron_fsda;

-- --------------------------------------- Procedures --------------------------------------------------------

# How to automate the task means write one singe query and run when i need it
--  it is called the stored Procedures -- it is inside the schema ,inside the current db use 

# How to write its query
Delimiter &&
create procedure show_record()
begin 
	select * from bank_details;
End &&

# now use to below method to use any time to without write whole code to run that
call show_record();

# Every time some one looking like this type of record so it will be automate
--   select * from bank_details where age > 33;
	-- so how to automate
Delimiter &&
create procedure age_33()
begin 
	select * from bank_details where age > 33;
end &&

# now use this age_33 show the result
call age_33()

# Now again and again i write the query that i use to automate 
Delimiter &&
create procedure subodh()
begin 
	select * from bank_details where balance > 100;
end &&

call subodh();

# again create one of the needable query to automate the task
Delimiter && 
create procedure sub()
begin 
	select distinct job from bank_details;
end && 
call sub();

select distinct job from bank_details;

# Try to find the average balance form bank_details whose job is admin,
	-- # Try to find the average balance form bank_details whose job is management,
	-- # Try to find the average balance form bank_details whose job is technician,
	-- # Try to find the average balance form bank_details whose job is entrepreneur,
	-- # Try to find the average balance form bank_details whose job is retired,
	-- # Try to find the average balance form bank_details whose job is unknown,
-- so i can write the query in each time in each of the statement that is the working of bignar and this is time consuming
# so i use the Procedure - parametrized procedure ,so when i need to that job section i will pass and get the record
DELIMETER &&
create procedure avg_bal_jobrole(in var varchar(30))
begin
	select avg(balance) from bank_details where job=var;
end &&

call avg_bal_jobrole("retired");
call avg_bal_jobrole("unknown");
call avg_bal_jobrole("technician");

# Same as the another query where just like i fetch the data form the bank_details table where the job="'blue-collar'"
						-- and education=''unknown''
# Same as the another query where just like i fetch the data form the bank_details table where the job="'admin.'"
						-- and education=primary
-- Now in this use the procedure at the 2 parameter
DELIMETER &&
create procedure avg_bal_job_and_edu(in var1 varchar(30),in var2 varchar(30))
begin
	select avg(balance) as average_balance from bank_details where job=var1 and education=var2;
end &&

call avg_bal_job_and_edu('entrepreneur','secondary');


--  ------------ Procedures are done------------------------------------;
# Now working with the views
-- Views:- views is nothing but its a table but if we are going to store some subset of the data from the entire main table

#How to create the view 
create view bank_view as select age, job, education,marital,balance, loan from bank_details;
# view is created

# Now perform some of the operation on the view

-- 1. Can you show whole record present in the bank_view table
select * from bank_view;

-- 2. Can you show the total number of record are present in the bank_view column
select count(*) as total_record from bank_view;

-- 3. Can you show the average balance in the bank_view table
select avg(balance) as average_balace from bank_view;

-- 4. can you show the sum of the balance in the bank_view table
select sum(balance) as total_balance from bank_view;

-- 5. can you show the min of the balance in the bank_view table
select min(balance) as minimum_balance from bank_view;

-- 6 can you show the only 5 record in the bank_view column
select * from bank_view limit 5;

-- 7 can you show the bank_view table in the order of ascending as well as descening  in the behalf of age
select * from bank_view order by age desc -- this is descening order
select * from bank_view order by age asc  -- this is the ascending order

--8 can you perform the where clause in this bank_view table 
select * from bank_view where age>20;

-- 9 can you show only job and education column that are present in the how many distinct value
select distinct job, education from bank_view;

-- 10 can you show the record of those person whose job is 'retired' and balance is maximum of 100
select * from bank_view where job='retired' and balance>100;

SELECT * FROM bank_details 
ORDER BY age ASC 
LIMIT 5;

-- --------------------------------- view is completed --------------------------------------------

-- ----------------------------------- Day 02 is complete ------------------------------------------
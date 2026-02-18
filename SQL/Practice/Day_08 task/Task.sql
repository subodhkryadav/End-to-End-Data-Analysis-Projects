-- ---------------Task-- day --08-----------------------------
# 1. create a table , inside this two column 
	-- create a loop for this table to insert record into both column
		-- 1. first column you insert the 1 to 100 
		-- 2. second column you insert the square of the fisrt column
# solution
-- create the table 
create table Task(number int,square int);

-- after that
Delimiter &&
create procedure fill_record()
Begin 
	set @var=1;
    generate_data : loop
		insert into Task(number,square) values(@var,@var*@var);
        
        set @var=@var+1;
        
        if @var=101 then
			leave generate_data;
		end if;
	end loop generate_data;
end &&
Delimiter ;

-- show the table structure
select * from Task;
-- call the procedure
call fill_record();
-- now see the table record;
select * from Task;


# 2. Create a User define function to find out a date difference in number of days

--  use the inbuild function to_day
Delimiter &&
create function Date_diff(first_date date, second_date date)
Returns int
deterministic 
Begin
	declare result int;
    set result=to_days(first_date) - to_days(second_date);
    return result;
end &&
Delimiter ;

-- Now call the function
select flag as Delivery_Date,order_date_new as Order_date,Date_diff(flag,Order_date_new) as Day_taken from sales;
 
select Date_diff('2027-01-01','2026-01-01') as date_diff;

-- use to the inbuild function Datediff
Delimiter &&
create function Date_diff_1(first_date date, second_date date)
Returns int
deterministic 
Begin
	declare result int;
    set result=DateDiff(first_date , second_date);
    return result;
end &&
Delimiter ;

-- call this function
select flag as Delivery_Date,order_date_new as Order_date,Date_diff_1(flag,Order_date_new) as Day_taken from sales;

-- Another buildern fucntion use dayofYear
Delimiter &&
CREATE FUNCTION Date_Diff_3(date1 DATE, date2 DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	declare result int; 
    set result=(YEAR(date1)*365 + YEAR(date1)/4 + DAYOFYEAR(date1)) - 
           (YEAR(date2)*365 + YEAR(date2)/4 + DAYOFYEAR(date2));
	return result;
END &&
Delimiter ;

-- call the function
select flag as Delivery_Date,order_date_new as Order_date,Date_diff_3(flag,Order_date_new) as Day_taken from sales;

# 3. Create a Function to find out a log base 10 of any given number

# 4. Create a User define function which will be able to check total number of record in your table
Delimiter &&
create function total_number_of_record()
returns int
deterministic
begin 
	set @start =1;
    check_data:loop
		set @start=@start+1;
	end loop check_data;
end &&
delimiter ;
-- this is not correct 
-- create a procedure to findout 5th Highest profit in your sales table you dont to use rand and window function;
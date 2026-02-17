-- -----------------------Day_08 -----------------------------------
# today use the sales database
use sales;

-- show the record 
select * from sales;

-- Today focus on the Loops

-- Try to show the 10 to 100 
	-- 1. firstly i need to table that store these values
create table loop_table (val int);

	 -- 2. create the procedure to insert the data repeatdly
Delimiter &&
create procedure insert_data()
begin
set @var=10;
generate_data: loop
insert into loop_table values (@var);
set @var=@var+1;
if @var=100 then 
	leave generate_data;
end if;
end loop generate_data;
end &&
delimiter ;

-- first i show the table
select * from loop_table;
-- when i execute to show the table nothing is present only table structure are avl

-- now call the procedure
call insert_data();

-- now show the table data
select * from loop_table;
-- the table contain 10 to 99 in a single cal val;


-- try to insert the even number between the 1 to 100 using the loop in a perticular table
	-- firstly increase the table column
alter table loop_table
add column Even_no int;

Delimiter &&
create procedure even_number()
begin
	set @val=10;
	generate_data: loop
		if @val %2 =0 then
			insert into loop_table(Even_no) values (@val);
		end if ;
        
        set @val=@val+1;
        
		if @val=100 then 
			leave generate_data;
		end if ;
	end loop generate_data;
end &&
delimiter ;

-- first check the table structure
select * from loop_table;

-- now call the procedure
call even_number();

-- check the table record
select * from loop_table;


-- The table structure are miss match because i use insert command and this command try to execute a new row
	-- first val column execute then evenno null then even is execute so val is null
    
-- so drop the column
alter table loop_table
drop column Even_no;

-- now fill the Even no in the starting of the rows
alter table loop_table
add column Even_num int;

Delimiter &&
create procedure Even()
Begin	
	set @val=10;
    generate_data : loop
		if @val %2 =0 then
			update loop_table set Even_num=@val where val=@val;
		end if;
		
        set @val=@val+1;
        
        if @val =100 then
			leave generate_data;
		end if;
	end loop generate_data;
end &&
delimiter ;

-- now show the table structure
select * from loop_table;

-- call the procedure
call Even(); -- this will show the error because safe-update mode on so off it
set sql_safe_updates=0;
call Even();

select * from loop_table;
-- it show where 10  even and and not even show null


-- Try to create one function that take the val column input and get result into another column even or odd

-- create another column
alter table loop_table
add column Even_odd varchar(20);


Delimiter &&
create function Even(var int)
returns Varchar(10)
deterministic 
begin
	declare result varchar(10);
    if var %2 =0 then 
		set result="Evan";
	else
		set result="Odd";
        
	end if;
    
    return result;
    
end &&
delimiter ;

-- add this result into the Even_odd column
update loop_table set Even_odd=Even(val);

-- show the record
select * from loop_table;

-- there are another null contain so delete it
delete from loop_table where val>99 or val is null;

select * from loop_table;

-- create one column and insert the data where val (10-100) data is divisable by 5 then yes else no use procedure loop and conditional;

-- create column
alter table loop_table
add column Div_by_5 varchar(5);

-- Now create procedure
Delimiter &&
create procedure chek_div_5()
begin
	set @val=10;
    generate_data : loop
		if @val %5 =0 then
			update loop_table set Div_by_5="Yes" where val=@val;
		else
			update loop_table set Div_by_5="No" where val=@val;
		
        end if;
        
        set @val=@val+1;
        
        if @val =100 then 
			leave generate_data;
		
        end if;
	end loop generate_data;
end && 
delimiter ;

-- show the table structure
select * from loop_table;

-- call the procedure
call chek_div_5();

-- show the result
select * from loop_table;


-- Create a column Category and use a procedure with a loop (10-100) to update it:
-- if the number is Even set 'Special',
--  if Perfect Square set 'Perfect', 
-- if divisible by 10 set 'Decade', else 'Regular'
-- use to the procedure loop and conditionals

-- create column
alter table loop_table
add column Category varchar(20);
-- create procedure
Delimiter &&
create procedure Category_Label()
begin 
	set @val=10;
    generate_data:loop
		if @val % 2=0 then 
			update loop_table set Category="Special" where val=@val;
            
		-- elseif (@val**0.5) %1=0 then
			-- this is not woking in mysql so use the inbuild function
		elseif(SQRT(@val)%1=0) then
			update loop_table set Category="Perfect" where val=@val;
            
		elseif (@val %10)=0 then
			update loop_table set category ="decade" where val=@val;
            
		else
			update loop_table set category="Regular" where val=@val;
		
        end if;
		
        set @val=@val+1;
		
        if @val =100 then
			leave generate_data;
            
		end if;
    end loop generate_data;
end &&
delimiter ;

-- check the table structure
select * from loop_table;

-- call the procedure
call Category_Label();

-- show the record
select * from loop_table;
	
-- check the total unique values in the categories column
select category ,count(*) total_record from loop_table group by category;


# create a procedure to show the record;
Delimiter &&
create procedure show_record()
begin
	select * from loop_table;
end &&
Delimiter ;

-- we use to this and show the record anytime
call show_record();

#can you create one procedur to show the specific result
Delimiter &&
create procedure show_specific_record(in var int)
begin
	select * from loop_table where val=var;
end &&
Delimiter ;

-- call the procedure
call show_specific_record(29);
call show_specific_record(91);
call show_specific_record(3);

-- -------------------------------------------------Day 08 down focus on the loops ------------------------------------------------------------------------------------------
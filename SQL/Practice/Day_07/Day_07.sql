-- ------------------------------ Day_07-------------------------------------

-- Used to sales database
use sales;

-- now show the record
select * from sales;

-- Try to find out final_profit=profit-discout use to the function
Delimiter &&
create function final_profit(profit decimal(10,2),discount decimal(10,2))
returns decimal(10,2)
deterministic
begin
	declare result decimal(10,2);
    set result=profit-discount;
    return result;
end &&
delimiter ;

-- Now call the function and get the final_profit
select profit,discount,final_profit(profit,discount) as final_profit from sales;

-- Try to create one function that take the input as a integer and return as string
Delimiter &&
create function int_str( a int)
returns varchar(20)
deterministic
begin
	declare result varchar(20);
    set result=a;
    return result;
end &&
delimiter ;

-- call this function
select int_str(100000);
-- i have one quantity column try to convert int to varchar or string
select quantity, int_str(quantity) as convert_to_string from sales; 

-- create one function that take the decimal input and return as a int
Delimiter &&
create function decimal_integer( a decimal(10,2))
returns int
deterministic
begin
	declare result int;
    set result=a;
    return result;
end &&
delimiter ;

-- call the function
select decimal_integer(10.01);
select profit,decimal_integer(profit) as decimal_to_integer from sales;

-- try to create one function that take the  string and return as a datetime 
delimiter &&
create function string_to_datetime(a varchar(50))
returns datetime
deterministic
begin
	declare result datetime;
    set result = replace(a, '/', '-');
    return result;
end &&
delimiter ;

-- call the function
select string_to_datetime('2026/12/25 09:30:00') as formatted_date;
select string_to_datetime('2026-12-25 09:30:00') as formatted_date;

-- create one function that take the datetime input and return as the string
delimiter &&
create function datetime_to_string(a datetime)
returns varchar(20)
deterministic
begin
	declare result varchar(30);
    set result=a;
    return result;
end &&
delimiter ;

-- call the function
select order_date_new,datetime_to_string(order_date_new) as con_str from sales;

-- ---- if, elseif and else condition ----------------------------------------------------
# try to create one function and inside it create when ever sales is less than 100 return maximum affordable
																	 -- between 100 and 300 moderate affordable
                                                                     -- between 300 and 600 affordable
                                                                     -- grator than 600 expensive
-- now create the function
Delimiter &&
create function mar_sales(sales int)
returns varchar(40)
deterministic
begin
	declare flag_sales varchar(40);
		if sales < 100 then
			set flag_sales="super affordable";
		elseif sales >= 100 and sales <300 then 
			set flag_sales="affordable";
		elseif sales >=300 and sales<600 then
			set flag_sales= "moderate";
		else
			set flag_sales="expensive";
	end if;
    return flag_sales;
end &&
delimiter ;

-- now call the function
select sales,mar_sales(sales) as flag from sales;

-- check any integer value
select mar_sales(3000);

-- check how many record are present in each flag
select mar_sales(sales) as flag,count(*) as total_record from sales group by mar_sales(sales);

-- Try to create a new column and put that the record that i got 
alter table sales
add column mark_sales varchar(30) after sales;

-- safe update
set sql_safe_updates=0;

-- fill the entire data into the column mark_sales
update sales
set mark_sales=mar_sales(sales);

select * from sales;

-- Now create one function inside this if elseif and else condition
# the problem is inside the function contain
-- order fullfillment quality
 -- Q.  i have to check the how much fast shiping and how much earn compnay
		-- 1. if shiping more than 5 days and  profit negative then show the "Operational Disaster"
        -- 2. if shiping less than 2 days and discount more than 0.4(40%) then show the "High cost speed"
        -- 3. if discount 0 ,shiping less than 3 days  and profilt more than 200  then show the "Goldern Order" 
        -- 4. else "standard Process"

-- Now write the query
Delimiter &&
create function check_fullfillment_quality(
	order_date date,
    ship_date date,
    profit decimal(10,2),
    discount decimal(10,2)
)
returns varchar(30)
Deterministic
begin
	declare ship_days int;
    declare status_flag varchar(40);
    
    SET ship_days = DATEDIFF(ship_date, order_date);
    
		if ship_days > 5 and profit <0 then
			set status_flag="Operational Disaster";
		elseif ship_days <2 and discount > 0.4 then 
			set status_flag="High cost speed";
		elseif discount=0 and ship_days<3 and profit >200 then 
			set status_flag="Golden Order";
		else
			set status_flag="Standard process";
	end if;
    return status_flag;
    
end &&
delimiter ;

-- now call the function
select check_fullfillment_quality(
	order_date_new,
    ship_date_new,
    profit,
    discount
) as check_fullfillment_quality;

-- all include then show
select order_date_new as order_date,ship_date_new as ship_date,profit,discount,check_fullfillment_quality(
	order_date_new,
    ship_date_new,
    profit,
    discount
) as check_fullfillment_quality
from sales;

-- 
select check_fullfillment_quality(
	order_date_new,
    ship_date_new,
    profit,
    discount
) as check_fullfillment_quality,
 count(*) as total_record from sales group by check_fullfillment_quality(
	order_date_new,
    ship_date_new,
    profit,
    discount
) ;
-- ---------------- Day-06 --------------------------

-- Today use to sales database.
use sales;

-- show how many table are present in this sales database
show tables;

-- show the record
select * from sales;

-- today focus on the Function

-- 1.Create the addition function
Delimiter &&
create function addition(col1 decimal(10,2),col2 decimal(10,2))
returns decimal(10,2)
deterministic
begin
	declare result decimal(10,2);
    set result=col1 +col2 ;
    return result;
end &&
delimiter ;

-- call to the fucntion
select sales,quantity ,addition(sales,quantity) as total from sales;

-- 2.Create the substraction function
Delimiter &&
create function substraction(col1 decimal(10,2),col2 decimal(10,2))
returns decimal(10,2)
deterministic
begin
	declare result decimal(10,2);
    set result=col1 - col2 ;
    return result;
end &&
delimiter ;

-- call to the fucntion
select sales,quantity ,substraction(sales,quantity) as substraction from sales;


-- 3.Create the multiply function
Delimiter &&
create function multiply(col1 decimal(10,2),col2 decimal(10,2))
returns decimal(10,2)
deterministic
begin
	declare result decimal(10,2);
    set result=col1 * col2 ;
    return result;
end &&
delimiter ;

-- call to the fucntion
select sales,quantity ,multiply(sales,quantity) as product from sales;

-- 4.Create the division function
Delimiter &&
create function division(col1 decimal(10,2),col2 decimal(10,2))
returns decimal(10,2)
deterministic
begin
	declare result decimal(10,2);
    set result=col1 / col2 ;
    return result;
end &&
delimiter ;

-- call to the fucntion
select sales,quantity ,division(sales,quantity) as division from sales;

-- create anoter function that take two input and get the sum,subtract,division and multiplication
Delimiter &&
create function calculator(var1 int,var2 int)
returns float
deterministic
begin
	declare `add` int,`sub`int,`mult`int,`div`int ;
    set `add`=var1+var2;
    set `sub`=var1-var2;
    set `mult`=var1*var2;
    set `div`=var1/var2;
    retun `add`,sub,mult,div;
end &&
delimiter ;

-- above are not work because A MySQL function can only return one single value,
	-- not multiple results at once, 
    -- and you have a syntax error in the word retun.
    -- so use to create the procedure
DELIMITER &&
CREATE PROCEDURE calculator(IN var1 INT, IN var2 INT)
BEGIN
    DECLARE val_add INT;
    DECLARE val_sub INT;
    DECLARE val_mult INT;
    DECLARE val_div FLOAT;

    SET val_add = var1 + var2;
    SET val_sub = var1 - var2;
    SET val_mult = var1 * var2;
    SET val_div = var1 / var2;
    
    SELECT val_add AS Addition, val_sub AS Subtraction, val_mult AS Multiplication, val_div AS Division;
END &&

DELIMITER ;

-- Now call the procedure
call calculator(10,12);
call calculator(100,100);
call calculator(2,3);

-- -------------------------------basic  of function is completed ---------------------------------


    




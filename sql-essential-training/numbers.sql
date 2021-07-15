-- What Type is that Value?

select typeof(1 + 1);
    -- Use the typeof command to find the data type of a value
    
select typeof(1 + 1.0);
    -- Adding an integer and a real value will result in a real value
    
select typeof('panda');
    -- It can also be used to find the type of text
    
select typeof('panda' + 'koala');
    -- Adding 2 strings will result in an integer
    -- The system will convert the values all to 0 and add them together
    
-- Integer Division

select 1 / 2;
    -- In the event you divide 2 integers the output will always be another integer
    -- In this case even though the answer is mathematically .5, the output will be 0
    
select 1.0 / 2;
    -- If one of the numbers is real, then you will get a real number output
    
select cast(1 as real) / 2;
    -- You may use the cast command to make the computer consider a number of one data type as another 
    
select 17 / 5;
    -- The output of this query will be 3, because that's how many times the integer 5 fits into the integer 17
    
select 17 / 5, 17 % 5;
    -- The % operator allows you to find the remainder
    -- In this case the output will be 3, 2
        -- 5 fits in to 17 3 times, and the remainder is 2
        
-- Rounding Numbers

select round(2.555555555);
    -- The round command will round a real number to the nearest whole integer
    
select round(2.555555555, 3);
    -- If you add a 2nd number you can select how many degrees of precision the output real number will have
    -- In this case the output will be 2.556, because we are rounding to 3 places after the decimal
    
select round(2.555555555, 0);
    -- If the 2nd number is 0, the output will be rounded to an integer again
    

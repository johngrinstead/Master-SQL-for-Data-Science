-- Finding the Length of a String

select length('string');
    -- Using the length feature will tell you how long a string is 
    
select Name, length(Name) as Len
from City
order by Len desc, Name;
    -- If you have a feature that is comprised of strings you can query the length of each string 
    -- You should alias it for readability
    
-- Selecting Part of a String

select substr('this string', 6);
    -- The substr() command will allow you to select portions of a string
    -- In this case 'this string' is our string and 6 is the index of where the output starts
        -- So this query will return everything in the string AFTER the 6th character
        
select substr('this string', 6, 3);
    -- If we add a 2nd integer to the command that is how many characters will be in the output
    -- So in this case it will be the first 3 characters after the 6th character 
    
select released,
substr(released, 1, 4) as year,
substr(released, 6, 2) as month,
substr(released, 9, 2) as day
from album
order by released;
    -- You can use substr to extract partial information from strings so long as all strings have the same format
    
-- Removing Spaces 

select trim ('    string    ');
    -- The trim command will allow you to remove all empty spaces before the first chracter and after the last character
    
select ltrim ('    string    ');
    -- The ltrim command will only remove empty space before the first character
    
select rtrim ('    string    ');
    -- The rtrim command will only remove empty space after the last character
    
select trim ('.... string....', '.');
    -- The trim command can also be used to specify what characters to remove
    -- In this case trim will remove all '.' characters from the string
    
-- Folding Case

select 'sTrInG' = 'string';
    -- SQL does not recognize these values as the same
    -- Even though the letters are the same, the capitilization is not
    
select lower('sTrInG') = 'string';
    -- The lower command can be used to make all characters in a string lowercase
    -- Once all characters are lower case SQL will recognize these as the same string
    
select upper('sTrInG') = upper('string');
    -- The upper command can be used to make all characters in a string uppercase 
    
select upper(Name)
from City
order by Name;
    -- When making a query, if a feature you are selecting is a string, you may use upper and lower commands to make the output upper or lower case if desired 
    -- Will not convert accented characters 
    

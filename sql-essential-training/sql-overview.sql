-- The SELECT statement
    -- The Select statment is how you begin a SQL query

select 'Hello, World';
    -- Will output the single string 'Hello, World'
    
select 'Hello, World' as Result;
    -- Will output the single string 'Hello, World', but the column will be lables 'Result'
    
select *
from Country;
    -- 'select *' will output all the contents of a table
    -- 'from' statement allows you to specify what table
    -- This query will output everything from a table named 'Country'
    
select *
from Country
order by Name;
    -- 'order by' allows you to select a feature in the table to use to order the output data
    -- In this case the output data will be ordered alphabetically by the content of the Name field
    -- alphabetical is deafult, can be set to reverse if desired
    
select Name, LifeExpectancy
from Country
order by Name;
    -- As opposed to calling all data, you can name explicitly which features you want in the select statement
    -- This query will only display the features Name and LifeExpectancy from this table, still ordered by Name
    
select Name, LifeExpectancy as "Life Expectancy"
from Country
order by Name;
    -- Using 'as' on a feature allows you to alias it
    -- In this case when the data is outputted, the feature 'LifeExpectancy' will be called 'Life Expectancy'
    -- Must use double quotes when setting an identifier 
    -- 'as' can be omitted, but not best practice
    
-- Selecting Rows

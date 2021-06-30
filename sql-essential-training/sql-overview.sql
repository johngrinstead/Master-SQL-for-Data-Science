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

select Name, Continent, Region
from Country;
    -- Naming specific features in your select clause will only output the features you name
    
select Name, Continent, Region
from Country
where Continent = 'Europe';
    -- Adding a where clause will filter the output only displays results that satisfy the requirement
    -- In this case we will only get results where the continent is Europe
    -- Where clause MUST come after from clause
    
select Name, Continent, Region
from Country
where Continent = 'Europe'
order by Name;
    -- You can also order the results by a selected feature
    -- This will output all the results alphabetically by name
    -- Order by clause MUST come after where
    
select Name, Continent, Region
from Country
where Continent = 'Europe'
order by Name
limit 5;
    -- Limit will make the output only display the specified number of results
    -- In this case only 5 results
    -- Since we are also ordering by name, this query will only show the first 5 results alphabetically
    -- Limit cluase MUST come after order by
    
select Name, Continent, Region
from Country
where Continent = 'Europe'
order by Name
limit 5
offset 5;
    -- Offset will allow you to make a gap in start of the display
    -- In this instance instead of showing the first 5 alphabetical nations it will display nations 6-10 alphabetically
    -- Offste clause MUST come after limit
    
select Name, Continent, Region
from Country
where Continent = 'Europe'
order by Name
limit 5
offset 10;
    -- Offset 10 will display results starting with row 11
    
-- Selecting Columns

select Name as Country, Continent, Region
from Country;
    -- Using as after naming a feature will assign that feature an alias
    -- When the output is displayed the 'Name' column will be called 'Country'
    
select Name as Country, Region, Continent
from Country;
    -- Features can be named in any order, but they will always display in the order they are called
    
-- Counting Rows

select count(*)
from Country;
    -- Count(*) will count all the rows in a database named Country and return the exact count
    
select count(*)
from Country
where Population > 1000000;
    -- A where clause can be added to filter how many rows will be counted
    -- In this instance an observation will only be counted if the value in the population field is larger than 1,000,000
    
select count(*)
from Country
where Population > 100000000;
    -- The where clause can be adjusted as desired
    
select count(*)
from Country
where Population > 100000000
and Continent = 'Europe';
    -- An and clause can be added to create a 2nd condition to filter the results be
    -- In this instance an observation will only be counted if the Population field is larger than 100,000,000 and the Continent field says 'Europe'
    
select count(LifeExpectancy)
from Country;
    -- As opposed to counting all rows, you can name specific features
    -- The output will return a count of how many rows have a value in the specified feature
    -- Will NOT count nulls in specified feature
    
-- Inserting Data

select *
from customer;
    -- Start by calling all the data from a database
    
insert into customer (name, address, city, state, zip)
values ('Fred Flinstone', '123 Cobblestone Way', 'Bedrock', 'CA', '91234');

select *
from customer;
    -- You can use an insert into command to add an extra observation into a database
    -- You name withc features you want to add the observation to
    -- Then you can use the value command to manually type out the data
    -- When you are done you can run the select * command to see the new data in the database
    -- DO NOT RUN MORE THAN ONCE
        -- If you run the insert into command more than once it will add the same data multiple times
        
insert into customer (name, city, state)
values ('Jimi Hendrix', 'Renton', 'WA');

select *
from customer;
    -- You can fill only a partial amount of the fields with data for your new observation, if you wise
    -- fields left out will return as null values in your output however
    
-- Updating Data

update customer
set address = '123 Music Avenue', zip = '98056'
where id = 7;

select *
from customer;
    -- Use the update command on a database to fill in or correct data
    -- Use set to call which features to update and fill in the values you want to reflect
    -- Use a where clause on the key id to target only the specific row you wish to update
    -- Call the database again to see the changes reflected
    
update customer
set address = '2603 S Washington St', zip = '98056'
where id = 7;

select *
from customer;
    -- You can use the same command to ater data that is already in the database if it is incorrect and you know exactly where it is
    
update customer
set address = null, zip = null
where id = 7;

select *
from customer;
    -- If desired you can also set values to null
    
-- Deleting Data

delete from customer
where id = 4;

select *
from customer;
    -- Use the delete from command to delete an observation from a database
    -- You must use a where clause to specify what exactly is to be deleted, otherwise it will delete the ENTIRE database
    -- Call the database again to see the deleted row omitted
    

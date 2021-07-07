-- Creating a Table

create table test(
    a INTEGER,
    b TEXT
);
    -- Create a table by using the create table command and naming the database you wish to use
    -- You must name your columns and decale their data types
        -- In this case column 'a' is an int
        -- and column 'b' is text
    -- Resulting table will be empty however, data must be entered in manually
    
insert into test
values (1, 'a');

insert into test
values (2, 'b');

insert into test
values (3, 'c');

select *
from test;
    -- Once the table has been created you may enter in data as you normally would
    
-- Deleting a Table

drop table test;
    -- The drop table command will remove a table from your database if you name it in the clause
    
drop table if exists test;
    -- if exists allows the command to do the same thing, but will not give an error if the table is already gone
    
-- Inserting Rows

create table test (
    a INTEGER,
    b TEXT,
    c TEXT
);
    -- Begin by creating a table
    
insert into test
values (1, 'This', 'Right Here!');

select * 
from test;
    -- You can create a row by adding a value for each column in the table
    
insert into test (b, c)
values ('That', 'Over There!');

select * 
from test;
    -- If you do not wish to fill all the columns in the new row, you may specify which columns will have values specifically
    -- Columns not specified will have null values in the new row
    
insert into test
default values;

select * 
from test;
    -- If you wish to make a row of all null values you can insert a row of default values
    
insert into test
select id, name, description
from item;

select * 
from test;
    -- Instead of manually inserting values, you may call features from another table using a select clause
    -- In this case the values from the id, name, and description fields from all the rows of a table named item will be inserted into the test table
    
-- Deleting Rows

delete from test
where a = 3;

select *
from test;
    -- Using the delete from command will remove content from your table
    -- Use the primary key to specify which row or rows in particular you would like removed
        -- If you are not explicit with what content is to be removed the entire table will be deleted
    -- Deleted content is gone permanantly, it can not be recovered 
    
    
-- The Null Value

select *
from test
where a is null;
    -- Null is not a value, it is a condition
    -- You can not do a = null, because that does not exist
    -- To search for null values you must use an is statement
    
select *
from test
where a is not null;
    -- Use is not statement to find observations where a feature is not null
    
insert into test (a, b, c)
values (0, null, '');

select *
from test
where c is null;
    -- An empty string and null are not the same
    -- If you want to find an empty string you must search specifically for ''
    
create table test(
    a INTEGER NOT NULL,
    b TEXT NOT NULL,
    c TEXT
);
    -- While creating a newe table you can specify that a column is 'NOT NULL'
    -- This means while inserting data you can not putt null values in these specific fields
    -- If you attempt to leave the value out or enter in a null you will get an error that the data will not be added to the table
    
-- Constraining Columns

create table test(
    a TEXT,
    b TEXT,
    c TEXT
);

insert into test (a, b)
values ('one', 'two');

select *
from test;
    -- Start by making a table
    
create table test(
    a TEXT,
    b TEXT,
    c TEXT NOT NULL
);

insert into test (a, b)
values ('one', 'two');

select *
from test;
    -- If this code was attempted it would result in an error because the c column is constrained as not null
    
create table test(
    a TEXT,
    b TEXT,
    c TEXT DEFAULT 'panda'
);

insert into test (a, b)
values ('one', 'two');

select *
from test;
    -- The default constraint can be used to set a default value on all observations in the new table
    
drop table if exists test;

create table test(
    a TEXT UNIQUE,
    b TEXT,
    c TEXT DEFAULT 'panda'
);

insert into test (a, b)
values ('one', 'two');

insert into test (a, b)
values ('one', 'two');

select *
from test;
    -- The unique constraint means that no 2 observations in this table can have the same value in this field
    -- If this code was run it would result in an error because the a field is the same on both rows
    
drop table if exists test;

create table test(
    a TEXT UNIQUE,
    b TEXT,
    c TEXT DEFAULT 'panda'
);

insert into test (a, b)
values ('one', 'two');

insert into test (a, b)
values ('uno', 'two');

select *
from test;
    -- Once you change the value in the a field of the second row the code will run
    
drop table if exists test;

create table test(
    a TEXT UNIQUE,
    b TEXT,
    c TEXT DEFAULT 'panda'
);

insert into test (a, b)
values (null, 'two');

insert into test (a, b)
values (null, 'two');

select *
from test;
    -- Null is exempt from unique constraint 
    
drop table if exists test;

create table test(
    a TEXT UNIQUE NOT NULL,
    b TEXT,
    c TEXT DEFAULT 'panda'
);

insert into test (a, b)
values (null, 'two');

insert into test (a, b)
values (null, 'two');

select *
from test;
    -- Constraints can be combined
    -- In this case we have feature a must be unique AND not null, this will get around the null exemption
    
-- Changing a Schema

drop table if exists test;

create table test(
    a TEXT,
    b TEXT,
    c TEXT
);

insert into test (a, b, c)
values ('one', 'two', 'three');

insert into test (a, b, c)
values ('two', 'three', 'four');

insert into test (a, b, c)
values ('three', 'four', 'five');

select *
from test;
    -- Begin by creating a new table
    
alter table test
add d TEXT;

select *
from test;
    -- The alter table command can be used to make a new feature to an existing table
    -- The resulting feature will be null across all observations
    
alter table test
add e TEXT DEFAULT 'pandas';

select *
from test;
    -- The default constraint can be added to an add statement to give the new feature a default value
    
-- ID Columns

drop table if exists test;

create table test (
    id integer primary key,
    a integer,
    b text
);

select *
from test;
    -- Begin by making a new table
    -- Designate a feature named id to be the primary key
    
insert into test (a, b)
values (10, 'a');

insert into test (a, b)
values (11, 'b');

insert into test (a, b)
values (12, 'c');

select *
from test;
    -- Insert values into the table, do not include the id
    -- When you display the table you will see each row has a unique id which is a number in sequential order starting a 1
    
-- Filtering Data

select *
from Country;
    -- You can start by selecting all the data from a table unfiltered
    
select Name, Continent, Population
from Country;
    -- Use the select statement to filter which features you want in the table
    
select Name, Continent, Population
from Country
where Population < 100000;
    -- Use a where clause to futher filter the data to only show observations where a specific condition is satisfied
    
select Name, Continent, Population
from Country
where Population < 100000
order by Population desc;
    -- You can use an order by clause to arrange the data
        -- In this case using desc makes the order go from largest to smallest
        
select Name, Continent, Population
from Country
where Population < 100000 or Population is null
order by Population desc;
    -- You can use an or statement to add another filter
    -- or means either requirement may be true
    
select Name, Continent, Population
from Country
where Population < 100000 and Continent = 'Oceania'
order by Population desc;
    -- You can use and statement to also add another condition
    -- and means both conditions must be true
    
select Name, Continent, Population
from Country
where Name like '%island%'
order by Population desc;
    -- You may use like clause to filter for strings that have similar features to the condition
    -- In this case our query would find any observation where the name field contains the word island
    
select Name, Continent, Population
from Country
where Name like '%island'
order by Population desc;
    -- If you remove the wildcard at the end you will only get results taht end in the word island
    -- If you tried to remove the first wildcard you would get results that start with the word island
    
select Name, Continent, Population
from Country
where Name like 'a%'
order by Population desc;
    -- This query would return any observations that start with the letter A
    
select Name, Continent, Population
from Country
where Name like '_a%'
order by Population desc;
    -- This query would return any result where the second letter of the name is the letter A
    
select Name, Continent, Population
from Country
where Continent in ('Europe', 'Asia')
order by Population desc;
    -- You can pass in a list and use the in clause to filter your results
    -- This query would return all country in Europe AND Asia
    
-- Removing Duplicates 

select Continent
from Country;
    -- If you run this query you would notice a lot of duplicates
    
select distinct Continent
from Country;
    -- If you add the distinct clause to your select statement it will only list each unique observation
    
select distinct Continent, Region
from Country;
    -- If you list more than one feature in the distinct statement the results will be each unique combination of the features that exist
    
-- Ordering Output

select Name
from Country
order by Name;
    -- Selecting a feature won't automatically put the list in order, the results will be in whatever order the rows are in the table
    -- If you wish for the results to be ordered you must explicitly state it and by which feature
    -- Default order is asc, which means alpahbetical or sequential depending on data type
    
select Name
from Country
order by Name desc;
    -- desc can be used to flip the order of the display
    
select Name, Continent
from Country
order by Continent, Name;
    -- You can order by multiple features
    -- The results will be ordered be the first listed feature, and then the second
    
select Name, Continent
from Country
order by Continent desc, Name asc;
    -- The multiple order by features can be in oppisite order, if desired 
    

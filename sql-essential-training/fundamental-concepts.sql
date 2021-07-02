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
    

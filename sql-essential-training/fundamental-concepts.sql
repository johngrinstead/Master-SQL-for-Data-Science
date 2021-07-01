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


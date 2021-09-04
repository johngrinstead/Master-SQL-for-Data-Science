-- Ask For Data with SELECT

SELECT 'Hello, World!';
    -- The SELECT command can be used to return a string inside qutation marks
    
select first_name from people;
    -- select can also be used to chose which features from which database you would like to dispaly
    
select first_name, last_name from people;
    -- You may select multiple features, as many as you desire, so long as they exist
    -- Features must be seperated by commas
    -- Features will appear in the order they are called in the query
    
select * from people;
    -- The * symbol means all or everything
    -- Selecting this symbol will call all the data that is in the database
    
-- Narrow Down a Query with WHERE
    
select * from people
where state_code = 'CA';
    -- The where clause will allow you to filter for only observations in the database that fulfill the stated parameters
    -- In this case we are only looking for observations where the state is California
    -- Strings are case sensitive
    -- Where clause MUST be after select and from clauses
    
-- Adding More Criteria to a Statement

select * from people
where state_code = 'CA' and shirt_or_hat = 'shirt';
    -- You may add another filter to your where clause with the AND statement
    -- You can use as many AND statments as you want to add more filters
    
select * from people
where state_code = 'CA' and shirt_or_hat = 'shirt' and team != 'Angry Ants';
    -- Using != means not equal
    -- In this case we are using a filter to exclude anything that satisfies the parameter
    
select * from people
where (state_code = 'CA' or state_code = 'CO') and shirt_or_hat = 'shirt' and team != 'Angry Ants';
    -- The or statement can be used in a filter to specify that we want an observation if it matches at least 1 of the parameters 
    -- It is highly recommended you use paranthises to group your or statements so SQL does not get confused
    -- SQL will follow order of operations
    
-- Broadening and Limiting Responses

select * from people
where state_code like 'C%';
    -- Using LIKE in your where clause allows you to filter for data that is similar to the prameter
    
select * from people
where state_code like 'C%'
limit 5;
    -- You can use LIMIT to impose a limit on how many observations are displayed in your results
    -- In this case we only want to see the first 5 observations that satisfy our parameters
    
select * from people
where state_code like 'C%'
limit 5 offset 5;
    -- The OFFSET command can be used to tell the query you would like to skip a set amount of observations in the displayed results
    -- In this case we are skipping the first 5 results that satisfy our query and looking at the next 5
    
-- Organize Responses with ORDER BY

select first_name, last_name
from people;
    -- A standard query will return the data in the order that is was input into the table, or by the order of the defined index
    
select first_name, last_name
from people
order by first_name;
    -- Using the order by clause will allow you to select a field by which to order the display of data
    -- In this case since we chose a text feature, the display will be alphabetical by order of the first name
    
select first_name, last_name
from people
order by first_name desc;
    -- The default order of ordered data is by ascending, that is by smallest to largest, or alphabetical
    -- If you desire the order to be the other way around you can select desc
    
select state_code, first_name, last_name
from people
order by state_code, last_name;
    -- You may order by multiple features if you wish, the display will be sorted by the first feature listed first, and then by the second feature within and so on
    
-- Finding Information About the Data

select  first_name, length(first_name)
from people;
    -- the LENGTH function will tell you how many characters long each data point is
    
select   distinct(first_name)
from people;
    -- the DISTINCT function will only show unique values, if a value is repeated in this field it is ignored 
    
select count(*)
from people
where state_code = 'CA';
    -- The COUNT function will count how many observations there are total
    -- Combined with a where clause as a filter you can use this to count how many observations are in a subsection of data
    
-- Retrieve Data from the Database

select first_name, last_name, team, quiz_points, shirt_or_hat
from people
order by shirt_or_hat, team;
    -- In this challenge we were tasked to display the names, favorite team, quiz score of each participant and to determine if they wanted a hat or a shirt as a prize
    -- further we were tasked with organzing the data so that all those that wanted hats were grouped together and all those that wanted shirts were grouped together
    -- even further in the shirt and hat groupings we were tasked to make sure all the teams were organized as well
    

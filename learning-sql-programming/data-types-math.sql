-- Math in SQL

select first_name, quiz_points
from people
where quiz_points > 70;
    -- Mathematical operators can be added to where clauses to filter for data based on satisfying a mathematical equation
    
select max(quiz_points), min(quiz_points)
from people;
    -- Some functions allow you to find certain numerical values in a field
    
select team, count(*), avg(quiz_points)
from people
group by team;
    -- Using math functions with a group by command will allow you to easily find numerical values based off groups or subsets of data
    
-- Compound Select

select  max(quiz_points)
from people;
    -- begin a subquery by using math functions to find the answer you are looking for
    -- In this case we want to know that max score
    
select first_name, last_name, quiz_points
from people
where quiz_points = (select  max(quiz_points)
					from people);
    -- Use your subquery in the WHERE clause filter
    -- This will display only those in the data whose quiz score equals the highest amount in that field
    
-- Transforming Data

select lower(first_name), upper(last_name)
from people;
    -- The UPPER and LOWER commands can be used to transform string data into lower case or uppercase letters respectively
    
select substr(last_name, 4)
from people;
    -- The SUBSTR command will take a substring of a string data type
    -- the 2nd argument, an integer, indicating how many characters long the substring should be 
    
select substr(last_name, 2, 4)
from people;
    -- If there are 2 integers, the first indicates which character the substring begins on and the 2nd indicates how many characters long it should be 
    
select replace(last_name, 'a', '-')
from people;
    -- The REPLACE command can comb through string data and replace any specified characters with another character
    -- Case sensitive

-- Calculate Participant Metrics

select state_code, max(quiz_points) as max_score, avg(quiz_points) as average_score
from people
group by state_code
order by average_score desc;
    -- We were tasked with creating a display that displays the max and average quiz_points value from each state
    -- The display also had to be ordered by average quiz score with the higest score being on top
    

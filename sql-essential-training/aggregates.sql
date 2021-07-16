-- What Are Aggregates

select Region, count(*)
from Country
group by Region;
    -- Aggregates can be used to aggregate data by a desired feature
    -- This query will display each unique region listed in the table as well as a count of how many observations have that value listed as their region
    
select Region, count(*) as Count
from Country
group by Region
order by Count desc, Region;
    -- If you alias your count you can use it as a feature to order by
    
select a.Title as Album, count(t.Track_number) as Tracks
from track as t
join album as a on a.id = t.album_id
group by a.id
order by Tracks desc, Album;
    -- Aggregates can also be used on joined tables
    
select a.Title as Album, count(t.Track_number) as Tracks
from track as t
join album as a on a.id = t.album_id
group by a.id
having Tracks >= 10
order by Tracks desc, Album;
    -- The having clause is like the where clause but for aggregate functions
        -- Necessary to have a seperate clause incase you still need to use where clause elsewhere
        
select a.Title as Album, count(t.Track_number) as Tracks
from track as t
join album as a on a.id = t.album_id
where a.Artist = 'The Beatles'
group by a.id
having Tracks >= 10
order by Tracks desc, Album;
    -- An example of how to use both where and having clauses
    -- The where clause MUST be before the having clause
    
-- Using Aggregate Functions

select avg(Population)
from Country;
    -- The avg aggregate function will find the average of all values in the specified column
    
select Region, avg(Population)
from Country
group by Region;
    -- Aggregate functions can be used with group by to divide by a specified feature
    -- In this case the output will be a list with each individual region on the table and the average population of all the countries in that region
    
select Region, min(Population), max(Population)
from Country
group by Region;
    -- The min and max aggregates can be used to find the minimum and maximum value in a column
    
select Region, sum(Population)
from Country
group by Region;
    -- The sum aggregate function will find the sum of all values in a feature
    
-- Aggregating DISTINCT values

select count(HeadofState)
from Country;
    -- By default the count function will only count how many observations have data in the specified field
    -- So this query will count all observations individually, even if they have the same value as another observation
    
select count(distinct HeadofState)
from Country;
    -- If you use the distinct command a value will only be counted once if it appears multiple times
    

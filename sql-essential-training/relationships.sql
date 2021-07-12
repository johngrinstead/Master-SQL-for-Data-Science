-- Understanding Join

    -- Joins are used to query data from multiple tables simultaneously 
    
-- Accessing Related Tables
    
CREATE TABLE left ( id INTEGER, description TEXT );
CREATE TABLE right ( id INTEGER, description TEXT );

INSERT INTO left VALUES ( 1, 'left 01' );
INSERT INTO left VALUES ( 2, 'left 02' );
INSERT INTO left VALUES ( 3, 'left 03' );
INSERT INTO left VALUES ( 4, 'left 04' );
INSERT INTO left VALUES ( 5, 'left 05' );
INSERT INTO left VALUES ( 6, 'left 06' );
INSERT INTO left VALUES ( 7, 'left 07' );
INSERT INTO left VALUES ( 8, 'left 08' );
INSERT INTO left VALUES ( 9, 'left 09' );

INSERT INTO right VALUES ( 6, 'right 06' );
INSERT INTO right VALUES ( 7, 'right 07' );
INSERT INTO right VALUES ( 8, 'right 08' );
INSERT INTO right VALUES ( 9, 'right 09' );
INSERT INTO right VALUES ( 10, 'right 10' );
INSERT INTO right VALUES ( 11, 'right 11' );
INSERT INTO right VALUES ( 11, 'right 12' );
INSERT INTO right VALUES ( 11, 'right 13' );
INSERT INTO right VALUES ( 11, 'right 14' );
    -- Begin by creating 2 tables
    
select left.description as left, right. description as right
from left
join right on left.id = right.id;
    -- When joining 2 or more tables you must explicitly state which table a desired feature comes from
        -- Using an alias may help readability
    -- Join tables where the id columns are the same
    -- This query will only return results where both right and left table have similar values in the id field
    
select left.description as left, right. description as right
from left
left join right on left.id = right.id;
    -- Using a left join will create a left outer join table
    -- All content from left table will be displayed and only data that is similar to the left id field will be displayed from the right table
    
-- Relating to Multiple Tables

SELECT c.name AS Cust, c.zip, i.name AS Item, i.description, s.quantity AS Quan, s.price AS Price
FROM sale AS s
JOIN item AS i ON s.item_id = i.id
JOIN customer AS c ON s.customer_id = c.id
ORDER BY Cust, Item;
    -- You can add a third table if you wish
    -- So long as all tables are in the same database you can join as many tables as desired
    -- If the main table has foreign keys pertaining to other tables, use those keys to join the tables
    -- Be sure to alias if tables have features with same names but mean different things
    -- If you want an outer join you MUST left join on ALL tables being joined
    

-- Creating a Subselect

CREATE TABLE t ( a TEXT, b TEXT );
INSERT INTO t VALUES ( 'NY0123', 'US4567' );
INSERT INTO t VALUES ( 'AZ9437', 'GB1234' );
INSERT INTO t VALUES ( 'CA1279', 'FR5678' );
SELECT * FROM t;
    -- Begin by creating a table
    
SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode, 
  SUBSTR(b, 1, 2) AS Country, SUBSTR(b, 3) AS CCode FROM t;
    -- From the data, substrings can be selected to divide the information
    
SELECT co.Name, ss.CCode FROM (
    SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode,
      SUBSTR(b, 1, 2) AS Country, SUBSTR(b, 3) AS CCode FROM t
  ) AS ss
  JOIN Country AS co
    ON co.Code2 = ss.Country
;
    -- The substring select can then be used as a subselect inside of a larger query
    -- If you alias your subselect you may use it like you would any other table
    
-- Searching Within a Result Set

SELECT DISTINCT album_id FROM track WHERE duration <= 90;
    -- A simple query to locate tracks under 90 seconds
    
SELECT * FROM album
  WHERE id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
;
    -- Using the query as a subselect, you may use the where clause to treat it like a list
    -- Using this query will display all the info about each track under 90 seconds as opposed to just a list of album ids
    
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
  FROM album AS a
  JOIN track AS t
    ON t.album_id = a.id
  WHERE a.id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
  ORDER BY a.title, t.track_number
;
    -- Furthermore you can join another table while still using a subselect in your where clause
    -- This query will display all the songs and all of the relevant data of any album that has at least one track that is less than 90 seconds
    
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
  FROM album AS a
  JOIN (
    SELECT DISTINCT album_id, track_number, duration, title
      FROM track
      WHERE duration <= 90
  ) AS t
    ON t.album_id = a.id
  ORDER BY a.title, t.track_number
    -- Using your subselect as part of your join clause you can filter for only the songs that are less than 90 seconds and not the entire album
    -- A select query is technically a table, so it can be used however you would use a table 
    
-- Creating a View

SELECT id, album_id, title, track_number, 
  duration / 60 AS m, duration % 60 AS s FROM track;
    -- A simple query that will seperate the duration into minutes and remaining seconds
    
CREATE VIEW trackView AS
  SELECT id, album_id, title, track_number, 
    duration / 60 AS m, duration % 60 AS s FROM track;
SELECT * FROM trackView;
    -- Save your query as a view, that way it can be accessed later at anytime
    
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.m, t.s
  FROM album AS a
  JOIN trackView AS t
    ON t.album_id = a.id
  ORDER BY a.title, t.track_number
;
    -- Using a join clause you can join a table and a view just as you would 2 or more tables 
    
DROP VIEW IF EXISTS trackView;
    -- Views can be dropped in the exact same manner as tables 
    
    
-- Creating a Joined View 

SELECT a.artist AS artist,
    a.title AS album,
    t.title AS track,
    t.track_number AS trackno,
    t.duration / 60 AS m,
    t.duration % 60 AS s
  FROM track AS t
    JOIN album AS a
      ON a.id = t.album_id
;
    -- A simple query that joins the track and album tables, and seperates the duration into minutes and remaining seconds
    
CREATE VIEW joinedAlbum AS
  SELECT a.artist AS artist,
      a.title AS album,
      t.title AS track,
      t.track_number AS trackno,
      t.duration / 60 AS m,
      t.duration % 60 AS s
    FROM track AS t
    JOIN album AS a
      ON a.id = t.album_id
;
    -- Save the query into a view so that it can be called later if desired 
    
SELECT * FROM joinedAlbum;
SELECT * FROM joinedAlbum WHERE artist = 'Jimi Hendrix';
    -- Views can be called upon by name
    -- Views can also be used as tables and you can filter with clauses
    
SELECT artist, album, track, trackno, 
   m || ':' || substr('00' || s, -2, 2) AS duration
    FROM joinedAlbum;
    -- Concatinating minutes and remaining seconds will allow you to create a string what will show duration in a mm:ss format
    

-- Dates and Time Related Functions

select datetime('now');
    -- The datetime command will tell you the date time of the requested prompt in terms of UTC
        -- UTC refers to the current time in England
        -- 5 hours ahead of me in US Central time
        
select date('now');
    -- You may also request just the date
    
select time('now');
    -- You may also request just the time
    
select datetime('now', '+1 day');
    -- You may also add a 2nd parameter as a string with an algebra equation to add or subtract from the time
    
select datetime('now', '-5 hours');
    -- Since I am 5 hours behind UTC I can subtract 5 hours to get my current time


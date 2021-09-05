-- Ask For Data Across 2 or More Tables

select first_name, state_code
from people
join states on people.state_code = states.state_abbrev;
    -- You may add a second table to your query using the JOIN command
    -- You may add as many tables as you like
    -- It is best practise to be explicit about which features from which tables are the same so that what the results line up properly
    
select people.first_name, people.state_code, states.division
from people
join states on people.state_code = states.state_abbrev;
    -- Once you've added a second table you may call its features in your query
    -- It is best to be explicit about which table the feature comes from
    -- In the event that both tables have a feature with the same name and you call it, the query will not know which one it should display and it will result in an error

-- Grouping Results

select first_name, count(first_name)
from people
group by first_name;
    -- The GROUP BY command allows you to specify a feature you would like to use as a control whil you run and aggreagate function like COUNT()
    
-- Practice with JOINs

select states.state_name, count(state_name) as amount_of_hats
from people
join states on people.state_code = states.state_abbrev
where people.shirt_or_hat = 'hat'
group by states.state_name;
    -- We were tasked with creating a display that would show how many hats were needed to be sent to each state
    
select states.division, people.team, count(people.team)
from people
join states on people.state_code = states.state_abbrev
group by states.division, people.team;
    -- We were also tasked with creating a display to show how many people were fans of each team in each of the geographic divisions surveyed 
    

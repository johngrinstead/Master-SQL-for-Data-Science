-- Data Integrity


create table widgetInventory (
    id integer primary key,
    description text,
    onhand integer not null
);

create table widgetSales (
    id integer primary key,
    inv_id integer,
    quantity integer,
    price integer 
);
    -- Begin by creating 2 tables
        -- The first table indicates inventory
        -- The second table indicates sales
        
    
insert into widgetInventory (description, onhand)
values ('rock', 25);

insert into widgetInventory (description, onhand)
values ('paper', 25);

insert into widgetInventory (description, onhand)
values ('scissors', 25);
    -- Add values into inventory table
    
    
begin transaction;

insert into widgetSales (inv_id, quantity, price)
values (1, 5, 500);

update widgetInventory
set onhand = (onhand - 5)
where id = 1;

end transaction;
    -- A transaction must begin and end with 'begin transaction;' and 'end transaction;'
    -- insert the data into the sales table from the sale
    -- offset the inventory table by the amount of each item that was purchased
    
select *
from widgetInventory;
    -- When you show the inventory table, you should see that the amount deducted in the transaction is now missing from the original amount
    
begin transaction;

insert into widgetSales (inv_id, quantity, price)
values (1, 5, 500);

rollback;
    -- If in the event that you do not want to complete a transaction for whatever reason, the rollback function can cancel a pending transaction and the adjustments of the transaction will not be made to any table
    
    
-- Performance
    -- Transactions are mainly used to increase performance of SQL
    -- All commads can be done individually if you desire
    -- However putting commands together in a transaction helps SQL's efficiency 
    -- That being said, if any operation fails the entire transaction fails
    


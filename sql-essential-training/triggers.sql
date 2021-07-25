-- Automating Data with Triggers

create table widgetCustomer (
    id integer primary key,
    name text,
    last_order_id integer
);

create table widgetSale (
    id integer primary key,
    item_id integer,    
    customer_id integer,
    quantity integer,
    price integer
);
    -- Begin by creating 2 tables, one for customers and one for sales 
    
insert into widgetCustomer (name)
values ('Bob');

insert into widgetCustomer (name)
values ('Sally');

insert into widgetCustomer (name)
values ('Fred');

select *
from widgetCustomer;
    -- Add values into the customer table
    
create trigger newWidgetSale
after insert on widgetSale
    begin
        update widgetCustomer set last_order_id = new.id where widgetCustomer.id = new.customer_id;
    end
;
    -- You can create a trigger by naming the function
    -- State what event will preceed your trigger
    -- Use 'begin' and 'end' to outline the commands your trigger will perform
    -- In this example, every time a new observation is added to the widgetSales table, the trigger will also update the widgestCustomer table so that the row which reflects each customer's most recent transaction has been updated automatically
    
insert into WidgetSale (item_id, customer_id, quantity, price)
values (1, 3, 5, 1995);

insert into WidgetSale (item_id, customer_id, quantity, price)
values (2, 2, 3, 1495);

insert into WidgetSale (item_id, customer_id, quantity, price)
values (3, 1, 1, 2995);

select *
from WidgetSale;
    -- Add values to your widgetSale table

select *
from widgetCustomer;
    -- When you view your widgetCustomer table again you should see that the trigger has alterd the values in the specified field
    
-- Preventing Updates

drop table if exists widgetSale;

create table widgetSale (
    id integer primary key,
    item_id integer,
    customer_id integer,
    quantity integer,
    price integer,
    reconciled integer
);

insert into widgetSale (item_id, customer_id, quantity, price, reconciled)
values(1, 3, 5, 1995, 0);

insert into widgetSale (item_id, customer_id, quantity, price, reconciled)
values(2, 2, 3, 1495, 1);

insert into widgetSale (item_id, customer_id, quantity, price, reconciled)
values(3, 1, 1, 2995, 0);

select *
from widgetSale;
    -- Begin by creating a new table with a reconciled feature
    
create trigger updateWidgetSale
before update on widgetSale
    begin
        select raise(rollback, 'can not update table "widgetSale"')
        from widgetSale
        where id = new.id and reconciled = 1;
    end
;
    -- Triggers can also be used to prevent updates
    -- In the case of this trigger, if a user attempts to update an observation that has already be reconciled by using a transaction they will get an error message and the transaction will be cancelled
    
-- Example: Timestamps

create table widgetCustomer(
    id integer primary key,
    name text,
    last_order_id integer,
    stamp text
);

CREATE TABLE widgetSale ( 
    id integer primary key,
    item_id INT, customer_id INTEGER, 
    quan INT, 
    price INT, 
    stamp TEXT 
);

CREATE TABLE widgetLog ( 
    id integer primary key, 
    stamp TEXT, 
    event TEXT, 
    username TEXT, 
    tablename TEXT, 
    table_id INT
);
    -- Recreate the tables, adding a stamp feature in each table and adding a log table
    
INSERT INTO widgetCustomer (name) VALUES ('Bob');
INSERT INTO widgetCustomer (name) VALUES ('Sally');
INSERT INTO widgetCustomer (name) VALUES ('Fred');
SELECT * FROM widgetCustomer;
    -- Add data to the customer table
    
CREATE TRIGGER stampSale AFTER INSERT ON widgetSale
    BEGIN
        UPDATE widgetSale SET stamp = DATETIME('now') WHERE id = NEW.id;
        UPDATE widgetCustomer SET last_order_id = NEW.id, stamp = DATETIME('now')
            WHERE widgetCustomer.id = NEW.customer_id;
        INSERT INTO widgetLog (stamp, event, username, tablename, table_id)
            VALUES (DATETIME('now'), 'INSERT', 'TRIGGER', 'widgetSale', NEW.id);
    END
;
    -- A trigger can be created to make a timestamp for every time a observation is made or adjusted 
    
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (1, 3, 5, 1995);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (2, 2, 3, 1495);
INSERT INTO widgetSale (item_id, customer_id, quan, price) VALUES (3, 1, 1, 2995);

SELECT * FROM widgetSale;
SELECT * FROM widgetCustomer;
SELECT * FROM widgetLog;
    -- When you enter data into the tables you should see that the observations reflect the current time of when the record was added or updated 
    

    

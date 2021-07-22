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


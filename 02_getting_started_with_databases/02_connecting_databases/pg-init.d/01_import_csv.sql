
-- import csv orders

COPY raw.orders(row_id ,
order_id ,
order_date ,
ship_date ,
ship_mode ,
order_priority ,
product_container ,
customer_name ,
customer_segment ,
zip_code ,
state ,
city ,
region ,
product_category ,
product_subcategory ,
product_name ,
unit_price ,
quantity ,
sales ,
profit ,
discount ,
shipping_cost ,
product_base_margin)
FROM '/var/lib/postgresql/csv/Sample - Superstore Sales - Orders.csv'
DELIMITER ','
CSV HEADER;

-- import csv people

COPY raw.managers(region, manager)
FROM '/var/lib/postgresql/csv/Sample - Superstore Sales - Users.csv'
DELIMITER ','
CSV HEADER;

-- import csv returns

COPY raw.returns(order_id, status)
FROM '/var/lib/postgresql/csv/Sample - Superstore Sales - Returns.csv'
DELIMITER ','
CSV HEADER;

CREATE SCHEMA raw;

DROP TABLE IF EXISTS raw.orders;
CREATE TABLE raw.orders (
row_id INT,
order_id INT,
order_date DATE,
ship_date DATE,
ship_mode VARCHAR(30),
order_priority VARCHAR(30),
product_container VARCHAR(30),
customer_name VARCHAR(250),
customer_segment VARCHAR(100),
zip_code VARCHAR(10),
state VARCHAR(50),
city VARCHAR(50),
region VARCHAR(50),
product_category VARCHAR(250),
product_subcategory VARCHAR(250),
product_name VARCHAR(250),
unit_price NUMERIC,
quantity INT,
sales NUMERIC,
profit NUMERIC,
discount NUMERIC,
shipping_cost NUMERIC,
product_base_margin NUMERIC,
_etl_loadtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- create table managers

DROP TABLE IF EXISTS raw.managers;
CREATE TABLE raw.managers (
region VARCHAR(10),
manager VARCHAR(30),
_etl_loadtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- create table returns

DROP TABLE IF EXISTS raw.returns;
CREATE TABLE raw.returns (
order_id INT,
status VARCHAR(10),
_etl_loadtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

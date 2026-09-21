CREATE DATABASE week6;

CREATE TABLE products_raw;

CREATE TABLE products_raw(
	id integer PRIMARY KEY,
	product_name varchar(20),
	brand varchar(20),
	category text,
	price numeric(10,2),
	stock integer
);

-- two ways to import csv files
COPY products_raw FROM "C:\Users\1016200\Downloads\products_raw.csv" DELIMITER ',' CSV HEADER;

-- steps to import csv files
-- step 1 make table template (creating table in relation to csv column names and data types)
-- step 2 import using gui
-- confirm file name, delimiter, header is turned on
-- SELECT * FROM table_name LIMIT 5;

SELECT * FROM products_raw LIMIT 5;

SELECT price, stock, price*stock AS inventory_value
FROM products_raw LIMIT 5;

SELECT price+5 AS price_increase
FROM products_raw LIMIT 5;

-- sum
SELECT SUM(price*stock) AS total_inventory_value
FROM products_raw;

-- avg
SELECT AVG(price) AS average_price
FROM products_raw;

-- min and max
SELECT MIN(price), MAX(price)
FROM products_raw;

-- count of dataset
SELECT COUNT(*)
FROM products_raw;

-- filtering with math
SELECT * FROM products_raw
WHERE price > 500;

SELECT category, SUM(stock) FROM products_raw
GROUP BY category
HAVING SUM(stock) > 5;

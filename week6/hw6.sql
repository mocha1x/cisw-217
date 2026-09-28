-- Part A
CREATE DATABASE PracticeMathDB;

CREATE TABLE products(
	id serial PRIMARY KEY,
	product_name text,
	description text,
	brand text,
	category text,
	price numeric(10,2),
	currency varchar(5),
	stock integer,
	ean numeric(18),
	color varchar(50),
	product_size text,
	availability varchar(50),
	added_date date,
	internal_id varchar(10)
);

SELECT SUM(price*stock) AS total_inventory_value
FROM products;

SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

SELECT product_name, brand, price, stock, availability
FROM products
WHERE price > 500

SELECT COUNT(*) AS product_count
FROM products
WHERE category = 'Laptops & Computers';

SELECT * FROM products
ORDER BY price ASC;

-- Part B
-- You can link one table with another using JOIN, and you can query multiple tables at once
-- Will we be using all of these concepts, like intersect, except, or writing the long commands like they do?

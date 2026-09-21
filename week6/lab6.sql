-- Part A
CREATE TABLE product(
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
	internal_id real
);

-- Part B
SELECT id, product_name, brand, price, stock, price*stock AS inventory_value
FROM product;
-- OR
SELECT SUM(price*stock) AS total_inventory_value
FROM product; -- for total inventory value

SELECT AVG(price) AS average_price
FROM product;

SELECT MIN(price), MAX(price)
FROM product;

SELECT COUNT(*)
FROM product;

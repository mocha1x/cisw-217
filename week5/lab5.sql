-- Part 1
CREATE DATABASE week5;

-- Part 2
CREATE TABLE products (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	product_name varchar(100),
	quantity integer
);

INSERT INTO products (product_name, quantity)
VALUES
	('Gaming Mouse', 10),
	('Mechanical Keyboard', 5),
	('Monitor', 5),
	('Headset', 12);

-- Part 3
ALTER TABLE products
ADD COLUMN description text,
ADD COLUMN price numeric(7,2),
ADD COLUMN rating real,
ADD COLUMN last_updated timestamp with time zone,
ADD COLUMN in_stock boolean;

-- Part 4
UPDATE products
SET description = 'Wireless gaming mouse',
	price = 49.99,
	rating = 4.7,
	last_updated = now(),
	in_stock = TRUE
WHERE product_name = 'Gaming Mouse';

UPDATE products
SET description = 'Wired mechanical keyboard',
	price = 89.99,
	rating = 4.5,
	last_updated = now(),
	in_stock = TRUE
WHERE product_name = 'Mechanical Keyboard';

UPDATE products
SET description = '24" 240hz 0.03ms gaming monitor',
	price = 159.99,
	rating = 4.9,
	last_updated = now(),
	in_stock = FALSE
WHERE product_name = 'Monitor';

UPDATE products
SET description = 'Wired headset',
	price = 29.95,
	rating = 4.4,
	last_updated = '2026-09-13 12:39:05-07',
	in_stock = TRUE
WHERE product_name = 'Headset';

-- Part 5
UPDATE products
SET price = 24.995
WHERE product_name = 'Headset';
-- PostgreSQL rounds the value up to 25

-- Part 6
SELECT * FROM public.products

SELECT product_name, price, rating FROM products

SELECT * FROM products
WHERE price > 50

SELECT * FROM products
WHERE in_stock = TRUE

SELECT * FROM products
ORDER BY price DESC

CREATE TABLE products("Index" integer PRIMARY KEY, "Name" varchar(100), Description text, Brand text, Category varchar(67),
	Price numeric(10,2), Currency varchar(5), Stock integer, EAN text, Color text, "Size" text, Availability text, Internal_ID integer);

SELECT * FROM public.products
ORDER BY "Index" ASC 

-- what are functions in sql
-- functions = built in operations that perform a specific task inside a query

-- common built in functions
-- ROUND(), round a number to n decimals SELECT ROUND(3.14159,2) = 3.14
-- CEIL() FLOOR(), round up or down SELECT CEIL(2.1) = 3

-- text functions
-- UPPER() converts text to uppercase SELECT UPPER(category)
-- LOWER() converts text to lowercase SELECT LOWER(product_name)
-- LENGTH() returns character count SELECT LENGTH(product_name)

-- date functions
-- NOW() returns current timestamp SELECT NOW()
-- CURRENT_DATE() returns today's date SELECT CURRENT_DATE()
-- AGE() returns difference between two dates SELECT AGE('2025-10-20','2000-05-15') = 25 yrs 5 mos 5 days
-- date functions are often used for reports or logs

-- avg price by category

SELECT category,
ROUND(AVG(price),2) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- views
-- a view is a saved sql query that acts like a virtual table
-- it doensn't store new data, it just stores a query definition

CREATE VIEW product_summary AS
SELECT category,
ROUND(AVG(price),2) AS avg_price,
SUM(stock) AS total_stock
FROM products
GROUP BY category;

-- views create a shortcut, we can use it later as long as we call the view
SELECT * FROM product_summary;
-- to update the view:
REPLACE VIEW product_summary
AS --...

-- to delete view
DROP VIEW product_summary
-- we use views to simplify long queries, avoid retyping code

SELECT UPPER(Brand) from products
SELECT ROUND(SUM(price)) from products
SELECT NOW()

CREATE VIEW product_detailed AS
SELECT "Name", description, price,
UPPER("Name"), lower(description)
FROM products
WHERE (price > 200)

SELECT * FROM product_detailed;

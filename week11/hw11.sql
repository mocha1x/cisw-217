-- 1
CREATE DATABASE week11_homework;

CREATE TABLE products_big (
	"Index" integer PRIMARY KEY,
	"Name" varchar(100),
	Description text,
	Brand text,
	Category varchar(67),
	Price numeric(10,2),
	Currency varchar(5),
	Stock integer,
	EAN text,
	Color text,
	"Size" text,
	Availability text,
	Internal_ID integer
);

-- 3
SELECT COUNT(*) FROM products_big;
SELECT * FROM products_big LIMIT 5;

-- 4
EXPLAIN ANALYZE SELECT * FROM products_big
WHERE category = 'skincare';
-- Seq scan, 11.201 ms execution time

-- 5
CREATE INDEX index_products_big_category ON products_big (category);
ANALYZE products_big;
EXPLAIN ANALYZE SELECT * FROM products_big where category = 'Skincare';
-- Yes it switched to a bitmap index scan, and yes execution was faster, now 1.516 ms execution time

-- 6
CREATE INDEX idx_big_cat_price ON products_big (category, price);
ANALYZE products_big;

EXPLAIN ANALYZE
SELECT * FROM products_big
WHERE category = 'Skincare' AND price > 90;
-- I see bitmap index scan

-- 7
-- Without an index, it runs a seq scan and checks every row, but after adding the index it switched to a bitmap index scan which makes it run faster.
-- It rather used the index even when searching only for skincare items. It chose an index after we created it and used it to search for skincare items and skincare items that cost more than $90
-- On smaller tables, it preferred to use seq scans, and even with an index only saw a small improvement. But with so many rows, the optimizer decided to use the index instead.

-- 8
-- One to one relationship: each row in one table matches exactly one row in the other table, like each state having one row in an income table and one row in an education table
-- One to many: one row in a table matches many rows in another table, like one car manufacturer having many models
-- Many to many: many rows in one table can match many rows in another, like baseball players who can play multiple positions while each position has multiple players, which usually needs a table to connect them

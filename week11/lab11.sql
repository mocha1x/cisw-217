-- Part A
SELECT * FROM products LIMIT 10;
SELECT COUNT(*) AS total_records FROM products;
-- 1000 records
-- Postgres will scan every row, so the more records a table has, the longer the query will take

-- Part B
SELECT * FROM products
WHERE category = 'Skincare';

EXPLAIN ANALYZE
SELECT * FROM products
WHERE category = 'Skincare';

-- Yes
-- 30 rows of records
-- 0.086 ms

-- Part C
CREATE INDEX index_products_category
ON products (category);

EXPLAIN ANALYZE
SELECT * FROM products
WHERE category = 'Skincare';

-- It used a bitmap index scan
-- 0.083 ms, barely faster, basically the same
-- It may not choose to use one when the table is small or a query already matches most of the rows. Plus, it's only a small timing difference, so it doesn't really help on a smaller scale.

-- Part D
SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT * FROM products
WHERE category = 'Skincare';

RESET enable_seqscan;

-- It stayed the same because of the index we set. 
-- For small tables, a sequential scan is easier and more efficient. If we had a lot more data, it may prefer other scans instead.

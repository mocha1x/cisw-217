CREATE TABLE products (
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

-- 2
SELECT
	category,
	ROUND(AVG(price),2) AS avg_price,
	CEIL(AVG(price)) AS rounded_avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

SELECT
	Category,
	MIN(price) AS min_price,
	MAX(price) as max_price
FROM products
GROUP BY Category;

SELECT
	Category,
	FLOOR(AVG(price)) AS floor_price
FROM products
GROUP BY category;

SELECT UPPER(Category) AS category
FROM products
GROUP BY Category;

-- 3
CREATE VIEW category_overview AS
SELECT
	Category,
	ROUND(AVG(price),2) AS avg_price,
	SUM(stock) as total_stock
FROM products
GROUP BY Category
HAVING AVG(price) > 50;

-- 4
SELECT * FROM category_overview;

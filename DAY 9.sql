--Find the top 3 best-selling products

-- Creating the products table
CREATE TABLE products (
    product_id BIGINT,          -- Equivalent to INT64
    product_name VARCHAR(255),  -- String type (VARCHAR)
    category VARCHAR(255)      -- String type (VARCHAR)
);

-- Inserting values into the products table
INSERT INTO products (product_id, product_name, category) 
VALUES 
(101, 'Laptop', 'Electronics'),
(102, 'Phone', 'Electronics'),
(103, 'Desk', 'Furniture'),
(104, 'Chair', 'Furniture'),
(105, 'Book', 'Books');

-- Creating the transactions table
CREATE TABLE transactions (
    transaction_id BIGINT,       -- Equivalent to INT64
    product_id BIGINT,           -- Equivalent to INT64
    quantity BIGINT,             -- Equivalent to INT64
    price_per_unit FLOAT         -- Equivalent to FLOAT64
);

-- Inserting values into the transactions table
INSERT INTO transactions (transaction_id, product_id, quantity, price_per_unit)
VALUES 
(1, 101, 10, 1000),
(2, 102, 20, 500),
(3, 103, 5, 200),
(4, 104, 15, 150),
(5, 105, 50, 20),
(6, 102, 10, 500),
(7, 101, 5, 1000),
(8, 103, 10, 200),
(9, 104, 20, 150),
(10, 105, 30, 20);

SELECT * FROM PRODUCTS;

SELECT * FROM TRANSACTIONS;

WITH TEMP AS (
SELECT CATEGORY,PRODUCT_NAME,SUM(QUANTITY*PRICE_PER_UNIT) AS TOTAL_SALES,
RANK() OVER(PARTITION BY CATEGORY ORDER BY SUM(QUANTITY*PRICE_PER_UNIT) DESC )AS RANK,
ROUND(
    (SUM(t.quantity * t.price_per_unit) * 100.0 / 
    SUM(SUM(t.quantity * t.price_per_unit)) OVER (PARTITION BY p.category))::NUMERIC, 
2
) AS contribution_percentage
FROM PRODUCTS P
JOIN TRANSACTIONS T
ON P.PRODUCT_ID=T.PRODUCT_ID
GROUP BY CATEGORY,PRODUCT_NAME
ORDER BY CATEGORY
)

SELECT 
 category, 
 product_name, 
 total_sales, 
 contribution_percentage 
FROM 
 TEMP
WHERE 
 rank <= 3;


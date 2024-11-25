--Track medicine sales across multiple regions.

CREATE TABLE sales_data (
 sales_id INT,
 sales_rep_name VARCHAR(50),
 region VARCHAR(50),
 medicine_name VARCHAR(50),
 quantity_sold INT,
 price_per_unit DECIMAL(10, 2),
 sale_date DATE
);
INSERT INTO sales_data VALUES
(1, 'Alice', 'North', 'PainRelief', 200, 10.50, '2024-01-15'),
(2, 'Bob', 'North', 'VitaBoost', 150, 15.00, '2024-01-20'),
(3, 'Charlie', 'South', 'PainRelief', 300, 10.50, '2024-01-22'),
(4, 'Diana', 'East', 'ColdCare', 100, 8.00, '2024-02-01'),
(5, 'Alice', 'North', 'VitaBoost', 180, 15.00, '2024-02-10'),
(6, 'Eve', 'West', 'PainRelief', 250, 10.50, '2024-02-12'),
(7, 'Frank', 'West', 'ColdCare', 300, 8.00, '2024-02-14'),
(8, 'Bob', 'North', 'PainRelief', 120, 10.50, '2024-03-01'),
(9, 'Charlie', 'South', 'VitaBoost', 200, 15.00, '2024-03-05'),
(10, 'Diana', 'East', 'PainRelief', 150, 10.50, '2024-03-10');

SELECT * FROM SALES_DATA;

WITH TEMP AS(
SELECT SALES_REP_NAME,REGION,SUM(QUANTITY_SOLD*PRICE_PER_UNIT) AS TOTAL_SALES, DENSE_RANK() OVER (PARTITION BY REGION ORDER BY SUM(QUANTITY_SOLD*PRICE_PER_UNIT) DESC) AS RANK
FROM SALES_DATA
GROUP BY REGION,SALES_REP_NAME)

SELECT REGION,SALES_REP_NAME,TOTAL_SALES
FROM TEMP
WHERE RANK=1;




--Analyzing Customer Spending for Restaurant Growth

--DDL
CREATE TABLE daily_sales (
 sale_date DATE,
 amount_paid DECIMAL(10, 2)
);

--DML
INSERT INTO daily_sales (sale_date, amount_paid) VALUES
('2024-10-01', 150.00),
('2024-10-02', 200.00),
('2024-10-03', 120.00),
('2024-10-04', 250.00),
('2024-10-05', 180.00),
('2024-10-06', 220.00),
('2024-10-07', 300.00),
('2024-10-08', 250.00);

SELECT sale_date, amount_paid,
	ROUND(AVG(AMOUNT_PAID) OVER (ORDER BY SALE_DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS MOVING_AVERAGE
FROM DAILY_SALES


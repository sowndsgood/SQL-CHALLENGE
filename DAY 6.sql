--Sales Report by Category and Day of the Week

-- Create the Items table
CREATE TABLE Items (
 item_id INT,
 item_category VARCHAR(50)
);

-- Create the Orders table
CREATE TABLE Orders (
 order_id INT,
 item_id INT,
 order_date DATE,
 quantity INT
);

-- Insert sample data into the Items table
INSERT INTO Items (item_id, item_category) VALUES 
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

-- Insert sample data into the Orders table
INSERT INTO Orders (order_id, item_id, order_date, quantity) VALUES 
(1, 1, '2024-10-01', 10),
(2, 1, '2024-10-02', 15),
(3, 2, '2024-10-01', 20),
(4, 2, '2024-10-04', 25),
(5, 1, '2024-10-01', 5),
(6, 3, '2024-10-03', 8),
(7, 3, '2024-10-02', 12),
(8, 2, '2024-10-02', 18),
(9, 1, '2024-10-05', 30),
(10, 3, '2024-10-01', 7);

SELECT I.item_category,
	SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=1) THEN O.QUANTITY ELSE 0 END) AS MONDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=2) THEN O.QUANTITY ELSE 0 END) AS TUESDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=3) THEN O.QUANTITY ELSE 0 END) AS WEDNESDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=4) THEN O.QUANTITY ELSE 0 END) AS THURSDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=5) THEN O.QUANTITY ELSE 0 END) AS FRIDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=6) THEN O.QUANTITY ELSE 0 END) AS SATURDAY,
    SUM(CASE WHEN (EXTRACT(DOW FROM O.ORDER_DATE)=0) THEN O.QUANTITY ELSE 0 END) AS SUNDAY
FROM ORDERS AS O
RIGHT JOIN ITEMS AS I
ON O.ITEM_ID=I.ITEM_ID
GROUP BY I.item_category
ORDER BY I.item_category




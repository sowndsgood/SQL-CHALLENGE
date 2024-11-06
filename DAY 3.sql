--Analyzing Ad Performance Using SQL: Calculate Click-Through and Conversion Rates

CREATE TABLE Ads (
 AdID INT PRIMARY KEY,
 AdName VARCHAR(100),
 Views INT,
 Clicks INT,
 Conversions INT,
 Revenue DECIMAL(10, 2)
);

INSERT INTO Ads (AdID, AdName, Views, Clicks, Conversions, Revenue) VALUES 
(1, 'Ad 1', 1000, 100, 10, 500.00),
(2, 'Ad 2', 2000, 150, 20, 1000.00),
(3, 'Ad 3', 1500, 120, 15, 750.00),
(4, 'Ad 4', 1800, 180, 25, 1250.00);

SELECT AdID, AdName, Views, Clicks, Conversions, Revenue, (Clicks*100/Views) AS "ClickThroughRate(CTR)", (Conversions*100/Clicks) AS "ConversionRate(CR)", ROUND((Revenue/Conversions),2) AS "RevenuePerConversion(RC)"
FROM Ads


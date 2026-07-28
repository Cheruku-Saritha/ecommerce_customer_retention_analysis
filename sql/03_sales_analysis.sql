USE ecommerce_analysis;

-- Revenue by Country
SELECT 
    Country,
    ROUND(SUM(Quantity * Price), 2) AS total_revenue
FROM online_retail
WHERE Quantity > 0 AND Price > 0
GROUP BY Country
ORDER BY total_revenue DESC;

-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(Invoice_Date, '%Y-%m') AS month,
    ROUND(SUM(Quantity * Price), 2) AS revenue
FROM online_retail
WHERE Quantity > 0 AND Price > 0
GROUP BY month
ORDER BY month ASC;

-- Top 10 Best-Selling Products by Quantity
SELECT 
    StockCode,
    Description,
    SUM(Quantity) AS quantity_sold
FROM online_retail
WHERE Quantity > 0
GROUP BY StockCode, Description
ORDER BY quantity_sold DESC
LIMIT 10;

-- Average Order Value (AOV)
SELECT 
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM (
    SELECT 
        Invoice,
        SUM(Quantity * Price) AS order_value
    FROM online_retail
    WHERE Quantity > 0 AND Price > 0
    GROUP BY Invoice
) t;
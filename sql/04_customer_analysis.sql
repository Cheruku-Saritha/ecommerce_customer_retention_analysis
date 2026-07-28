USE ecommerce_analysis;

-- Top 10 Highest Spending Customers
SELECT 
    `Customer ID`,
    ROUND(SUM(Quantity * Price), 2) AS total_spent
FROM online_retail
WHERE `Customer ID` IS NOT NULL AND Quantity > 0 AND Price > 0
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

-- Customer Purchase Frequency (Most Frequent Buyers)
SELECT 
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS total_orders
FROM online_retail
WHERE `Customer ID` IS NOT NULL
GROUP BY `Customer ID`
ORDER BY total_orders DESC
LIMIT 10;

-- Customer Lifetime Value (Total Historical Revenue per Customer)
SELECT 
    `Customer ID`,
    ROUND(SUM(Quantity * Price), 2) AS customer_lifetime_value
FROM online_retail
WHERE `Customer ID` IS NOT NULL AND Quantity > 0 AND Price > 0
GROUP BY `Customer ID`
ORDER BY customer_lifetime_value DESC;
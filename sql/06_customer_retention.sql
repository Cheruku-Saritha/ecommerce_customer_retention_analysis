USE ecommerce_analysis;

-- Total Distinct Registered Customers
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM online_retail
WHERE `Customer ID` IS NOT NULL;

-- One-Time vs. Repeat Customer Count
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT 
        `Customer ID`,
        COUNT(DISTINCT Invoice) AS total_orders
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t
GROUP BY customer_type;

-- Repeat Purchase Rate (%)
SELECT
    ROUND(
        SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS repeat_purchase_rate_pct
FROM (
    SELECT 
        `Customer ID`,
        COUNT(DISTINCT Invoice) AS total_orders
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t;

-- Top 10 Most Loyal Customers (Orders & Spend)
SELECT 
    `Customer ID`,
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(Quantity * Price), 2) AS total_spent
FROM online_retail
WHERE `Customer ID` IS NOT NULL AND Quantity > 0 AND Price > 0
GROUP BY `Customer ID`
ORDER BY total_orders DESC
LIMIT 10;

-- Average Orders Per Customer
SELECT 
    ROUND(AVG(total_orders), 2) AS avg_orders_per_customer
FROM (
    SELECT 
        `Customer ID`,
        COUNT(DISTINCT Invoice) AS total_orders
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t;
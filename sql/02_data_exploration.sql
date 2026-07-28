USE ecommerce_analysis;

-- Q1. Total Transactions (Rows)
SELECT COUNT(*) AS total_transactions 
FROM online_retail;

-- Q2. Total Unique Registered Customers
SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM online_retail
WHERE `Customer ID` IS NOT NULL;

-- Q3. Total Unique Products
SELECT COUNT(DISTINCT StockCode) AS total_products
FROM online_retail;

-- Q4. Dataset Date Range
SELECT 
    MIN(Invoice_Date) AS start_date, 
    MAX(Invoice_Date) AS end_date 
FROM online_retail;

-- Q5. Transaction Volume by Country
SELECT 
    Country, 
    COUNT(*) AS transactions
FROM online_retail
GROUP BY Country
ORDER BY transactions DESC;
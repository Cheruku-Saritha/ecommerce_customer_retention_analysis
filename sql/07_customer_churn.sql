USE ecommerce_analysis;

-- Reference Point: Dataset's Latest Transaction Date
SELECT MAX(Invoice_Date) AS last_transaction_date 
FROM online_retail;

-- Days Since Last Purchase Per Customer
SELECT 
    `Customer ID`,
    MAX(Invoice_Date) AS last_purchase_date,
    DATEDIFF(
        (SELECT MAX(Invoice_Date) FROM online_retail),
        MAX(Invoice_Date)
    ) AS days_since_last_purchase
FROM online_retail
WHERE `Customer ID` IS NOT NULL
GROUP BY `Customer ID`;

-- Active vs. Churned Status (> 90 Days Inactive = Churned)
SELECT
    Customer_Status,
    COUNT(*) AS total_customers
FROM (
    SELECT
        `Customer ID`,
        CASE
            WHEN DATEDIFF(
                (SELECT MAX(Invoice_Date) FROM online_retail),
                MAX(Invoice_Date)
            ) > 90 THEN 'Churned'
            ELSE 'Active'
        END AS Customer_Status
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t
GROUP BY Customer_Status;

-- Churn Rate Percentage
SELECT
    ROUND(
        SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_pct
FROM (
    SELECT
        `Customer ID`,
        CASE
            WHEN DATEDIFF(
                (SELECT MAX(Invoice_Date) FROM online_retail),
                MAX(Invoice_Date)
            ) > 90 THEN 'Churned'
            ELSE 'Active'
        END AS Customer_Status
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t;

-- Total Historical Revenue Earned From Now-Churned Customers
SELECT
    ROUND(SUM(total_spent), 2) AS revenue_from_churned_customers
FROM (
    SELECT
        `Customer ID`,
        SUM(Quantity * Price) AS total_spent,
        CASE
            WHEN DATEDIFF(
                (SELECT MAX(Invoice_Date) FROM online_retail),
                MAX(Invoice_Date)
            ) > 90 THEN 'Churned'
            ELSE 'Active'
        END AS Customer_Status
    FROM online_retail
    WHERE `Customer ID` IS NOT NULL AND Quantity > 0 AND Price > 0
    GROUP BY `Customer ID`
) t
WHERE Customer_Status = 'Churned';
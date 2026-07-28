USE ecommerce_analysis;

-- Step 1: Base RFM Calculation (View)
CREATE OR REPLACE VIEW rfm_base AS
SELECT 
    `Customer ID`,
    DATEDIFF(
        (SELECT MAX(Invoice_Date) FROM online_retail), 
        MAX(Invoice_Date)
    ) AS Recency,
    COUNT(DISTINCT Invoice) AS Frequency,
    ROUND(SUM(Quantity * Price), 2) AS Monetary
FROM online_retail
WHERE `Customer ID` IS NOT NULL AND Quantity > 0 AND Price > 0
GROUP BY `Customer ID`;

-- Step 2: Assign RFM Scores 1-5 (View)
CREATE OR REPLACE VIEW rfm_scores AS
SELECT
    `Customer ID`,
    Recency,
    Frequency,
    Monetary,
    NTILE(5) OVER (ORDER BY Recency DESC) AS R_Score,
    NTILE(5) OVER (ORDER BY Frequency ASC) AS F_Score,
    NTILE(5) OVER (ORDER BY Monetary ASC) AS M_Score
FROM rfm_base;

-- Step 3: Segment Customers Based on RFM Scores
SELECT
    `Customer ID`,
    R_Score,
    F_Score,
    M_Score,
    CONCAT(R_Score, F_Score, M_Score) AS RFM_Score,
    CASE
        WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Champions'
        WHEN R_Score >= 3 AND F_Score >= 3 THEN 'Loyal Customers'
        WHEN R_Score >= 4 AND F_Score <= 2 THEN 'Potential Loyalists'
        WHEN R_Score <= 2 AND F_Score >= 3 THEN 'At Risk'
        ELSE 'Lost Customers'
    END AS Customer_Segment
FROM rfm_scores;
# 🛒 E-Commerce Customer Retention & Sales Analytics

An end-to-end Data Analytics project that analyzes customer purchasing behavior, sales performance, customer retention, RFM segmentation, and churn using **Excel, MySQL, Python, and Power BI**.

---

## 📖 Project Overview

Businesses generate millions of customer transactions every year, but raw data alone does not provide meaningful insights. This project transforms raw e-commerce transaction data into actionable business intelligence by analyzing customer behavior, identifying sales trends, measuring customer retention, and detecting customer churn.

The project follows a complete analytics workflow—from data cleaning to dashboard development—using industry-standard tools.

---

## 🎯 Business Objectives

- Analyze overall sales performance
- Identify top-performing countries and products
- Understand customer purchasing behavior
- Measure customer retention
- Perform RFM (Recency, Frequency, Monetary) segmentation
- Identify churned customers
- Build interactive Power BI dashboards for business decision-making

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Microsoft Excel | Data Cleaning & Preparation |
| MySQL | Data Exploration & Business Analysis |
| Python (Pandas, NumPy, Matplotlib) | Exploratory Data Analysis |
| Power BI | Dashboard Development & Visualization |
| GitHub | Version Control & Project Documentation |

---

# 📂 Dataset

**Dataset:** Online Retail II (2009–2011)

The dataset contains transactional data from an online retail business, including:

- Invoice Number
- Product Description
- Quantity
- Unit Price
- Customer ID
- Country
- Invoice Date

---

# 🔄 Project Workflow

## Step 1: Data Cleaning (Excel)

- Removed cancelled invoices
- Removed missing Customer IDs
- Removed invalid quantities
- Removed zero-price transactions
- Standardized date formats
- Prepared clean data for SQL analysis

---

## Step 2: SQL Analysis (MySQL)

### Database Setup
- Combined two datasets (2009–2010 & 2010–2011)
- Created a unified transaction table
- Converted Invoice Date to DATETIME format

### Data Exploration
- Total Transactions
- Total Customers
- Total Products
- Transaction Date Range
- Country-wise Transactions

### Sales Analysis
- Revenue by Country
- Monthly Revenue Trend
- Top Selling Products
- Average Order Value

### Customer Analysis
- Top Customers
- Purchase Frequency
- Customer Lifetime Value (CLV)

### RFM Analysis
- Recency
- Frequency
- Monetary Value
- Customer Segmentation

### Customer Retention
- One-Time vs Repeat Customers
- Repeat Purchase Rate
- Most Loyal Customers
- Average Orders per Customer

### Customer Churn
- Active vs Churned Customers
- Churn Rate
- Revenue Lost from Churned Customers

---

## Step 3: Python Analysis

Performed exploratory data analysis using Python.

### Libraries Used

- Pandas
- NumPy
- Matplotlib

### Analysis Performed

- Data Validation
- Revenue Trend Analysis
- Customer Analysis
- Product Performance
- Country-wise Sales Analysis

---

## Step 4: Power BI Dashboard

The project includes three interactive dashboards.

### 📊 Executive Dashboard

KPIs:
- Total Revenue
- Total Orders
- Total Customers
- Total Quantity Sold
- Average Order Value

Visuals:
- Monthly Revenue Trend
- Top Products by Revenue
- Top Countries by Revenue

---

### 📈 Sales Performance Dashboard

KPIs:
- Total Revenue
- Total Quantity Sold
- Average Selling Price
- Total Products Sold
- Average Items per Order

Visuals:
- Monthly Revenue Trend
- Revenue by Country
- Top Products by Revenue
- Top Products by Quantity

---

### 👥 Customer Analytics Dashboard

KPIs:
- Total Customers
- Repeat Customers
- One-Time Customers
- Average Revenue per Customer
- Average Orders per Customer

Visuals:
- Customer Purchase Distribution
- Top Customers by Revenue
- Orders per Customer
- Revenue Segments

---

# 📊 Key Insights

- The United Kingdom generated the highest revenue among all countries.
- A small group of products contributed significantly to total revenue.
- Most customers were repeat buyers, indicating strong customer retention.
- RFM segmentation identified high-value customers suitable for loyalty campaigns.
- Churn analysis highlighted customers requiring re-engagement strategies.
- Monthly revenue showed seasonal peaks during high-demand periods.

---

# 📁 Repository Structure

```
ecommerce_customer_retention_analysis/
│
├── data/
│
├── sql/
│   ├── 00_database_setup.sql
│   ├── 01_data_exploration.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_rfm_analysis.sql
│   ├── 05_customer_retention.sql
│   └── 06_customer_churn_analysis.sql
│
├── python/
│   └── ecommerce_analysis.ipynb
│
├── powerbi/
│   └── ecommerce_dashboard.pbix
│
├── images/
│   ├── executive_dashboard.png
│   ├── sales_performance_dashboard.png
│   └── customer_analytics_dashboard.png
│
└── README.md
```

---

# 💼 Skills Demonstrated

- SQL Query Writing
- Data Cleaning
- Aggregate Functions
- Window Functions (NTILE)
- Views
- CASE Statements
- Customer Segmentation
- RFM Analysis
- Customer Retention Analysis
- Customer Churn Analysis
- Exploratory Data Analysis (EDA)
- Dashboard Design
- Business Intelligence
- Data Visualization

---

# 🚀 Future Improvements

- Build a sales forecasting model using Python.
- Develop customer lifetime value (CLV) prediction models.
- Automate data refresh using Python scripts.
- Publish dashboards using Power BI Service.

---

# 👩‍💻 Author

**Saritha Cheruku**

**Aspiring Data Analyst**

**Skills:** SQL • Power BI • Python • Excel • MySQL

📍 Hyderabad, India

---

## ⭐ If you found this project useful, feel free to star this repository!

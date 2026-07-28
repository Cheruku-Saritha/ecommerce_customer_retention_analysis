/*
===============================================================================
Project Name : E-Commerce Customer Retention & Sales Analytics
Author       : Saritha Cheruku
Database     : MySQL
Dataset      : Online Retail II (2009–2011)

Project Description
-------------------
This project analyzes customer purchasing behavior, sales performance,
customer retention, RFM segmentation, and churn using the Online Retail II
dataset.

Skills Demonstrated
-------------------
• Data Exploration
• Aggregate Functions
• Date Functions
• Window Functions
• Views
• CASE Statements
• Customer Segmentation
• Business Analytics

===============================================================================
*/

-- =============================================================================
-- SECTION 1 : DATABASE SETUP & DATA PREPARATION
-- =============================================================================
-- Objective:
-- Combine the two retail datasets into a single table and prepare the data
-- for analysis.
-- =============================================================================

-- Create Database

CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

-- =============================================================================
-- Preview Source Tables
-- =============================================================================

SELECT *
FROM `online_retail_ 2009_2010`
LIMIT 10;

SELECT *
FROM `online_retail_ii 2010-2011`
LIMIT 10;

-- =============================================================================
-- Count Records in Each Dataset
-- =============================================================================

SELECT COUNT(*) AS Total_Rows_2009_2010
FROM `online_retail_ 2009_2010`;

SELECT COUNT(*) AS Total_Rows_2010_2011
FROM `online_retail_ii 2010-2011`;

-- =============================================================================
-- Review Table Structure
-- =============================================================================

DESCRIBE `online_retail_ 2009_2010`;

DESCRIBE `online_retail_ii 2010-2011`;

-- =============================================================================
-- Merge Both Datasets
-- =============================================================================

CREATE TABLE online_retail AS

SELECT *
FROM `online_retail_ 2009_2010`

UNION ALL

SELECT *
FROM `online_retail_ii 2010-2011`;

-- =============================================================================
-- Convert Invoice Date to DATETIME
-- =============================================================================

ALTER TABLE online_retail
ADD COLUMN Invoice_Date DATETIME;

SET SQL_SAFE_UPDATES = 0;

UPDATE online_retail
SET Invoice_Date = STR_TO_DATE(
    InvoiceDate,
    '%d-%m-%Y %H:%i'
);

SET SQL_SAFE_UPDATES = 1;

-- =============================================================================
-- Validate Combined Dataset
-- =============================================================================

SELECT COUNT(*) AS Total_Rows
FROM online_retail;

SELECT *
FROM online_retail
LIMIT 10;
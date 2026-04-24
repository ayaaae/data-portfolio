-- =========================================
-- SALES PERFORMANCE PROJECT (CLEAN VERSION)
-- Author: Aya Rah
-- =========================================


-- =========================================
-- 1. CREATE DATABASE
-- =========================================
CREATE DATABASE IF NOT EXISTS sales_project;
USE sales_project;


-- =========================================
-- 2. MAIN TABLE STRUCTURE
-- =========================================
CREATE TABLE IF NOT EXISTS sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name TEXT,
    Sales DECIMAL(10,2)
);


-- =========================================
-- 3. CLEANED TABLE CREATION
-- =========================================
CREATE TABLE clean_sales AS
SELECT
    `Row ID`,
    `Order ID`,
    STR_TO_DATE(`Order Date`, '%m/%d/%Y') AS order_date,
    STR_TO_DATE(`Ship Date`, '%m/%d/%Y') AS ship_date,
    `Ship Mode`,
    `Customer ID`,
    `Customer Name`,
    Segment,
    Country,
    City,
    State,
    `Postal Code`,
    Region,
    `Product ID`,
    Category,
    `Sub-Category`,
    `Product Name`,
    Sales
FROM sales;


-- =========================================
-- 4. DATA EXPLORATION
-- =========================================
SELECT * FROM clean_sales LIMIT 5;

DESCRIBE clean_sales;


-- =========================================
-- 5. MISSING VALUES CHECK
-- =========================================
SELECT
    COUNT(*) - COUNT(`Row ID`) AS missing_row_id,
    COUNT(*) - COUNT(`Order ID`) AS missing_order_id,
    COUNT(*) - COUNT(order_date) AS missing_order_date,
    COUNT(*) - COUNT(ship_date) AS missing_ship_date,
    COUNT(*) - COUNT(`Ship Mode`) AS missing_ship_mode,
    COUNT(*) - COUNT(`Customer ID`) AS missing_customer_id,
    COUNT(*) - COUNT(`Customer Name`) AS missing_customer_name,
    COUNT(*) - COUNT(Segment) AS missing_segment,
    COUNT(*) - COUNT(Country) AS missing_country,
    COUNT(*) - COUNT(City) AS missing_city,
    COUNT(*) - COUNT(State) AS missing_state,
    COUNT(*) - COUNT(`Postal Code`) AS missing_postal_code,
    COUNT(*) - COUNT(Region) AS missing_region,
    COUNT(*) - COUNT(Category) AS missing_category,
    COUNT(*) - COUNT(`Sub-Category`) AS missing_sub_category,
    COUNT(*) - COUNT(`Product Name`) AS missing_product_name,
    COUNT(*) - COUNT(Sales) AS missing_sales
FROM clean_sales;


-- =========================================
-- 6. DUPLICATES CHECK
-- =========================================

-- Check duplicate orders
SELECT `Order ID`, COUNT(*) AS occurrences
FROM clean_sales
GROUP BY `Order ID`
HAVING COUNT(*) > 1;


-- Full duplicate rows
SELECT
    `Row ID`, `Order ID`, order_date, ship_date, `Ship Mode`,
    `Customer ID`, `Customer Name`, Segment, Country, City,
    State, `Postal Code`, Region, `Product ID`, Category,
    `Sub-Category`, `Product Name`, Sales,
    COUNT(*) AS total_occurrences
FROM clean_sales
GROUP BY
    `Row ID`, `Order ID`, order_date, ship_date, `Ship Mode`,
    `Customer ID`, `Customer Name`, Segment, Country, City,
    State, `Postal Code`, Region, `Product ID`, Category,
    `Sub-Category`, `Product Name`, Sales
HAVING COUNT(*) > 1;


-- =========================================
-- 7. FINAL CHECK
-- =========================================
SELECT COUNT(*) FROM clean_sales;
DAX Measures – Sales Performance Dashboard

This file documents the key DAX measures used in the Power BI dashboard.
Each measure is designed to support business insights related to sales performance, customer behavior, and growth trends.

=> Core Metrics
1. Total Sales
Total Sales = SUM(clean_sales[Sales])

Description:
Calculates the total revenue generated across all transactions.

2. Total Orders
Total Orders = DISTINCTCOUNT(clean_sales[Order ID])

Description:
Counts the number of unique orders placed.

3. Total Customers
Total Costumers = DISTINCTCOUNT(clean_sales[Customer ID])

Description:
Counts the number of unique customers.

=> Performance Metrics
4. Average Order Value (AOV)
AOV = DIVIDE([Total Sales], [Total Orders])

Description:
Measures the average revenue generated per order.

5. Sales per Customer
Sales per Customer = DIVIDE([Total Sales], [Total Costumers])

Description:
Indicates how much revenue each customer generates on average.

=> Time Intelligence
6. Sales Last Year (LY)
Sales LY = 
CALCULATE(
    [Total Sales],
    SAMEPERIODLASTYEAR(date_table[Date])
)

Description:
Calculates total sales for the same period in the previous year.

7. Year-over-Year Growth (%)
YoY Growth % = 
DIVIDE([Total Sales] - [Sales LY], [Sales LY])

Description:
Measures the percentage growth (or decline) in sales compared to last year.

=> Key Insights from Dashboard
Sales show a positive year-over-year growth trend (~4.7%)
A small number of customers contribute significantly to total revenue
Certain product categories (e.g., Technology) dominate total sales
Monthly sales show variability, indicating seasonality patterns

=> Notes
All measures are built on the clean_sales dataset
A dedicated date_table is used for time intelligence calculations
DIVIDE() is used instead of / to handle division by zero safely
/*
===============================================================================
Time Range Check
===============================================================================
Purpose:
    - Define the valid time range for analysis.
	
SQL Functions Used:
    - MIN()
    - MAX()
    - DATEDIFF()

===============================================================================
*/

-- What is the earliest date ?

SELECT MIN(order_date) AS first_order_date
FROM gold.fact_sales;

-- What is the latest date ?

SELECT MAX(order_date) AS last_order_date
FROM gold.fact_sales;

-- Are there missing date ?

SELECT order_date
FROM gold.fact_sales
WHERE order_date IS NULL;

-- What is the time range of the dataset?

SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_month
FROM gold.fact_sales;

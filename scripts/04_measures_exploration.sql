/*
===============================================================================
Measure Exploration
===============================================================================
Purpose:
    - Analyze high-level business metrics to get a quick overview of overall performance.
	
SQL Functions Used:
    - AVG()
    - SUM()
    - COUNT()

===============================================================================
*/

-- What are the mean and total values of measures? (sales , orders , ...)

SELECT AVG(sales_amount) AS average_sale
FROM gold.fact_sales;

SELECT SUM(sales_amount) AS total_sale
FROM gold.fact_sales;

SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales;

SELECT COUNT(order_number) AS total_orders
FROM gold.fact_sales;

SELECT COUNT(product_name) AS total_products
FROM gold.dim_products

SELECT COUNT(customer_key) AS total_customers 
FROM gold.dim_customers;

-- Combine report

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;

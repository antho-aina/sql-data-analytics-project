/*
===============================================================================
Compare & Rank (Magnitude + Ranking)
===============================================================================
Purpose:
    - Identify best and worst performers.
	
SQL Functions Used:
    - SUM()
    - COUNT()
    - GROUP BY , ORDER BY ... ASC/DESC
    - TOP
===============================================================================
*/

-- Which product category generates the most sales?
SELECT
    category,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON s.product_key = p.product_key
GROUP BY category
ORDER BY total_sales DESC;

-- Which product generates the most sales?
SELECT 
    product_name,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON s.product_key = p.product_key
GROUP BY category, product_name
ORDER BY total_sales DESC;

-- Which product is bought the most?
SELECT 
    product_name,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON s.product_key = p.product_key
GROUP BY category, product_name
ORDER BY total_quantity DESC;

-- Which customer generates the most sales?
SELECT 
    first_name,
    last_name,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY first_name, last_name
ORDER BY total_sales DESC;

-- How many times has each customer made a purchase?
SELECT 
    first_name,
    last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY first_name, last_name
ORDER BY total_orders DESC;

-- Which country has the highest sales?
SELECT 
    country,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY country
ORDER BY total_sales DESC;

-- How many products did each country buy?
SELECT 
    country,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY country
ORDER BY total_quantity DESC;

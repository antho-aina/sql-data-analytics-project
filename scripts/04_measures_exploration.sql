/*
===============================================================================
Measures Validation
===============================================================================
Purpose:
    - Make sure the numbers make sense.
	
SQL Functions Used:
    - SUM()
	- COUNT()
	- AVG()
	- MIN()
	- MAX()
===============================================================================
*/

-- Total number of orders
SELECT COUNT(order_number) AS total_order 
FROM gold.fact_sales;

-- Average sale amount
SELECT AVG(sales_amount) AS average_sale 
FROM gold.fact_sales;

-- Minimum sale amount
SELECT MIN(sales_amount) AS minimum_sale 
FROM gold.fact_sales;

-- Maximum sale amount
SELECT MAX(sales_amount) AS maximum_sale 
FROM gold.fact_sales;

-- Total sales amount
SELECT SUM(sales_amount) AS total_sale 
FROM gold.fact_sales;

-- Total units sold
SELECT SUM(quantity) AS total_product_sold 
FROM gold.fact_sales;

-- Total number of products
SELECT COUNT(product_key) AS total_product
FROM gold.dim_products;

-- Total number of customers
SELECT COUNT(customer_key) AS total_customer
FROM gold.dim_customers;

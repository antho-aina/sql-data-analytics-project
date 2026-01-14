/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - Analyzing to understand distribution andgrouping
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_products;

-- What dimensions exist ?

SELECT DISTINCT country
FROM gold.dim_customers;

SELECT DISTINCT gender
FROM gold.dim_customers;

SELECT DISTINCT 
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY 
    category,
    subcategory,
    product_name;

SELECT DISTINCT product_line
FROM gold.dim_products;

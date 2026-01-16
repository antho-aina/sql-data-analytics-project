/*
===============================================================================
Dimensions Check
===============================================================================
Purpose:
    - Ensure categories are usable for grouping and comparison.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- What are the different values in country column ?
SELECT DISTINCT country
FROM gold.dim_customers;

-- What are the different values in gender column ?
SELECT DISTINCT gender
FROM gold.dim_customers;

-- What are the different values in product category column ?
SELECT DISTINCT 
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY 
    category,
    subcategory,
    product_name;

/*
===============================================================================
Contribution & Grouping
===============================================================================
Purpose:
    - Understand how parts contribute to the whole.
	
SQL Functions Used:
    - SUM()
    - ROUND()
    - CAST()
    - GROUP BY
    - ORDER BY
    - CAST()
    - GETDATE()
    - DATEDIFF()
===============================================================================
*/

-- How much does each category contribute to total sales?
WITH category_total_sales AS (
SELECT 
    category,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON s.product_key = p.product_key
GROUP BY category)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND(CAST(total_sales AS float) / SUM(total_sales) OVER () * 100, 2) AS percentage_contribution
FROM category_total_sales
ORDER BY total_sales DESC;

-- How much does each country contribute to total sales?
WITH country_total_sales AS (
SELECT 
    country,
    SUM(sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
GROUP BY country)
SELECT
    country,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND(CAST(total_sales AS float) / SUM(total_sales) OVER () * 100, 2) AS percentage_contribution
FROM country_total_sales
ORDER BY total_sales DESC;

-- Sales contribution by age group
WITH sales_per_age_group AS (
SELECT
    CASE WHEN DATEDIFF(YEAR, birthdate, order_date) BETWEEN 0 AND 17 THEN '0-17'
         WHEN DATEDIFF(YEAR, birthdate, order_date) BETWEEN 18 AND 24 THEN '18-24'
         WHEN DATEDIFF(YEAR, birthdate, order_date) BETWEEN 25 AND 34 THEN '25-34'
         WHEN DATEDIFF(YEAR, birthdate, order_date) BETWEEN 35 AND 44 THEN '35-44'
         ELSE '44+'
    END AS customer_age_group,
    sales_amount
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON s.customer_key = c.customer_key
)
,total_age_groups_sales AS (
SELECT 
    customer_age_group,
    SUM(sales_amount) AS total_sales
FROM sales_per_age_group
GROUP BY customer_age_group)
SELECT
    customer_age_group,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND(CAST(total_sales AS float) / SUM(total_sales) OVER () * 100, 2) AS percentage_contribution
FROM total_age_groups_sales
ORDER BY customer_age_group;

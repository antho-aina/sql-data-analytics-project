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
	- MIN()
	- MAX()
    - DATEDIFF()
===============================================================================
*/

-- How many products fall into each price range?
WITH cost_segment AS(
SELECT
    product_key,
    product_name,
    cost,
    CASE WHEN cost <= 0 THEN 'n/a'
         WHEN cost BETWEEN 1 AND 99 THEN 'Below 100'
         WHEN cost BETWEEN 100 AND 500 THEN '100-500'
         WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
         ELSE 'Above 1000'
    END AS cost_range
FROM gold.dim_products)

SELECT
    cost_range,
    COUNT(product_key) AS total_products
FROM cost_segment
WHERE cost_range != 'n/a'
GROUP BY cost_range
ORDER BY total_products DESC;

/*
Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;

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

-- Customer age group
SELECT
    customer_age_group,
    COUNT(customer_key) AS customer_number
FROM(
    SELECT
        customer_key,
        CASE WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 0 AND 17 THEN '0-17'
             WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 18 AND 24 THEN '18-24'
             WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 25 AND 34 THEN '25-34'
             WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 35 AND 44 THEN '35-44'
             ELSE '44+'
        END AS customer_age_group
    FROM gold.dim_customers
)t 
GROUP BY customer_age_group
ORDER BY customer_age_group;

-- Sales contribution by age group when did purchase
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



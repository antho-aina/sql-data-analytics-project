/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors
	- This script will create drop any view named gold.report_customers and will
	create new one.

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend

Warning:
	This script will dorp any view named gold.report_customers and replace it 
with a new one
===============================================================================
*/

-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================

IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS

WITH base_query AS
(
/*
---------------------------------------------------------------------------
Base Query: Retrieves core columns from tables
---------------------------------------------------------------------------
*/
	SELECT
		s.order_number,
		s.customer_key,
		s.order_date,
		s.sales_amount,
		s.quantity,
		c.customer_number,
		CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		DATEDIFF(YEAR, birthdate, GETDATE()) AS age
	FROM gold.fact_sales s 
	INNER JOIN gold.dim_customers c 
		ON s.customer_key = c.customer_key
)
,customer_aggregation AS (
/*
---------------------------------------------------------------------------
Customer Aggregations: Summarizes key metrics at the customer level
---------------------------------------------------------------------------
*/
	SELECT
		customer_key,
		customer_number,
		customer_name,
		age,
		DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) as month_lifespan,
		MAX(order_date) AS last_order_date,
		COUNT(order_number) AS total_orders,
		SUM(sales_amount) AS total_sales,
		SUM(quantity) AS total_quantity
	FROM base_query
	GROUP BY 
		customer_key,
		customer_number,
		customer_name, 
		age
)

SELECT
	customer_key,
	customer_number,
	customer_name,
	age,
	CASE 
		WHEN age IS NULL THEN ''
		WHEN age <= 17 THEN 'Less than 17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE 'Above 44'
    END AS age_group,
	month_lifespan,
	CASE 
		WHEN month_lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
		WHEN month_lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
		ELSE 'New'
	END AS customer_segment,
	last_order_date,
	DATEDIFF(month, last_order_date, GETDATE()) AS recency,
	total_orders,
	total_sales,
	total_quantity,
	-- Compuate average order value (AVO)
	CASE 
		WHEN total_sales = 0 THEN 0
		ELSE total_sales / total_orders
	END AS avg_order_value,
	-- Compuate average monthly spend
	CASE 
		WHEN month_lifespan = 0 THEN total_sales
		ELSE total_sales / month_lifespan
	END AS avg_monthly_spend
FROM customer_aggregation

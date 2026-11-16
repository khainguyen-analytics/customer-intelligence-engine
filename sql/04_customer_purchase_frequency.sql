-- Customer Intelligence Engine
-- 04: Customer Purchase Frequency
-- Business question:
-- How many customers purchase once versus multiple times?

WITH customer_orders AS (
    SELECT
        CAST("Customer ID" AS INTEGER) AS customer_id,
        COUNT(DISTINCT Invoice) AS total_orders

    FROM read_csv_auto(
        'data/processed/sales_clean.csv',
        types = {'Invoice': 'VARCHAR'}
    )

    WHERE "Customer ID" IS NOT NULL
        AND NOT regexp_matches(Invoice, '[A-Za-z]')

    GROUP BY "Customer ID"
)

SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time customer'
        ELSE 'Repeat customer'
    END AS customer_type,

    COUNT(*) AS total_customers,
    ROUND(AVG(total_orders), 2) AS average_orders

FROM customer_orders

GROUP BY customer_type

ORDER BY total_customers DESC;


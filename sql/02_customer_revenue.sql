-- Customer Intelligence Engine
-- 02: Customer Revenue Analysis
-- Business question:
-- Which customers generate the most revenue?

SELECT
    CAST("Customer ID" AS INTEGER) AS customer_id,
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(TotalSales), 2) AS total_revenue,
    ROUND(
        SUM(TotalSales) / COUNT(DISTINCT Invoice),
        2
    ) AS average_order_value

FROM read_csv_auto(
    'data/processed/sales_clean.csv',
    types = {'Invoice': 'VARCHAR'}
)

WHERE "Customer ID" IS NOT NULL
    AND NOT regexp_matches(Invoice, '[A-Za-z]')

GROUP BY "Customer ID"

ORDER BY total_revenue DESC

LIMIT 10;


-- Customer Intelligence Engine
-- 01: Sales Overview
-- Business question:
-- What is the overall sales performance?

SELECT
    COUNT(*) AS total_transaction_lines,
    COUNT(DISTINCT Invoice) AS total_orders,
    COUNT(DISTINCT "Customer ID") AS total_customers,
    ROUND(SUM(TotalSales), 2) AS total_revenue,
    ROUND(SUM(TotalSales) / COUNT(DISTINCT Invoice), 2)
        AS average_order_value
FROM read_csv_auto(
    'data/processed/sales_clean.csv',
    types = {'Invoice': 'VARCHAR'}
)
WHERE NOT regexp_matches(Invoice, '[A-Za-z]');






-- Customer Intelligence Engine
-- 05: Monthly Sales Trends
-- Business question:
-- How does gross sales revenue change over time?

SELECT
    DATE_TRUNC('month', InvoiceDate) AS sales_month,

    COUNT(DISTINCT Invoice) AS total_orders,

    ROUND(SUM(TotalSales), 2) AS gross_revenue

FROM read_csv_auto(
    'data/processed/sales_clean.csv',
    types = {'Invoice': 'VARCHAR'}
)

WHERE NOT regexp_matches(Invoice, '[A-Za-z]')

GROUP BY sales_month

ORDER BY sales_month;


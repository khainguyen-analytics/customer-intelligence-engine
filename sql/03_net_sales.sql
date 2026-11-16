-- Customer Intelligence Engine
-- 03: Net Sales Analysis
-- Business question:
-- How do cancellations affect recorded revenue?

WITH sales AS (
    SELECT
        SUM(TotalSales) AS gross_sales
    FROM read_csv_auto(
        'data/processed/sales_clean.csv',
        types = {'Invoice': 'VARCHAR'}
    )
    WHERE NOT regexp_matches(Invoice, '[A-Za-z]')
),

cancellations AS (
    SELECT
        SUM(
            TRY_CAST(Quantity AS DOUBLE) *
            TRY_CAST(Price AS DOUBLE)
        ) AS cancellation_value
    FROM read_csv_auto(
        'data/processed/cancelled_transactions.csv',
        all_varchar = true
    )
    WHERE TRY_CAST(Quantity AS DOUBLE) < 0
)

SELECT
    ROUND(gross_sales, 2) AS gross_sales,
    ROUND(cancellation_value, 2) AS recorded_cancellations,
    ROUND(gross_sales + cancellation_value, 2)
        AS provisional_net_sales
FROM sales
Cross JOIN cancellations;
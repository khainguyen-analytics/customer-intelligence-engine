
-- Customer Intelligence Engine
-- 03: Sales and Cancellation Analysis
-- Business question:
-- What is the value of cleaned sales and recorded cancellations?

WITH sales AS (
    SELECT
        SUM(TotalSales) AS cleaned_sales_revenue
    FROM read_csv_auto(
        'data/processed/sales_clean.csv',
        types = {'Invoice': 'VARCHAR'}
    )
),

cancellations AS (
    SELECT
        SUM(
            ABS(TRY_CAST(Quantity AS DOUBLE)) *
            TRY_CAST(Price AS DOUBLE)
        ) AS recorded_cancellation_value
    FROM read_csv_auto(
        'data/processed/cancelled_transactions.csv',
        all_varchar = true
    )
    WHERE TRY_CAST(Quantity AS DOUBLE) < 0
      AND TRY_CAST(Price AS DOUBLE) > 0
)

SELECT
    ROUND(cleaned_sales_revenue, 2)
        AS cleaned_sales_revenue,
    ROUND(recorded_cancellation_value, 2)
        AS recorded_cancellation_value
FROM sales
CROSS JOIN cancellations;

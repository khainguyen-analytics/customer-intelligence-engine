-- Customer Intelligence Engine
-- 06: Customer Segment Performance
-- Business question:
-- Which customer segments contribute the most revenue?

SELECT
    Segment AS customer_segment,

    COUNT(*) AS total_customers,

    ROUND(SUM(Monetary), 2) AS total_revenue,

    ROUND(AVG(Monetary), 2) AS average_customer_value,

    ROUND(AVG(Frequency), 2) AS average_purchase_frequency,

    ROUND(
        100.0 * SUM(Monetary)
        / SUM(SUM(Monetary)) OVER (),
        2
    ) AS revenue_percentage

FROM read_csv_auto(
    'data/processed/customer_segments.csv'
)

GROUP BY Segment

ORDER BY total_revenue DESC;


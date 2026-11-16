-- Customer Intelligence Engine
-- 08: High-Value Customers at Risk
-- Business question:
-- Which historically valuable customers have a low
-- predicted probability of purchasing again?

SELECT
    "Customer ID" AS customer_id,

    ROUND(Monetary, 2) AS historical_value,

    Recency AS days_since_last_purchase,

    Frequency AS previous_orders,

    ROUND(PurchaseProbability * 100, 2)
        AS repeat_purchase_probability_pct,

    LikelihoodGroup AS likelihood_group

FROM read_csv_auto(
    'data/processed/customer_predictions.csv'
)

WHERE Monetary >= 2137.30
    AND PurchaseProbability < 0.20

ORDER BY Monetary DESC;
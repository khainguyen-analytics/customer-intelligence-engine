-- Customer Intelligence Engine
-- 07: Customer Prediction Analysis
-- Business question:
-- How do predicted repeat purchases vary by likelihood group?

SELECT
    LikelihoodGroup AS likelihood_group,

    COUNT(*) AS total_customers,

    ROUND(AVG(PurchaseProbability) * 100, 2)
        AS average_purchase_probability_pct,

    SUM(PredictedRepeatPurchase)
        AS predicted_repeat_customers,

    ROUND(AVG(Monetary), 2)
        AS average_historical_value

FROM read_csv_auto(
    'data/processed/customer_predictions.csv'
)

GROUP BY LikelihoodGroup

ORDER BY average_purchase_probability_pct DESC;


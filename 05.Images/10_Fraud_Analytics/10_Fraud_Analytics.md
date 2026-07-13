10_Fraud_Analytics

SELECT payment_app,
COUNT(*) TotalTransactions,
SUM(CASE WHEN is_fraud=1 THEN 1 END) FraudTransactions
FROM staging.transactions
GROUP BY payment_app;

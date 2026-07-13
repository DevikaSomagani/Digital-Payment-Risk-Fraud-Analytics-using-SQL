08_Exploratory_Data_Analysis

SELECT payment_app,
COUNT(*) TotalTransactions
FROM staging.transactions
GROUP BY payment_app
ORDER BY TotalTransactions DESC;

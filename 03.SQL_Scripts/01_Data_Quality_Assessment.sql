-- Row Count Validation
SELECT COUNT(*) AS Users_Count
FROM staging.Users;

SELECT COUNT(*) AS Merchants_Count
FROM staging.Merchants;

SELECT COUNT(*) AS Transactions_Count
FROM staging.Transactions;

-- Primary Key Validation
Select user_id,count(*) from staging.users
group by user_id
having count(*)>1

Select merchant_id,count(*) from staging.merchants
group by merchant_id
having count(*)>1

Select transaction_id,count(*) from staging.transactions
group by transaction_id
having count(*)>1

-- Missing Values
SELECT count(*)
FROM staging.Transactions
WHERE transaction_velocity IS NULL;

SELECT count(*)
FROM staging.transactions
WHERE  time_since_last_txn_min IS NULL;

SELECT count(*)
FROM staging.transactions
WHERE  amount_deviation_score IS NULL;

-- Domain Validation
select status,count(*)
from staging.transactions
group by status

select receiver_type,count(*)
from staging.transactions
group by receiver_type;

select is_fraud,count(*)
from staging.transactions
group by is_fraud;

SELECT payment_app, COUNT(*) AS Total
FROM staging.Transactions
GROUP BY payment_app
ORDER BY Total DESC;

SELECT transaction_type, COUNT(*) AS Total
FROM staging.Transactions
GROUP BY transaction_type
ORDER BY Total DESC;

-- Data Range Validation
SELECT MIN(time_since_last_txn_min) AS Minimum_Value,
       MAX(time_since_last_txn_min) AS Maximum_Value
FROM staging.Transactions;

SELECT
    MIN(amount) AS Min_Amount,
    MAX(amount) AS Max_Amount,
    AVG(amount) AS Avg_Amount
FROM staging.Transactions;

SELECT
    MIN(balance_after_transaction) AS Min_Balance,
    MAX(balance_after_transaction) AS Min_Balance
FROM staging.Transactions;

SELECT
    MIN(user_loyalty_score) AS Min_loyalty_score,
    MAX(user_loyalty_score) AS Max_loyalty_score
FROM staging.Transactions;

-- Foreign Key Validation
select t.user_id as transactions
from staging.transactions as t
left join staging.users as u
on t.user_id = u.user_id
where u.user_id is null;

-- Fraud Distribution
SELECT
    is_fraud,
    COUNT(*) AS Total,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()),2) AS Percentage
FROM staging.Transactions
GROUP BY is_fraud;

-- Business Rule Validation
--Negative Amounts
SELECT count(*)
FROM staging.Transactions
WHERE amount <= 0;

-- Invalid Hours
SELECT count(*)
FROM staging.Transactions
WHERE hour_of_day NOT BETWEEN 0 AND 23;

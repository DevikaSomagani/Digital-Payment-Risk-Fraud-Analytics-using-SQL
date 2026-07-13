-- Module 1: Overall Fraud Overview

-- 1. What is the overall fraud rate on the platform?
-- Total transactions
select count(*) total_transactions
from staging.transactions;

-- no of Fraud , genuine transactions and their percentages
WITH fraud_data AS (
    SELECT
        CASE
            WHEN is_fraud = 0 THEN 'Genuine'
            WHEN is_fraud = 1 THEN 'Fraud'
        END AS fraud
    FROM staging.transactions
)
SELECT
    fraud as transaction_type,
    COUNT(*) AS transactions_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM staging.transactions), 2) AS transaction_percentage
FROM fraud_data
GROUP BY fraud 
order by transactions_count DESC;

-- 2. How much money was lost to fraudulent transactions?
-- Total transaction amount
select sum(amount) total_transaction_amount 
from staging.transactions;

-- Total fraud amount and Fraud amount percentage
select count(*) no_of_frauds_transactions,
(select sum(amount) from staging.transactions) total_amount,
sum(amount) fraud_transactions_amount,
ROUND(sum(amount)*100.0/ (Select sum(amount) from staging.transactions),2) Fraud_amount_percentage
from staging.transactions
where is_fraud =1;

-- Module 2: User Risk Analysis
-- Do high-risk users commit more fraud?
SELECT
u.is_high_risk_user,
COUNT(*) Total_Transactions,
SUM(CASE WHEN t.is_fraud=1 THEN 1 ELSE 0 END) Fraud_Transactions,
ROUND(
SUM(CASE WHEN t.is_fraud=1 THEN 1.0 ELSE 0 END)*100
/
COUNT(*)
,2) Fraud_Rate
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY u.is_high_risk_user
order by Fraud_Transactions DESC;

-- Does KYC status affect fraud?
SELECT
    u.kyc_status,
    SUM(CASE WHEN t.is_fraud = 1 THEN 1 ELSE 0 END) AS number_of_frauds
    ,ROUND(
        SUM(CASE WHEN t.is_fraud = 1 THEN 1.0 ELSE 0 END) * 100
        / COUNT(*),
        2
    ) AS fraud_rate
FROM staging.users u
JOIN staging.transactions t
    ON u.user_id = t.user_id
GROUP BY u.kyc_status
order by number_of_frauds DESC;

-- Which age group has the highest fraud rate?
select u.age_group,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.users as u
join staging.transactions as t
on u.user_id=t.user_id
GROUP BY u.age_group
order by no_of_frauds DESC;

-- Module 3: Transaction Behaviour
-- Are night transactions riskier?
select is_night_transaction,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY is_night_transaction
order by no_of_frauds DESC;


-- Do weekends have more fraud?
select is_weekend,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_rate
from staging.transactions as t
GROUP BY is_weekend
order by no_of_frauds DESC;

-- Which transaction type has the highest fraud rate?
select transaction_type,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY transaction_type
order by no_of_frauds DESC;

-- Which payment app has the highest fraud rate?
select payment_app,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY payment_app
order by no_of_frauds DESC;

-- Which device type is most associated with fraud?
select device_type,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY device_type
order by no_of_frauds DESC;

-- Module 4: Fraud Indicators
-- Does using a new device increase fraud?
select new_device_flag,
sum(case when t.is_fraud=1 then 1 else 0 end)  no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY new_device_flag
order by no_of_frauds DESC;

-- Does IP location mismatch increase fraud?
select ip_location_mismatch,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY ip_location_mismatch
order by no_of_frauds DESC;

-- Do failed PIN attempts indicate fraud?
select failed_attempts_last_24h,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY failed_attempts_last_24h
order by no_of_frauds DESC;

-- Does transaction velocity affect fraud?
select transaction_velocity,
sum(case when t.is_fraud=1 then 1 else 0 end) no_of_frauds,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY transaction_velocity
order by no_of_frauds DESC;

-- Does amount deviation indicate fraud?
select is_fraud,avg(amount_deviation_score) Average_amount_deviation,
MIN(amount_deviation_score) minimum_amount_deviation,
MAX(amount_deviation_score) maximum_amount_deviation
from staging.transactions
group by is_fraud;

-- Module 5: Merchant Risk
-- Which merchant categories are most targeted by fraud?
select m.merchant_category,
sum(case when t.is_fraud=1 then 1 else 0 end) fraud_count,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_rate
from staging.merchants as m
join staging.transactions as t
on m.merchant_id=t.receiver_id
where receiver_type='Merchant'
GROUP BY m.merchant_category
order by fraud_count DESC;

-- Which merchant size experiences the highest fraud?
select m.merchant_size,
sum(case when t.is_fraud=1 then 1 else 0 end) fraud_count,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.merchants as m
join staging.transactions as t
on m.merchant_id=t.receiver_id
where receiver_type='Merchant'
GROUP BY m.merchant_size
order by fraud_count DESC;

-- Which cities have the highest fraud?
select receiver_type,
sum(case when t.is_fraud=1 then 1 else 0 end) fraud_count,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) fraud_Rate
from staging.transactions as t
GROUP BY receiver_type
order by fraud_count DESC;

SELECT
u.city,
SUM(CASE WHEN t.is_fraud=1 THEN 1 ELSE 0 END) Fraud_Count,
ROUND(
SUM(CASE WHEN t.is_fraud=1 THEN 1.0 ELSE 0 END)*100
/
COUNT(*)
,2) Fraud_Rate
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY u.city
ORDER BY Fraud_Count DESC;

-- Module 6: High-Value Fraud
-- What are the top 20 highest-value fraudulent transactions?
select top 20
t.transaction_id,t.user_id,m.merchant_name,t.amount,t.payment_app,t.date
from staging.transactions as t
join staging.merchants as m
on t.receiver_id=m.merchant_id
where is_fraud= 1
order by t.amount DESC;

-- Who are the top 10 users with the most fraudulent transactions?
select top 10 
u.user_id,
COUNT(*) AS total_transactions,
sum(case when t.is_fraud=1 then 1 else 0 end) as fraud_transactions,
ROUND(SUM(case when t.is_fraud=1 then 1.0 else 0.0 end)*100 /COUNT(*),2) as fraud_rate
from staging.users as u
join staging.transactions as t
on u.user_id=t.user_id
group by u.user_id
order by fraud_transactions DESC,fraud_rate DESC



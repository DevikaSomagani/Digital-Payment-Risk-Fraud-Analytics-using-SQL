/*1. Fraud Trend by Hour
Questions:
Which hour has the most fraud?
Which hour has the highest fraud amount?*/

select hour_of_day,
COUNT(*) AS Fraud_Transactions,
sum(amount) fraud_amount
from staging.transactions
where is_fraud=1
group by hour_of_day
order by Fraud_Transactions DESC;

/*2. Fraud Trend by Day of Week
Questions:
Which weekday experiences the most fraud?
Which weekday has the highest fraud rate?*/

SELECT
    day_of_week,
    SUM(CASE WHEN is_fraud = 1 THEN amount ELSE 0 END) AS fraud_amount,
    SUM(amount) AS total_amount,
    ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
FROM staging.transactions
GROUP BY day_of_week
ORDER BY Fraud_Rate DESC;

/*3. Fraud by Payment App
Include:
Total Transactions
Fraud Transactions
Fraud Amount
Fraud Rate*/
select payment_app,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by payment_app
order by Fraud_Amount DESC;

/*4. Fraud by Device Type
Compare:Android,iPhone,Web
Metrics:
Transactions
Fraud Count
Fraud Rate*/
select device_type,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by device_type
order by Fraud_Amount DESC;

/*5. Fraud by Transaction Type
Compare:
P2P
Merchant
Recharge
Bill Payment*/
select transaction_type,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by transaction_type
order by Fraud_Amount DESC;

/*6. New Device vs Existing Device
Metrics:
Fraud Rate
Fraud Amount*/
select new_device_flag,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by new_device_flag
order by Fraud_Amount DESC;

/*7. IP Mismatch Analysis
Compare:
Matching IP
Mismatched IP
Metrics:
Fraud Count
Fraud Rate*/
select ip_location_mismatch,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by ip_location_mismatch
order by Fraud_Amount DESC;

/*8. Failed PIN Attempts
Find:
Average failed attempts
Fraud rate by failed attempts*/
select failed_attempts_last_24h,
count(*) total_transactions,
avg(failed_attempts_last_24h) Average_failed_attempt,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by failed_attempts_last_24h
order by Fraud_Amount DESC;

/*9. Transaction Velocity Analysis
Compare:
Low
Medium
High Velocity*/
SELECT
CASE
WHEN transaction_velocity<=1 THEN 'Low'
WHEN transaction_velocity<=3 THEN 'Medium'
ELSE 'High'
END AS Velocity_Category,

COUNT(*) Total_Transactions,

SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) Fraud_Count,

ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100/COUNT(*),
2
) Fraud_Rate

FROM staging.transactions

GROUP BY
CASE
WHEN transaction_velocity<=1 THEN 'Low'
WHEN transaction_velocity<=3 THEN 'Medium'
ELSE 'High'
END;

/*10. Large Transaction Analysis
Example:
Amount > 10000
Questions:
How many are fraud?
Fraud Rate?*/

select 
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100/COUNT(*),
2
)
from staging.transactions
where amount>10000;
/*11. Merchant Fraud Ranking
Output:
Merchant
Fraud Count
Fraud Amount
Fraud Rate
Rank()*/
select *,
rank() over(order by Fraud_Amount desc) AS Merchant_Rank from 
(select m.merchant_name,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions t
join staging.merchants m
on t.receiver_id=m.merchant_id
where receiver_type='Merchant'
group by merchant_name
) k;

/*12. City Fraud Ranking
Business Question
Which cities have the highest fraud?
Output
City
Fraud Transactions
Fraud Amount
Fraud Rate
Rank*/
SELECT
    *,
    RANK() OVER (ORDER BY Fraud_Amount DESC) AS Fraud_Rank
FROM
(
    SELECT
        u.city,
        COUNT(CASE WHEN t.is_fraud = 1 THEN 1 END) AS Fraud_Transactions,
        SUM(CASE WHEN t.is_fraud = 1 THEN t.amount ELSE 0 END) AS Fraud_Amount,
        ROUND(
            SUM(CASE WHEN t.is_fraud = 1 THEN 1.0 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS Fraud_Rate
    FROM staging.transactions t
    JOIN staging.users u
        ON t.user_id = u.user_id
    GROUP BY u.city
) AS CityFraud
ORDER BY Fraud_Rank;

/*13. User Fraud Ranking
Business Question
Which users contribute the most fraud?
Output
User ID
Fraud Transactions
Fraud Amount
Fraud Rate
Rank*/
SELECT
    *,
    RANK() OVER (ORDER BY Fraud_Amount DESC) AS Fraud_Rank
FROM
(
    SELECT
        user_id,
        SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Fraud_Transactions,
        SUM(CASE WHEN is_fraud = 1 THEN amount ELSE 0 END) AS Fraud_Amount,
        ROUND(
            SUM(CASE WHEN is_fraud = 1 THEN 1.0 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS Fraud_Rate
    FROM staging.transactions
    GROUP BY user_id
) AS UserFraud
ORDER BY Fraud_Rank;

/*14. Fraud Amount Distribution
Buckets:
0–1000
1000–5000
5000–10000
10000+*/
WITH fraud_buckets AS (
    SELECT
        amount,
        CASE
            WHEN amount < 1000 THEN '0 - 999'
            WHEN amount < 5000 THEN '1000 - 4999'
            WHEN amount < 10000 THEN '5000 - 9999'
            ELSE '10000+'
        END AS amount_bucket
    FROM staging.transactions
    WHERE is_fraud = 1
)
SELECT
    amount_bucket,
    COUNT(*) AS fraud_transactions,
    SUM(amount) AS fraud_amount,
    AVG(amount) AS average_fraud_amount
FROM fraud_buckets
GROUP BY amount_bucket
ORDER BY
    CASE amount_bucket
        WHEN '0 - 999' THEN 1
        WHEN '1000 - 4999' THEN 2
        WHEN '5000 - 9999' THEN 3
        ELSE 4
    END;

/*15. Top Fraud Combination
Find combinations such as:
Payment App + Device
Payment App + Transaction Type
City + Payment App*/

-- Payment App + Device
SELECT
    payment_app,
    device_type,
    COUNT(*) AS fraud_transactions,
    SUM(amount) AS fraud_amount
FROM staging.transactions
WHERE is_fraud = 1
GROUP BY
    payment_app,
    device_type
ORDER BY
    fraud_amount DESC;

-- Payment App + Transaction Type
SELECT
    payment_app,
    transaction_type,
    COUNT(*) AS fraud_transactions,
    SUM(amount) AS fraud_amount
FROM staging.transactions
WHERE is_fraud = 1
GROUP BY
    payment_app,
    transaction_type
ORDER BY
    fraud_amount DESC;

-- City + Payment App
SELECT
    u.city,
    t.payment_app,
    COUNT(*) AS fraud_transactions,
    SUM(t.amount) AS fraud_amount
FROM staging.transactions t
JOIN staging.users u
    ON t.user_id = u.user_id
WHERE t.is_fraud = 1
GROUP BY
    u.city,
    t.payment_app
ORDER BY
    fraud_amount DESC;

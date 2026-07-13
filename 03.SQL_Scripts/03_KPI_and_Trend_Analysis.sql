-- KPI & Trend Analysis

-- Monthly Transaction Volume
select month(date) month ,count(transaction_id) transaction_count
from staging.transactions
group by month(date)
order by month(date)

-- Monthly Fraud Rate
select month(date) month ,
count(transaction_id) transaction_count, 
SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) AS Fraud_Transactions,
    ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
from staging.transactions
group by month(date)
order by month

-- Monthly Transaction Amount
select month(date) month ,sum(amount) transaction_amount
from staging.transactions
group by month(date)
order by month(date)
 
-- Monthly Fraud Amount
select month(date) month ,sum(amount) fraud_amount
from staging.transactions
where is_fraud=1
group by month(date)
order by month(date)

-- Monthly Fraud Amount Rate
SELECT
    MONTH(date) AS month,
    SUM(amount) AS Total_Amount,
    SUM(CASE WHEN is_fraud=1 THEN amount ELSE 0 END) AS Fraud_Amount,
    ROUND(
        SUM(CASE WHEN is_fraud=1 THEN amount ELSE 0 END)
        *100/SUM(amount),
        2
    ) AS Fraud_Amount_Percentage
FROM staging.transactions
GROUP BY MONTH(date)
ORDER BY month;

-- Average Transaction Amount
select month(date) month ,avg(amount) avg_transaction_amount
from staging.transactions
group by month(date)
order by month(date)

-- Average Fraud Amount
select month(date) month ,avg(amount) Avg_fraud_amount
from staging.transactions
where is_fraud=1
group by month(date)
order by month(date)

-- Monthly Active Users
select month(date) month ,count(distinct t.user_id) 
from staging.transactions t
join staging.users u
on u.user_id=t.user_id
group by month(date)
order by month(date)

-- Top Payment App Every Month
select * from
(select month(date) month ,payment_app,count(payment_app) payment_count,
RANK() OVER(partition by month(date) order by count(payment_app) desc) rn
from staging.transactions 
group by month(date),payment_app
)t where rn=1
order by month

-- Top Merchant Category Every Month
select * from
(select month(t.date) month ,m.merchant_category,count(m.merchant_category) merchant_category_count,
RANK() OVER(partition by month(t.date) order by count(m.merchant_category) desc) rn
from staging.transactions t
join staging.merchants m
on m.merchant_id=t.receiver_id
group by month(date),m.merchant_category
)t where rn=1
order by month

-- Growth Rate Month over Month
select *,
ROUND(CAST((Current_month_transactions - Previous_month_transactions) AS float)
/Previous_month_transactions*100,2) as mom from
(
select month(date) month,
count(*) Current_month_transactions,
LAG(count(*)) over(order by month(date)) Previous_month_transactions
from staging.transactions
group by month(date)
)t

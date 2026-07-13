USE DigitalPaymentRiskDB;
GO

/*1. ROW_NUMBER()
Rank every transaction of a user by transaction amount.*/

select user_id,transaction_id,amount ,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY amount DESC) Amount_Rank
from staging.transactions;

/*2. RANK()
Which users have the highest fraud amount?*/

select user_id,
SUM(amount) AS Fraud_Amount,
RANK() OVER(ORDER BY SUM(amount) DESC) Fraud_Amount_Rank
from staging.transactions
where is_fraud=1
group by user_id; 

/*3. DENSE_RANK()
Rank merchants by fraud rate.*/

select m.merchant_id,merchant_name,
Round(sum(case when t.is_fraud = 1 then 1.0 else 0.0 end)*100/count(*),2) Fraud_rate,
DENSE_RANK() OVER(ORDER BY sum(case when t.is_fraud = 1 then 1.0 else 0.0 end)*100/count(*)
DESC) Rank_Fraud_rate
from staging.transactions as t
join staging.merchants as m
on t.receiver_id=m.merchant_id
where receiver_type='Merchant'
group by m.merchant_id,merchant_name;

/*4. LAG()
Compare each transaction with the user's previous transaction.*/
select user_id,amount,
LAG(amount) OVER(PARTITION BY user_id ORDER BY [timestamp]) previous_transaction
from staging.transactions;

/*5. LEAD()
Show the next transaction amount of every user.*/
select user_id,amount,
LEAD(amount) OVER(PARTITION BY user_id ORDER BY [timestamp]) next_transaction
from staging.transactions;

/*6. Running Total
How does a user's spending grow over time?*/
select user_id,amount,
[timestamp] ,
sum(amount) OVER(PARTITION BY user_id ORDER BY [timestamp]) Running_Total
from staging.transactions;

/*7. Running Fraud Amount
Running fraud amount per payment app.*/
select payment_app,amount,
sum(amount) OVER(PARTITION BY payment_app ORDER BY [timestamp]) Running_Fraud_Amount
from staging.transactions
where is_fraud=1;

/*8. Moving Average
Average of the last 3 transactions.*/
select transaction_id,date,amount,
avg(amount) OVER(ORDER BY [timestamp] ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) Moving_Average
from staging.transactions;

/*9. Top N Per Group
Top 5 fraudulent users in each city.*/
select * from 
(select u.user_id,u.city ,sum(t.amount) as total_amount,
ROW_NUMBER() OVER(PARTITION BY u.city ORDER BY sum(t.amount) DESC) Amount_Rank
from staging.transactions as t
join staging.users as u
on u.user_id=t.user_id
where is_fraud=1
group by u.user_id,u.city)k
where  Amount_Rank<=5

-- OR 

WITH UserFraud AS
(
    SELECT
        u.city,
        u.user_id,
        SUM(t.amount) AS Fraud_Amount
    FROM staging.transactions t
    JOIN staging.users u
        ON t.user_id = u.user_id
    WHERE t.is_fraud = 1
    GROUP BY u.city, u.user_id
)
SELECT *
FROM
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY city
               ORDER BY Fraud_Amount DESC
           ) AS Rank_No
    FROM UserFraud
) t
WHERE Rank_No <= 5;

/*10. Percent Contribution
Which payment app contributes the highest fraud amount?*/
select payment_app,
sum(amount) Fraud_amount,
Round(sum(amount)*100.0/(select sum(amount) from staging.transactions where is_fraud=1),2) Fraud_rate
from staging.transactions
where is_fraud=1
group by payment_app
order by sum(amount) DESC;

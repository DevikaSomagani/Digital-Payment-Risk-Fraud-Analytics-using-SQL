use DigitalPaymentRiskDB;

-- 1. How big is our platform?

-- Number of registered users
select count(*) no_of_users from staging.users;

-- Number of merchants
select count(*) no_of_merchants from staging.merchants;

-- Number of transactions
select count(*) no_of_transactions from staging.transactions;

-- 2. How Active are the Users?
-- total,Average,minimum,maximum monthly transactions per user 
with user_trans as
(
select user_id users,DATENAME(month,date) mon,
count(*) total_transactions
from staging.transactions
group by DATENAME(month,date),user_id
)
SELECT mon as month,
    sum(total_transactions) AS count_transaction,
    AVG(total_transactions) AS Avg_Transactions,
    MIN(total_transactions) AS Min_Transactions,
    MAX(total_transactions) AS Max_Transactions
FROM user_trans
group by mon;

-- Distribution of users by transaction frequency
WITH activity_level AS (
    SELECT
        CASE
            WHEN avg_monthly_transactions >= 1 AND avg_monthly_transactions <= 10 THEN 'Low'
            WHEN avg_monthly_transactions >= 11 AND avg_monthly_transactions <= 30 THEN 'Medium'
            WHEN avg_monthly_transactions >= 31 AND avg_monthly_transactions <= 60 THEN 'High'
            WHEN avg_monthly_transactions >= 61 THEN 'Very high'
        END AS levels
    FROM staging.users
)
SELECT
    levels,
    COUNT(*) AS user_count
FROM activity_level
GROUP BY levels;

-- 3. Transaction Amount Analysis
-- total,avg,min,max transaction amount
select sum(amount) total_transaction_amount,
min(amount) min_transaction_amount ,
max(amount) max_transaction_amount ,
avg(amount) avg_transaction_amount 
from staging.transactions;

--4. Transaction Status Analysis
select status,count(status) transaction_count,
Round((count(*)*100.0/(select count(status) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by status;

--5.  Which Payment App is Most Used?
select payment_app,count(*) transaction_count,
Round((count(*)*100.0/(select count(payment_app) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by payment_app;

-- 6. Which Transaction Types are Most Common?
select transaction_type,count(*) transaction_count,
Round((count(*)*100.0/(select count(transaction_type) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by transaction_type
order by count(*) DESC;

--7.  Which Device is Most Used?
select device_type,count(*) transaction_count,
Round((count(*)*100.0/(select count(device_type) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by device_type
order by count(*) DESC;

--8. Receiver Analysis
select receiver_type,count(*) transaction_count,
Round((count(*)*100.0/(select count(receiver_type) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by receiver_type;

--9. Hourly Transaction Pattern
select hour_of_day,count(*) transaction_count,
Round((count(*)*100.0/(select count(hour_of_day) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by hour_of_day
order by count(*) desc;

--10. Day of Week Analysis
select day_of_week,count(*) transaction_count,
Round((count(*)*100.0/(select count(day_of_week) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by day_of_week
order by count(*) desc;

--11. Weekend vs Weekday
select is_weekend,count(*) transaction_count,
Round((count(*)*100.0/(select count(is_weekend) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by is_weekend
order by count(*) desc;

--12. Night Transaction Analysis
select is_night_transaction,count(*) transaction_count,
Round((count(*)*100.0/(select count(is_night_transaction) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by is_night_transaction

--13. City Tier Analysis
select user_city_tier,count(*) transaction_count,
Round((count(*)*100.0/(select count(user_city_tier) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by user_city_tier
order by count(*) desc;

--14. KYC Status Analysis
select user_kyc_status,count(*) transaction_count,
Round((count(*)*100.0/(select count(user_kyc_status) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions
group by user_kyc_status
order by count(*) desc;

--15. Age Group Analysis
select u.age_group,
count(*) transaction_count,
Round((count(*)*100.0/(select count(*) from staging.transactions)),2) Percentage_of_transactions
from staging.transactions as t
join staging.users as u
on t.user_id=u.user_id
group by u.age_group
order by transaction_count desc;

--16. Merchant Category Analysis
select m.merchant_category,
count(*) transaction_count,
Round((count(*)*100.0/(SELECT COUNT(*)
            FROM staging.transactions
            WHERE receiver_type = 'Merchant')),2) Percentage_of_transactions
from staging.transactions as t
join staging.merchants as m
on t.receiver_id=m.merchant_id
group by m.merchant_category
order by count(*) desc;

--17. Merchant Size Analysis
select m.merchant_size,
count(*) transaction_count,
Round((count(*)*100.0/(SELECT COUNT(*)
            FROM staging.transactions
            WHERE receiver_type = 'Merchant')),2) Percentage_of_transactions
from staging.transactions as t
join staging.merchants as m
on t.receiver_id=m.merchant_id
group by m.merchant_size
order by count(*) desc;

-- 18.Loyalty Score Distribution
-- min,max.avg user loyalty score
select min(user_loyalty_score) min_loyalty_score ,
 max(user_loyalty_score) max_loyalty_score ,
 avg(user_loyalty_score) avg_loyalty_score 
 from staging.users

-- distrubution based on low,medium and high scores
WITH loyalty AS (
    SELECT
        CASE
            WHEN user_loyalty_score >= 0.101 AND user_loyalty_score < 0.401 THEN 'Low'
            WHEN user_loyalty_score >= 0.401 AND user_loyalty_score < 0.700 THEN 'Medium'
            WHEN user_loyalty_score >= 0.700 AND user_loyalty_score <= 1.000 THEN 'High'
        END AS user_loyalty
    FROM staging.users
)
SELECT
    user_loyalty,
    COUNT(*) AS user_count
FROM loyalty
GROUP BY user_loyalty;

--19. Balance Analysis
select min(balance_after_transaction) as minimum_balance,
 max(balance_after_transaction) as maximum_balance,
 avg(balance_after_transaction) as average_balance
 from staging.transactions;

--20. Account Age Analysis
select min(account_age_days) minimum_account_age,
max(account_age_days) maximum_account_age,
avg(account_age_days) average_account_age
from staging.users;
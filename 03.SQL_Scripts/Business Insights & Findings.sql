use DigitalPaymentRiskDB;
GO
/*1. Which payment app is the safest?

Business Question

Which payment app has the lowest fraud rate?

Output

Payment App
Total Transactions
Fraud Transactions
Fraud Rate

Business Finding

Recommend the safest payment app.
Identify apps that need stronger fraud controls.*/
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
order by Fraud_Rate;

/*2. Which merchant category is the riskiest?

Business Question

Which merchant category experiences the highest fraud?
Output
Merchant Category
Total Transactions
Fraud Transactions
Fraud Amount
Fraud Rate
Business Finding
High-risk merchant categories may require stricter verification or transaction monitoring.*/
select m.merchant_category,
count(*) total_transactions,
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
group by merchant_category
order by Fraud_Rate;

/*3. Which city has the highest fraud?
Business Question
Which cities contribute the most fraud?
Output
City
Fraud Transactions
Fraud Amount
Fraud Rate
Business Finding
Prioritize fraud prevention efforts in these cities.*/
select u.city,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions t
join staging.users u 
on t.user_id=u.user_id
group by city
order by Fraud_Amount DESC;

/*4. Which age group is most vulnerable?
Business Question
Which customer age group experiences the highest fraud?
Output
Age Group
Fraud Transactions
Fraud Amount
Fraud Rate
Business Finding
Target fraud awareness campaigns toward vulnerable age groups.*/
select u.age_group,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions t
join staging.users u 
on t.user_id=u.user_id
group by age_group
order by Fraud_Amount DESC;

/*5. Does KYC reduce fraud?
Business Question
Compare verified vs unverified users.
Output
KYC Status
Total Transactions
Fraud Transactions
Fraud Rate
Business Finding
If verified users show lower fraud, encourage faster KYC completion.*/
select user_kyc_status,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by user_kyc_status
order by Fraud_Amount DESC;

/*6. Are high-risk users actually riskier?
Business Question
Compare high-risk flagged users with normal users.
Output
High Risk Flag
Average Spend
Fraud Transactions
Fraud Rate
Business Finding
Evaluate whether the current high-risk classification is effective.*/
select is_high_risk_user,
count(*) total_transactions,
avg(t.amount) AS Average_Spend,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate  
from staging.transactions t
join staging.users u
on t.user_id=u.user_id
group by is_high_risk_user
order by Fraud_Rate DESC;

/*7. Which device type is most vulnerable?
Business Question
Compare fraud across Android, iPhone, and Web.
Output
Device Type
Fraud Count
Fraud Rate
Business Finding
Investigate platforms with unusually high fraud activity.*/
select device_type,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate  
from staging.transactions 
group by device_type
order by Fraud_Rate DESC;


/*8. Does a new device increase fraud?
Business Question
Are first-time devices associated with more fraud?
Output
New Device Flag
Fraud Count
Fraud Rate
Business Finding
Consider additional authentication for new device logins.*/
select new_device_flag,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate  
from staging.transactions 
group by new_device_flag
order by Fraud_Rate DESC;

/*9. Which transaction type has the highest fraud?
Business Question
Compare P2P, Merchant, Recharge, and Bill Payments.
Output
Transaction Type
Fraud Count
Fraud Amount
Fraud Rate
Business Finding
Focus fraud detection rules on high-risk transaction types.*/
select transaction_type,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by transaction_type
order by Fraud_Amount DESC;

/*10. When does fraud happen the most?
Business Question
Which hour and weekday experience the highest fraud?
Output
Hour of Day
Day of Week
Fraud Transactions
Fraud Rate
Business Finding
Increase fraud monitoring during high-risk periods.*/
-- select * from staging.transactions;
select hour_of_day,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate 
from staging.transactions 
group by hour_of_day
order by Fraud_Rate DESC;

SELECT
    day_of_week,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) AS Fraud_Transactions,
    ROUND(
        SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS Fraud_Rate
FROM staging.transactions
GROUP BY day_of_week
ORDER BY Fraud_Rate DESC;
/*11. Which payment app and device combination is most risky?
Business Question
Which combinations generate the highest fraud?
Output
Payment App
Device Type
Fraud Count
Fraud Amount
Business Finding
Identify combinations that need additional fraud checks.*/
select payment_app,device_type,
count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
sum(case when is_fraud=1 then amount else 0 end) Fraud_Amount,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by payment_app,device_type
order by Fraud_Amount DESC;

/*12. Which customers should be monitored first?
Business Question
Which users generate the highest fraud?
Output
User ID
Fraud Count
Fraud Amount
Rank
Business Finding
Prioritize these users for investigation or enhanced monitoring*/
select*,RANK() OVER(order by Fraud_Amount desc)
from (select u.user_id,
count(*) total_transactions,
SUM(CASE WHEN is_fraud=1 THEN amount ELSE 0 END) AS Fraud_Amount,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions t
join staging.users u
on t.user_id=u.user_id
group by u.user_id)t

/*13. Which merchants should be investigated?
Business Question
Which merchants have the highest fraud rate?
Output
Merchant
Fraud Transactions
Fraud Amount
Fraud Rate
Rank
Business Finding
Review merchant onboarding, compliance, and monitoring.*/
select*,RANK() OVER(order by Fraud_Amount desc) as Rank
from (select m.merchant_id,
count(*) total_transactions,
SUM(CASE WHEN is_fraud=1 THEN amount ELSE 0 END) AS Fraud_Amount,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions t
join staging.merchants m
on t.receiver_id=m.merchant_id
group by m.merchant_id)k


/*14. Do large transactions have higher fraud?
Business Question
Is fraud concentrated in high-value transactions?
Output
Amount Bucket
Fraud Count
Fraud Rate
Business Finding
If fraud is concentrated in large transactions, apply additional verification above a threshold.*/
select 
case when amount>=0 and amount<=8000  then 'LOW'
    WHEN amount>8000 and amount<=16000 then 'medium'
    when amount>16000 and amount<=24000 then 'High'
    when amount>24000 then 'Very high'
    end as amount_bucket
,count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by case when amount>=0 and amount<=8000  then 'LOW'
    WHEN amount>8000 and amount<=16000 then 'medium'
    when amount>16000 and amount<=24000 then 'High'
    when amount>24000 then 'Very high'
    end
order by Fraud_Rate DESC
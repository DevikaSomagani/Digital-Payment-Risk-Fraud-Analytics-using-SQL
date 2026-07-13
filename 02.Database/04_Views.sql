USE DigitalPaymentRiskDB;
GO

/* Total transactions
Fraud transactions
Fraud rate
Fraud amount*/

CREATE VIEW analytics.vw_FraudSummary
AS
select count(*) total_Transactions,
sum(case when is_fraud = 1 then 1 else 0 end) Fraud_transactions,
Round(sum(case when is_fraud = 1 then 1.0 else 0.0 end)*100/count(*),2) Fraud_rate,
SUM(
    CASE
        WHEN is_fraud = 1 THEN amount
        ELSE 0
    END
) AS Fraud_amount
from staging.transactions 

select * from analytics.vw_FraudSummary;



/*User ID
KYC Status
High Risk Flag
Total Transactions
Fraud Transactions
Fraud Rate*/

CREATE VIEW analytics.vw_UserRisk
AS
select u.user_id,u.kyc_status,u.is_high_risk_user,
count(*) Total_Transactions,
sum(case when t.is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(sum(case when t.is_fraud=1 then 1 else 0 end)*100.0/count(*), 2) Fraud_Rate
from staging.users as u
join staging.transactions as t
on u.user_id=t.user_id
group by u.user_id,u.kyc_status,u.is_high_risk_user;

select * from analytics.vw_UserRisk;


/*vw_MerchantRisk
Merchant Name
Category
Total Transactions
Fraud Count
Fraud Rate*/
CREATE VIEW analytics.vw_MerchantRisk
AS
select m.merchant_id,m.merchant_name,m.merchant_category,m.merchant_size,
count(*) Total_Transactions,
sum(case when t.is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(sum(case when t.is_fraud=1 then 1 else 0 end)*100.0/count(*), 2) Fraud_Rate,
SUM(
        CASE
            WHEN t.is_fraud = 1 THEN t.amount
            ELSE 0
        END
    ) AS Fraud_Amount
from staging.merchants m
join staging.transactions t
on m.merchant_id = t.receiver_id
where t.receiver_type='Merchant'
group by m.merchant_id,m.merchant_name,m.merchant_category,m.merchant_size;

select * from analytics.vw_MerchantRisk;



/*vw_PaymentAppRisk
Payment App
Total Transactions
Fraud Count
Fraud Rate*/

CREATE VIEW analytics.vw_PaymentAppRisk
AS
select payment_app,
count(*) Total_Transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(sum(case when is_fraud=1 then 1 else 0 end)*100.0/count(*), 2) Fraud_Rate,
SUM(
        CASE
            WHEN is_fraud = 1 THEN amount
            ELSE 0
        END
    ) AS Fraud_Amount
from staging.transactions
group by payment_app;

select * from analytics.vw_PaymentAppRisk;

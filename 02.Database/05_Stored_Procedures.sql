use DigitalPaymentRiskDB;
GO
/*Show overall fraud summary.

Output

Total transactions
Fraud transactions
Fraud rate
Fraud amount*/

CREATE OR ALTER PROCEDURE analytics.sp_GetFraudSummary
AS
BEGIN 
SELECT count(*) Total_Transactions,
sum(case when is_fraud = 1 then 1 else 0 end) Fraud_transactions,
Round(sum(case when is_fraud = 1 then 1.0 else 0.0 end)*100/count(*),2) Fraud_rate,
SUM(
    CASE
        WHEN is_fraud = 1 THEN amount
        ELSE 0
    END
) AS Fraud_amount
from staging.transactions;
END
GO

EXEC analytics.sp_GetFraudSummary
GO

/*2. sp_UserFraudHistory

Business Question

Show all fraudulent transactions of a specific user.

Parameter

@UserID

Returns:

Transaction ID
Amount
Date
Payment App
Status*/

CREATE OR ALTER PROCEDURE analytics.sp_UserFraudHistory
@user_id VARCHAR(20)
AS
BEGIN 
SELECT transaction_id,amount,date,payment_app,status
from staging.transactions
where user_id = @user_id and 
is_fraud=1
END
GO

EXEC analytics.sp_UserFraudHistory 'USR00664'
GO

/*3. sp_MerchantFraud

Business Question

Show fraud details for a specific merchant.

Parameter

@MerchantID*/

CREATE OR ALTER PROCEDURE analytics.sp_MerchantFraud
@merchant_id VARCHAR(20)
AS
BEGIN 
SELECT t.transaction_id,
    t.user_id,
    m.merchant_name,
    t.amount,
    t.payment_app,
    t.date 
from staging.transactions as t
join staging.merchants as m
on t.receiver_id=m.merchant_id
where m.merchant_id= @merchant_id and t.is_fraud=1
END
GO

EXEC analytics.sp_MerchantFraud @merchant_id='MRC0117'
GO

/*4. sp_FraudByDateRange

Business Question

Show fraud between two dates.

Parameters:

@StartDate
@EndDate*/

CREATE OR ALTER PROCEDURE analytics.sp_FraudByDateRange
    @StartDate date,
    @EndDate date
AS
BEGIN
    SELECT 
    count(*) total_Transactions,
    sum(case when is_fraud = 1 then 1 else 0 end) Fraud_transactions,
    Round(sum(case when is_fraud = 1 then 1.0 else 0.0 end)*100/count(*),2) Fraud_rate,
    SUM(
        CASE
        WHEN is_fraud = 1 THEN amount
        ELSE 0
    END
    ) AS Fraud_amount 
    FROM staging.transactions
    WHERE date BETWEEN @StartDate AND @EndDate
  AND is_fraud = 1;
END;
GO

EXEC analytics.sp_FraudByDateRange '2024-02-18' , '2024-04-15'
GO

/* 5. sp_TopFraudTransactions

Business Question

Show Top N highest-value fraudulent transactions.

Parameter:

@TopN*/
CREATE OR ALTER PROCEDURE analytics.sp_TopFraudTransactions
    @n int
AS
BEGIN
    SELECT top (@n) 
    transaction_id,
    user_id,
    amount,
    [date]
    FROM staging.transactions
    WHERE is_fraud = 1
    ORDER BY amount DESC;
END;
GO

EXEC analytics.sp_TopFraudTransactions @n=10
GO

/* 6. sp_PaymentAppFraud

Business Question

Show fraud summary for a payment app.

Parameter:

@PaymentApp*/
CREATE OR ALTER PROCEDURE analytics.sp_PaymentAppFraud
    @payment_app VARCHAR(20)
AS
BEGIN
    SELECT 
    count(*) total_Transactions,
    sum(case when is_fraud = 1 then 1 else 0 end) Fraud_transactions,
    Round(sum(case when is_fraud = 1 then 1.0 else 0.0 end)*100/count(*),2) Fraud_rate,
    SUM(
        CASE
        WHEN is_fraud = 1 THEN amount
        ELSE 0
    END
    ) AS Fraud_amount 
    FROM staging.transactions
    where payment_app=@payment_app
END;
GO

EXEC analytics.sp_PaymentAppFraud @payment_app='PhonePe'
GO

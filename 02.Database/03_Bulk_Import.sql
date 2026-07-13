BULK INSERT staging.Users
FROM 'C:\Users\DELL\Desktop\Devika Resume\UPI Fraud Analytics SQL\Dataset\users.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);

SELECT COUNT(*) AS TotalUsers
FROM staging.Users;

SELECT TOP (10) *
FROM staging.Users;

BULK INSERT staging.Merchants
FROM 'C:\Users\DELL\Desktop\Devika Resume\UPI Fraud Analytics SQL\Dataset\merchants.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);

SELECT COUNT(*) AS TotalMerchants
FROM staging.Merchants;

BULK INSERT staging.Transactions
FROM 'C:\Users\DELL\Desktop\Devika Resume\UPI Fraud Analytics SQL\Dataset\transactions.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);

INSERT INTO staging.transactions
(
    transaction_id,	
    user_id	,
    receiver_id	,
    receiver_type,	
    amount	,
    [timestamp]	,
    [date]	,
    hour_of_day,	
    day_of_week,
    is_weekend,
    is_night_transaction,	
    time_since_last_txn_min,	
    transaction_type,	
    payment_app,	
    device_type,	
    [status],	
    user_city_tier,
    user_kyc_status,	
    user_avg_monthly_txn,	
    user_avg_txn_value,	
    user_loyalty_score,	
    new_device_flag	,
    ip_location_mismatch,	
    failed_attempts_last_24h,	
    transaction_velocity,	
    amount_deviation_score,	
    is_fraud,
    recurring_payment_flag	,
    balance_after_transaction,	
    transaction_frequency_score
)
SELECT
    transaction_id,	
    user_id	,
    receiver_id	,
    receiver_type,	
    amount	,
    [timestamp]	,
    [date]	,
    hour_of_day,	
    day_of_week,
    is_weekend,
    is_night_transaction,	
    time_since_last_txn_min,	
    transaction_type,	
    payment_app,	
    device_type,	
    [status],	
    user_city_tier,
    user_kyc_status,	
    user_avg_monthly_txn,	
    user_avg_txn_value,	
    user_loyalty_score,	
    new_device_flag	,
    ip_location_mismatch,	
    failed_attempts_last_24h,	
    TRY_CAST(
    REPLACE(NULLIF(LTRIM(RTRIM(transaction_velocity)), ''), '.0', '')
AS TINYINT),	
    amount_deviation_score,	
    is_fraud,
    recurring_payment_flag	,
    balance_after_transaction,	
    transaction_frequency_score
   FROM 
   raw.transactions;

SELECT COUNT(*) AS Totaltransactions
FROM staging.transactions;

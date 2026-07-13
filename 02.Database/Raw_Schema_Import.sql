USE DigitalPaymentRiskDB;
GO

CREATE SCHEMA raw;
GO

CREATE TABLE raw.transactions(
transaction_id	VARCHAR(20) NOT NULL,
user_id	VARCHAR(20) NOT NULL,
receiver_id	VARCHAR(20) NOT NULL,
receiver_type VARCHAR(10) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
[timestamp] DATETIME2 NOT NULL,
[date] DATE NOT NULL,
hour_of_day	TINYINT NOT NULL,
day_of_week	VARCHAR(10) NOT NULL,
is_weekend	BIT NOT NULL,
is_night_transaction BIT NOT NULL,
time_since_last_txn_min	DECIMAL(15,2),
transaction_type VARCHAR(20) NOT NULL,
payment_app	VARCHAR(20) NOT NULL,
device_type	VARCHAR(10) NOT NULL,
status VARCHAR(10) NOT NULL,
user_city_tier	VARCHAR(10) NOT NULL,
user_kyc_status	VARCHAR(15) NOT NULL,
user_avg_monthly_txn INT NOT NULL,
user_avg_txn_value	DECIMAL(10,2) NOT NULL,
user_loyalty_score	DECIMAL(4,3) NOT NULL,
new_device_flag	BIT NOT NULL,
ip_location_mismatch BIT NOT NULL,
failed_attempts_last_24h TINYINT NOT NULL,
transaction_velocity VARCHAR(5),
amount_deviation_score	DECIMAL(10,4),
is_fraud BIT NOT NULL,
recurring_payment_flag BIT NOT NULL,	
balance_after_transaction DECIMAL(12,2) NOT NULL,
transaction_frequency_score DECIMAL(3,2) NOT NULL,

CONSTRAINT PK_Transactions
PRIMARY KEY (transaction_id),

CONSTRAINT FK_Transactions_Users
FOREIGN KEY (user_id)
REFERENCES staging.Users(user_id),

CONSTRAINT CHK_Transaction_Amount
CHECK (amount > 0),

CONSTRAINT CHK_Hour
CHECK (hour_of_day BETWEEN 0 AND 23),

CONSTRAINT CHK_Receiver_Type
CHECK (receiver_type IN ('User','Merchant')),

CONSTRAINT CHK_Status
CHECK (status IN ('Success','Failed','Pending'))
)

BULK INSERT raw.Transactions
FROM 'C:\Users\DELL\Desktop\Devika Resume\UPI Fraud Analytics SQL\Dataset\transactions.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a'
);

select* from raw.transactions;
  
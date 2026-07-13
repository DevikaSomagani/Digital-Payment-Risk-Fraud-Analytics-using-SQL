CREATE DATABASE DigitalPaymentRiskDB;

USE DigitalPaymentRiskDB;
GO

CREATE SCHEMA staging;
GO

CREATE SCHEMA analytics;
GO

Create table staging.users (
user_id VARCHAR(20) NOT NULL PRIMARY KEY,
age_group varchar(10) NOT NULL,
city varchar(50) NOT NULL,
city_tier varchar(10) NOT NULL,
kyc_status varchar(15) NOT NULL,
account_age_days int NOT NULL,
linked_bank_count	tinyint NOT NULL,
avg_monthly_transactions int NOT NULL,
avg_transaction_value decimal(10,2) NOT NULL,	
preferred_app varchar(20) NOT NULL, 
preferred_device varchar(20) NOT NULL,
user_loyalty_score	decimal(4,3) NOT NULL, 
is_high_risk_user bit NOT NULL);

CREATE TABLE staging.merchants (
merchant_id	VARCHAR(20) NOT NULL PRIMARY KEY,
merchant_name VARCHAR(20) NOT NULL,
merchant_category VARCHAR(20) NOT NULL,
merchant_size VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
city_tier VARCHAR(10) NOT NULL,
avg_daily_transactions	INT NOT NULL,
is_registered BIT NOT NULL,
rating DECIMAL(2,1) NOT NULL )

CREATE TABLE staging.transactions(
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
transaction_velocity TINYINT,
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


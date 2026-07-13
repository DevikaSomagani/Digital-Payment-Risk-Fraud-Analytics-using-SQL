07_Data_Validation
use database DigitalPaymentRiskDB
SELECT
(SELECT COUNT(*) FROM staging.users) Users,
(SELECT COUNT(*) FROM staging.merchants) Merchants,
(SELECT COUNT(*) FROM staging.transactions) Transactions;


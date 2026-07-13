# 📖 Data Dictionary

## Overview

This document describes the structure of the **DigitalPaymentRiskDB** database used in the **Digital Payment Risk & Fraud Analytics using SQL** project.

The database consists of three relational tables:

* **Users**
* **Merchants**
* **Transactions**

These tables support customer analytics, business performance analysis, and fraud detection.

---

## 🗄️ Database Information

| Property          | Value                                         |
| ----------------- | --------------------------------------------- |
| Database          | **DigitalPaymentRiskDB**                      |
| Schema            | **staging**                                   |
| Database Platform | **Microsoft SQL Server 2022 Express Edition** |

---

# 👤 Users Table

### Purpose

Stores customer profile information for customer segmentation, loyalty analysis, KYC analysis, behavioral analysis, and fraud analytics.

**Primary Key:** `user_id`

### Columns

| Column                   | Data Type     | Description                       |
| ------------------------ | ------------- | --------------------------------- |
| user_id                  | VARCHAR(20)   | Unique customer identifier        |
| age_group                | VARCHAR(10)   | Customer age category             |
| city                     | VARCHAR(50)   | Customer city                     |
| city_tier                | VARCHAR(10)   | City classification               |
| kyc_status               | VARCHAR(15)   | KYC verification status           |
| account_age_days         | INT           | Days since account creation       |
| linked_bank_count        | TINYINT       | Number of linked bank accounts    |
| avg_monthly_transactions | INT           | Average monthly transaction count |
| avg_transaction_value    | DECIMAL(10,2) | Average transaction value         |
| preferred_app            | VARCHAR(20)   | Preferred payment application     |
| preferred_device         | VARCHAR(20)   | Preferred transaction device      |
| user_loyalty_score       | DECIMAL(4,3)  | Customer loyalty score            |
| is_high_risk_user        | BIT           | High-risk customer flag           |

---

# 🏪 Merchants Table

### Purpose

Stores merchant information for merchant performance analysis, category analysis, revenue analysis, and fraud monitoring.

**Primary Key:** `merchant_id`

### Columns

| Column                 | Data Type    | Description                  |
| ---------------------- | ------------ | ---------------------------- |
| merchant_id            | VARCHAR(20)  | Unique merchant identifier   |
| merchant_name          | VARCHAR(20)  | Merchant business name       |
| merchant_category      | VARCHAR(20)  | Business category            |
| merchant_size          | VARCHAR(10)  | Business size classification |
| city                   | VARCHAR(50)  | Merchant city                |
| city_tier              | VARCHAR(10)  | Merchant city classification |
| avg_daily_transactions | INT          | Average daily transactions   |
| is_registered          | BIT          | Registration status          |
| rating                 | DECIMAL(2,1) | Merchant rating              |

---

# 💳 Transactions Table

### Purpose

The primary fact table containing every payment transaction along with customer attributes, payment details, and fraud indicators.

**Primary Key:** `transaction_id`

### Foreign Keys

* `user_id` → `Users.user_id`

> **Note:** `receiver_id` is not defined as a foreign key because it can refer to either another user or a merchant depending on `receiver_type`.

### Columns

| Column                      | Data Type     | Description                                 |
| --------------------------- | ------------- | ------------------------------------------- |
| transaction_id              | VARCHAR(20)   | Unique transaction identifier               |
| user_id                     | VARCHAR(20)   | Customer identifier                         |
| receiver_id                 | VARCHAR(20)   | Payment receiver identifier                 |
| receiver_type               | VARCHAR(10)   | User or Merchant                            |
| amount                      | DECIMAL(10,2) | Transaction amount                          |
| timestamp                   | DATETIME2     | Transaction date and time                   |
| date                        | DATE          | Transaction date                            |
| hour_of_day                 | TINYINT       | Hour of transaction (0–23)                  |
| day_of_week                 | VARCHAR(10)   | Day of the week                             |
| is_weekend                  | BIT           | Weekend transaction flag                    |
| is_night_transaction        | BIT           | Night transaction flag                      |
| time_since_last_txn_min     | DECIMAL(15,2) | Time since previous transaction             |
| transaction_type            | VARCHAR(20)   | Transaction type                            |
| payment_app                 | VARCHAR(20)   | Payment application                         |
| device_type                 | VARCHAR(10)   | Device used                                 |
| status                      | VARCHAR(10)   | Transaction status                          |
| user_city_tier              | VARCHAR(10)   | Customer city tier                          |
| user_kyc_status             | VARCHAR(15)   | Customer KYC status                         |
| user_avg_monthly_txn        | INT           | Historical monthly transactions             |
| user_avg_txn_value          | DECIMAL(10,2) | Historical average transaction value        |
| user_loyalty_score          | DECIMAL(4,3)  | Customer loyalty score                      |
| new_device_flag             | BIT           | New device indicator                        |
| ip_location_mismatch        | BIT           | IP mismatch indicator                       |
| failed_attempts_last_24h    | TINYINT       | Failed authentication attempts              |
| transaction_velocity        | TINYINT       | Transaction frequency within a short period |
| amount_deviation_score      | DECIMAL(10,4) | Deviation from normal transaction amount    |
| is_fraud                    | BIT           | Fraud indicator                             |
| recurring_payment_flag      | BIT           | Recurring payment indicator                 |
| balance_after_transaction   | DECIMAL(12,2) | Remaining account balance                   |
| transaction_frequency_score | DECIMAL(3,2)  | Normalized transaction frequency score      |

---

# 🔑 Primary Keys

| Table        | Primary Key      |
| ------------ | ---------------- |
| Users        | `user_id`        |
| Merchants    | `merchant_id`    |
| Transactions | `transaction_id` |

---

# 🔗 Foreign Keys

| Child Table  | Parent Table | Column    |
| ------------ | ------------ | --------- |
| Transactions | Users        | `user_id` |

---

# ✅ Constraints

| Constraint                                         | Purpose                                |
| -------------------------------------------------- | -------------------------------------- |
| Primary Key                                        | Ensures unique records                 |
| Foreign Key                                        | Maintains referential integrity        |
| `CHECK (amount > 0)`                               | Prevents invalid transaction amounts   |
| `CHECK (hour_of_day BETWEEN 0 AND 23)`             | Ensures valid transaction hours        |
| `CHECK (receiver_type IN ('User','Merchant'))`     | Restricts receiver types               |
| `CHECK (status IN ('Success','Failed','Pending'))` | Allows only valid transaction statuses |

---

# 📈 Business Value

This database supports a wide range of analytical use cases, including:

* Customer Analytics
* Customer Segmentation
* Revenue Analysis
* Fraud Detection
* Merchant Performance
* KPI Reporting
* Risk Assessment
* Trend Analysis
* Payment Application Performance
* Transaction Behavior Analysis

---

# ✅ Conclusion

The database follows a relational design with well-defined entities, keys, and constraints. Together, the **Users**, **Merchants**, and **Transactions** tables provide a solid foundation for customer analytics, fraud detection, business intelligence, and advanced SQL analysis.

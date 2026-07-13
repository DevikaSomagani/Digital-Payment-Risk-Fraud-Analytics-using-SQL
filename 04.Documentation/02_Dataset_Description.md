# 📊 Dataset Description

## Overview

This project uses a **simulated digital payment platform dataset** representing customers, merchants, and financial transactions. The dataset is designed to resemble a real-world payment ecosystem where users make transactions using different payment applications, devices, and merchant categories.

It is used to analyze **customer behavior**, **business performance**, and **fraud patterns** using **Microsoft SQL Server**.

Unlike many fraud datasets that store fraud information in a separate table, this project stores fraud-related attributes directly within the **Transactions** table, enabling efficient fraud detection and business analysis.

---

## 📁 Dataset Summary

| Dataset      | Description                                        | Records |
| ------------ | -------------------------------------------------- | ------: |
| Users        | Customer profile information                       |   2,000 |
| Merchants    | Merchant details                                   |     400 |
| Transactions | Digital payment transactions with fraud indicators |  20,000 |

---

## 🗄️ Database Information

| Item     | Value                                         |
| -------- | --------------------------------------------- |
| Database | **DigitalPaymentRiskDB**                      |
| Schema   | **staging**                                   |
| Platform | **Microsoft SQL Server 2022 Express Edition** |

---

## 🏗️ Database Architecture

```text
Users (user_id)
      │
      │
      ▼
Transactions (user_id, receiver_id)
      │
      │
      ▼
Merchants (merchant_id)
```

* **Users** stores customer profile information.
* **Transactions** records every payment along with fraud indicators.
* **Merchants** stores businesses that receive payments.

The **Transactions** table links customers and merchants, forming the core of the analytical model.

---

# 📋 Table Description

## 👤 Users

**Primary Key:** `user_id`

Stores customer profile information used for:

* Customer segmentation
* Spending behavior analysis
* Loyalty analysis
* KYC analysis
* Fraud analysis
* City and age-group analysis

---

## 🏪 Merchants

**Primary Key:** `merchant_id`

Stores merchant information used for:

* Merchant performance analysis
* Merchant category analysis
* Revenue analysis
* Fraud exposure analysis

---

## 💳 Transactions

**Primary Key:** `transaction_id`

**Foreign Keys**

* `user_id` → `Users.user_id`
* `receiver_id` → `Merchants.merchant_id` *(for merchant transactions)*

The Transactions table contains:

* Transaction details
* Payment information
* Device information
* Fraud indicators
* Customer attributes captured at the time of each transaction

This is the primary table used throughout the project.

---

# 🚨 Fraud Attributes

Fraud analysis is performed directly from the **Transactions** table using fields such as:

* `is_fraud`
* `transaction_velocity`
* `new_device_flag`
* `ip_location_mismatch`
* `failed_attempts_last_24h`
* `amount_deviation_score`

These attributes help identify:

* Fraud trends
* High-risk users
* Suspicious transaction patterns
* Fraud rates across different dimensions

---

# 🔗 Table Relationships

| Relationship             | Type        |
| ------------------------ | ----------- |
| Users → Transactions     | One-to-Many |
| Merchants → Transactions | One-to-Many |

* One user can perform multiple transactions.
* One merchant can receive multiple transactions.

---

# 📈 Analytical Areas Covered

### Customer Analytics

* Customer segmentation
* Spending behavior
* Customer lifetime value
* Repeat customer analysis
* Customer activity
* Loyalty analysis

### Business Analytics

* Monthly KPIs
* Revenue trends
* Payment application analysis
* Merchant category analysis
* Transaction growth
* Active user analysis

### Fraud Analytics

* Fraud by hour
* Fraud by weekday
* Fraud by payment application
* Fraud by device type
* Fraud by transaction type
* Fraud by city
* Fraud by merchant
* Fraud by customer
* Transaction velocity analysis
* New device fraud analysis
* IP mismatch analysis
* High-value transaction fraud

---

# ⭐ Dataset Strengths

* 20,000 transaction records
* Relational database with multiple linked tables
* Rich customer profile information
* Merchant categorization
* Built-in fraud indicators
* Time-based transaction data
* Device and payment application details
* KYC and loyalty information
* Suitable for advanced SQL concepts such as JOINs, CTEs, Window Functions, Ranking Functions, Views, and Stored Procedures

---

# ⚠️ Limitations

* Simulated transaction data
* No real-time streaming data
* No historical customer profile tracking
* Merchant hierarchy is not available
* No external fraud intelligence sources

These limitations do not affect the SQL analysis but represent opportunities for future enhancement.

---

# ✅ Conclusion

This dataset provides a realistic representation of a digital payment ecosystem and supports comprehensive SQL-based analysis of customer behavior, business performance, and fraud trends. Its relational structure enables end-to-end analytical workflows and demonstrates how SQL can be used to solve practical business problems and generate actionable insights.

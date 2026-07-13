# 🧹 Data Cleaning

## Overview

Before performing any analysis, the imported CSV datasets were cleaned and validated to ensure they were accurate, consistent, and ready for analytical processing. Although the source data was largely well-structured, several preprocessing steps were required to resolve import issues, validate data types, handle missing values, and enforce business rules.

These activities ensured that all subsequent fraud analysis, KPI reporting, and business insights were based on reliable data.

---

## 🎯 Objectives

The data cleaning process aimed to:

* Prepare raw data for analysis
* Resolve import issues
* Validate data types
* Handle NULL values appropriately
* Verify business rules
* Maintain data consistency
* Improve overall data quality
* Prevent inaccurate analytical results

---

# 🔄 Data Cleaning Workflow

```text
Raw CSV Files
      │
      ▼
Import into SQL Server
      │
      ▼
Identify Import Issues
      │
      ▼
Validate Data Types
      │
      ▼
Handle NULL Values
      │
      ▼
Apply Business Rules
      │
      ▼
Perform Data Quality Checks
      │
      ▼
Clean Dataset for Analysis
```

---

# 1️⃣ Data Type Validation

All columns were assigned appropriate SQL Server data types during table creation.

| Column           | Data Type     |
| ---------------- | ------------- |
| user_id          | VARCHAR(20)   |
| merchant_id      | VARCHAR(20)   |
| transaction_id   | VARCHAR(20)   |
| amount           | DECIMAL(10,2) |
| timestamp        | DATETIME2     |
| date             | DATE          |
| hour_of_day      | TINYINT       |
| is_fraud         | BIT           |
| account_age_days | INT           |

**Outcome:** ✅ Correct data types improved storage efficiency, query performance, and calculation accuracy.

---

# 2️⃣ Import Error Resolution

During **BULK INSERT**, SQL Server reported data conversion errors while importing the **Transactions** dataset.

### Issue

The `transaction_velocity` column contained values that did not match the expected numeric format.

### Resolution

* Reviewed the source data.
* Updated the column definition to match the dataset.
* Re-imported the data successfully.

**Outcome:** ✅ All **20,000 transaction records** were imported without data loss.

---

# 3️⃣ NULL Value Handling

Mandatory business columns were verified to contain no NULL values, including:

* User ID
* Transaction ID
* Amount
* Payment App
* Device Type
* Fraud Flag

Optional analytical columns were allowed to contain NULL values where appropriate, such as:

* `time_since_last_txn_min`
* `transaction_velocity`
* `amount_deviation_score`

**Outcome:** ✅ Missing values were handled without removing valid records.

---

# 4️⃣ Time-Based Data Validation

The following fields were validated for consistency:

* `timestamp`
* `date`
* `hour_of_day`
* `day_of_week`

**Validation Rule**

* Hour of day must be between **0 and 23**.

**Outcome:** ✅ Time-based fields were valid and suitable for hourly and daily trend analysis.

---

# 5️⃣ Business Rule Validation

The following rules were enforced using SQL constraints:

* Transaction amount must be greater than zero.
* Hour of day must be between **0 and 23**.
* Receiver type must be **User** or **Merchant**.
* Transaction status must be **Success**, **Failed**, or **Pending**.

**Outcome:** ✅ Invalid records were prevented from entering the analytical database.

---

# 6️⃣ Fraud Flag Validation

The `is_fraud` column was validated to ensure it contained only valid values:

| Value | Meaning                |
| ----: | ---------------------- |
|     0 | Genuine Transaction    |
|     1 | Fraudulent Transaction |

**Outcome:** ✅ Fraud indicators were verified before analysis.

---

# 7️⃣ Duplicate Record Verification

Primary keys were checked for uniqueness.

Validated columns:

* `user_id`
* `merchant_id`
* `transaction_id`

**Outcome:** ✅ No duplicate primary key records were identified.

---

# 8️⃣ Referential Integrity Review

The relationship between **Users** and **Transactions** was verified.

Validation performed:

* Every `Transactions.user_id` exists in the **Users** table.

**Outcome:** ✅ No orphan transaction records were found.

---

# 9️⃣ Consistency Review

Business categories were reviewed for consistency, including:

* KYC Status
* Device Type
* Payment Application
* Transaction Type
* Receiver Type

**Outcome:** ✅ Only valid business categories were retained.

---

# 🔟 Final Data Quality Verification

The cleaned dataset was verified to ensure:

* Correct row counts
* Unique primary keys
* Valid foreign key relationships
* Appropriate data types
* Valid business values
* Consistent fraud indicators
* No invalid transaction amounts
* Valid transaction hours

The validated dataset was then used for all analytical queries.

---

# 📋 Data Cleaning Summary

| Cleaning Activity               |    Status   |
| ------------------------------- | :---------: |
| Data Type Validation            | ✅ Completed |
| Import Error Resolution         | ✅ Completed |
| NULL Value Review               | ✅ Completed |
| Time Data Validation            | ✅ Completed |
| Business Rule Validation        | ✅ Completed |
| Fraud Flag Validation           | ✅ Completed |
| Duplicate Verification          | ✅ Completed |
| Referential Integrity Review    | ✅ Completed |
| Consistency Review              | ✅ Completed |
| Final Data Quality Verification | ✅ Completed |

---

# ⭐ Benefits of Data Cleaning

* Improved analytical accuracy
* Increased data consistency
* Enhanced database integrity
* Reduced reporting errors
* Supported reliable fraud detection
* Improved query performance
* Increased confidence in business insights

---

# ✅ Conclusion

The data cleaning process ensured that the dataset was complete, consistent, and suitable for analysis. By resolving import issues, validating data types, handling missing values appropriately, enforcing business rules, and verifying data integrity, a reliable foundation was established for customer analytics, KPI reporting, and fraud detection using SQL Server.

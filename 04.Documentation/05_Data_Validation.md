# ✅ Data Validation

## Overview

Before performing any analysis, the imported CSV data was validated to ensure it was **accurate, complete, and consistent**. Data validation is a crucial step because inaccurate or incomplete data can lead to misleading business insights and unreliable fraud detection.

The validation process included checking data completeness, uniqueness, referential integrity, business rules, and value ranges to ensure the dataset was ready for analysis.

---

## 🎯 Validation Objectives

The validation process aimed to:

* Verify successful data import
* Ensure primary key uniqueness
* Detect missing or NULL values
* Validate relationships between tables
* Check valid domain values
* Verify acceptable numeric ranges
* Enforce business rules
* Validate fraud label distribution
* Confirm dataset readiness for analytics

---

# 📋 Validation Summary

| Validation Check              |    Status   |
| ----------------------------- | :---------: |
| Row Count Validation          | ✅ Completed |
| Primary Key Validation        | ✅ Completed |
| Missing Value Validation      | ✅ Completed |
| Domain Validation             | ✅ Completed |
| Data Range Validation         | ✅ Completed |
| Foreign Key Validation        | ✅ Completed |
| Fraud Distribution Validation | ✅ Completed |
| Business Rule Validation      | ✅ Completed |
| Negative Amount Validation    | ✅ Completed |
| Invalid Hour Validation       | ✅ Completed |

---

# 1️⃣ Row Count Validation

### Objective

Verify that all records from the source CSV files were successfully imported.

| Table        | Expected Rows | Imported Rows |
| ------------ | ------------: | ------------: |
| Users        |         2,000 |         2,000 |
| Merchants    |           400 |           400 |
| Transactions |        20,000 |        20,000 |

**Result:** ✅ All records were imported successfully.

---

# 2️⃣ Primary Key Validation

### Objective

Ensure that every table contains unique primary key values.

Validated keys:

* `user_id`
* `merchant_id`
* `transaction_id`

**Result:** ✅ No duplicate primary keys were found.

---

# 3️⃣ Missing Value Validation

### Objective

Check mandatory business columns for NULL or missing values.

Validated columns include:

* User ID
* Transaction ID
* Amount
* Payment App
* Device Type
* Transaction Status
* Fraud Flag

**Result:** ✅ Mandatory columns contained no missing values.

---

# 4️⃣ Domain Validation

### Objective

Verify that categorical fields contain only valid business values.

Validated columns:

| Column             | Valid Values             |
| ------------------ | ------------------------ |
| Receiver Type      | User, Merchant           |
| Transaction Status | Success, Failed, Pending |
| Boolean Flags      | 0 or 1                   |

**Result:** ✅ All categorical values were valid.

---

# 5️⃣ Data Range Validation

### Objective

Ensure numerical values fall within expected business ranges.

| Column               | Validation Rule      |
| -------------------- | -------------------- |
| Amount               | > 0                  |
| Hour of Day          | 0–23                 |
| Transaction Velocity | Valid integer values |
| Fraud Flag           | 0 or 1               |

**Result:** ✅ All values satisfied the expected ranges.

---

# 6️⃣ Foreign Key Validation

### Objective

Confirm that every transaction references an existing customer.

Relationship validated:

`Transactions.user_id → Users.user_id`

**Result:** ✅ No orphan transaction records were found.

---

# 7️⃣ Fraud Distribution Validation

### Objective

Verify that fraud labels are correctly populated before analysis.

Validation performed:

* Fraud transactions
* Genuine transactions

**Result:** ✅ Both fraudulent and genuine transactions were present, confirming the dataset is suitable for fraud analysis.

---

# 8️⃣ Business Rule Validation

The following business rules were validated:

* Transaction amount must be greater than zero.
* Hour of day must be between **0 and 23**.
* Receiver type must be **User** or **Merchant**.
* Transaction status must be **Success**, **Failed**, or **Pending**.

**Result:** ✅ All rules were successfully enforced using SQL constraints.

---

# 9️⃣ Negative Amount Validation

### Objective

Ensure no transaction contains a negative amount.

**Result:** ✅ No negative transaction amounts were found.

---

# 🔟 Invalid Hour Validation

### Objective

Verify that transaction hours fall within the valid 24-hour range.

**Result:** ✅ No invalid transaction hours were identified.

---

# 📊 Overall Validation Outcome

The dataset was successfully validated and confirmed to be:

* ✅ Complete
* ✅ Consistent
* ✅ Accurate
* ✅ Reliable
* ✅ Ready for business analytics
* ✅ Ready for fraud detection

---

# ⭐ Benefits of Data Validation

* Improved data quality
* Maintained referential integrity
* Reduced reporting errors
* Increased confidence in analytical results
* Reliable fraud detection
* Trustworthy business insights
* Demonstrated industry-standard data validation practices

---

# ✅ Conclusion

A comprehensive data validation process was completed before any analytical queries were executed. By verifying data completeness, integrity, business rules, and value consistency, the dataset was confirmed to be reliable and suitable for customer analytics, KPI reporting, and fraud detection using SQL Server.

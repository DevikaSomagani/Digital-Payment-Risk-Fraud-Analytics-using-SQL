# 🛡️ Fraud Analytics

## Overview

Fraud Analytics is the core component of this project, focusing on identifying suspicious transaction patterns and evaluating fraud risks within a digital payment platform. Using **Microsoft SQL Server**, more than **20,000 digital payment transactions** were analyzed to understand how fraud varies across customers, merchants, payment applications, devices, locations, and transaction characteristics.

The analysis demonstrates how SQL can be used to uncover fraud trends and generate actionable insights for improving fraud prevention strategies.

---

## 🎯 Objectives

The analysis aimed to:

* Identify fraud patterns across the platform
* Detect high-risk customers and merchants
* Compare fraud across payment applications and devices
* Analyze fraud by transaction type and timing
* Evaluate customer and transaction risk indicators
* Identify regional fraud hotspots
* Generate recommendations to strengthen fraud prevention

---

# 📊 Fraud Analytics Modules

## 1. Fraud Trend by Hour

**Business Question:** During which hours does fraud occur most frequently?

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount

**Business Value**

Identified high-risk hours for enhanced fraud monitoring and operational planning.

---

## 2. Fraud Trend by Day of Week

**Business Question:** Which days experience the highest fraud activity?

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate

**Business Value**

Supported efficient allocation of fraud monitoring resources throughout the week.

---

## 3. Fraud by Payment Application

Compared fraud performance across different payment applications.

### Metrics Analyzed

* Total Transactions
* Fraud Transactions
* Fraud Amount
* Fraud Rate

**Business Value**

Highlighted payment applications requiring stronger authentication and risk controls.

---

## 4. Fraud by Device Type

Compared fraud across different customer devices.

### Devices

* Android
* iPhone
* Web

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate

**Business Value**

Identified device-specific fraud trends to improve platform security.

---

## 5. Fraud by Transaction Type

Compared fraud across different payment categories.

### Transaction Types

* Peer-to-Peer (P2P)
* Merchant Payments
* Bill Payments
* Mobile Recharge

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate

**Business Value**

Identified transaction categories requiring enhanced fraud monitoring.

---

## 6. New Device Analysis

Evaluated whether first-time device usage increased fraud risk.

### Metrics Analyzed

* Fraud Transactions
* Fraud Rate

**Business Value**

Supported implementation of additional authentication for new devices.

---

## 7. IP Location Mismatch Analysis

Analyzed fraud associated with transactions originating from unexpected locations.

### Metrics Analyzed

* Fraud Transactions
* Fraud Rate

**Business Value**

Helped identify potential account takeover and unauthorized access attempts.

---

## 8. Failed Authentication Analysis

Evaluated the relationship between failed authentication attempts and fraud.

### Metrics Analyzed

* Failed Authentication Attempts
* Fraud Transactions
* Fraud Rate

**Business Value**

Supported early identification of suspicious customer activity.

---

## 9. Transaction Velocity Analysis

Analyzed whether rapid transaction activity increased fraud risk.

### Velocity Categories

* Low
* Medium
* High

### Metrics Analyzed

* Transaction Count
* Fraud Transactions
* Fraud Rate

**Business Value**

Supported velocity-based fraud detection and automated alert generation.

---

## 10. High-Value Transaction Analysis

Evaluated fraud across different transaction value ranges.

### Amount Categories

* ₹0–999
* ₹1,000–4,999
* ₹5,000–9,999
* ₹10,000+

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate

**Business Value**

Helped determine transaction thresholds requiring additional verification.

---

## 11. Merchant Fraud Ranking

Ranked merchants based on fraudulent activity.

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate
* Merchant Rank

**Business Value**

Supported merchant risk assessment, compliance reviews, and fraud investigations.

---

## 12. City-wise Fraud Analysis

Compared fraud activity across different cities.

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate
* City Rank

**Business Value**

Identified regional fraud hotspots for targeted monitoring and awareness campaigns.

---

## 13. High-Risk Customer Ranking

Ranked customers based on fraudulent transaction activity.

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Fraud Rate
* Customer Rank

**Business Value**

Enabled early identification of high-risk customers requiring additional verification.

---

## 14. Fraud Amount Distribution

Analyzed fraud across different transaction value ranges.

### Amount Buckets

* ₹0–999
* ₹1,000–4,999
* ₹5,000–9,999
* ₹10,000+

### Metrics Analyzed

* Fraud Transactions
* Fraud Amount
* Average Fraud Amount

**Business Value**

Helped understand how fraud is distributed across transaction amounts.

---

## 15. Fraud Pattern Combination Analysis

Examined combinations of transaction attributes associated with higher fraud risk.

### Combinations Analyzed

* Payment Application + Device Type
* Payment Application + Transaction Type
* City + Payment Application

**Business Value**

Identified high-risk attribute combinations to improve fraud detection rules and risk scoring.

---

# 📈 Key Insights

The fraud analysis identified:

* Peak fraud hours and weekdays
* High-risk payment applications
* Device-specific fraud patterns
* Fraud-prone transaction types
* Increased risk from new devices
* Fraud associated with IP location mismatches
* Correlation between failed authentication attempts and fraud
* High transaction velocity as a fraud indicator
* Fraud concentration in high-value transactions
* High-risk merchants, customers, and cities
* High-risk combinations of transaction attributes

---

# 🛠️ SQL Techniques Used

* Aggregate Functions (`COUNT`, `SUM`, `AVG`)
* GROUP BY
* CASE Expressions
* INNER JOIN
* Common Table Expressions (CTEs)
* Window Functions
* `RANK()` and `DENSE_RANK()`
* Conditional Aggregation
* Date Functions

---

# 💼 Business Recommendations

Based on the analysis, the following actions can strengthen fraud prevention:

* Implement additional verification for high-value transactions.
* Increase monitoring during peak fraud hours.
* Apply stronger authentication for first-time device usage.
* Flag transactions with IP location mismatches for review.
* Introduce velocity-based fraud detection rules.
* Enhance monitoring for high-risk merchants and cities.
* Apply risk-based authentication after repeated failed login attempts.
* Continuously monitor high-risk payment application and device combinations.

---

# ✅ Conclusion

Fraud Analytics transformed raw transaction data into actionable business intelligence by identifying fraud patterns across customers, merchants, devices, locations, and transaction characteristics. The analysis demonstrates how SQL can be used to support fraud detection, strengthen security controls, reduce financial losses, and enable data-driven decision-making within digital payment platforms.

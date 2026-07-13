# 💳 Transaction Analytics

## Overview

Transaction Analytics examines how customers interact with the digital payment platform by analyzing transaction volume, payment methods, transaction types, devices, timing, and customer behavior. The analysis helps uncover usage patterns, measure platform performance, and identify opportunities to improve customer experience and operational efficiency.

This analysis was performed on **20,000 digital payment transactions** using **Microsoft SQL Server**.

---

## 🎯 Objectives

The analysis aimed to:

* Understand overall transaction activity
* Analyze payment application usage
* Compare transaction types
* Study customer payment behavior
* Evaluate device preferences
* Analyze transaction timing
* Compare weekday and weekend activity
* Measure regional transaction distribution
* Assess the impact of KYC verification and customer loyalty
* Generate business insights to improve platform performance

---

# 📊 Transaction Analytics Modules

## 1. Overall Transaction Summary

**Business Question:** What is the overall transaction activity on the platform?

### Metrics Analyzed

* Total Transactions
* Total Transaction Amount
* Average Transaction Value
* Minimum Transaction Amount
* Maximum Transaction Amount

**Business Value**

Provided a high-level overview of platform usage and transaction performance.

---

## 2. Transaction Status Analysis

**Business Question:** How are transactions distributed across different statuses?

### Metrics Analyzed

* Successful Transactions
* Failed Transactions
* Pending Transactions
* Status Distribution

**Business Value**

Measured platform reliability and highlighted potential operational issues affecting transaction success.

---

## 3. Payment Application Analysis

**Business Question:** Which payment applications are used most frequently?

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Identified customer payment preferences and supported application performance monitoring.

---

## 4. Transaction Type Analysis

Compared transaction activity across different payment types.

### Transaction Types

* Peer-to-Peer (P2P)
* Merchant Payments
* Bill Payments
* Mobile Recharge

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Highlighted the payment services contributing most to platform activity.

---

## 5. Device Type Analysis

Compared customer transactions across different devices.

### Devices

* Android
* iPhone
* Web

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Supported mobile optimization, user experience improvements, and device-specific security planning.

---

## 6. Receiver Type Analysis

Compared transactions made to:

* Users
* Merchants

### Metrics Analyzed

* Transaction Count
* Total Transaction Value

**Business Value**

Measured the balance between personal transfers and commercial payments.

---

## 7. Hourly Transaction Analysis

Analyzed transaction activity across the 24-hour day.

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Identified peak usage periods for infrastructure planning, system monitoring, and fraud surveillance.

---

## 8. Weekly Transaction Analysis

Compared transaction activity across different days of the week.

### Metrics Analyzed

* Transaction Count
* Total Transaction Value

**Business Value**

Revealed weekly usage patterns to support operational planning and marketing campaigns.

---

## 9. Weekday vs. Weekend Analysis

Compared customer behavior during weekdays and weekends.

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Helped optimize promotional campaigns and resource allocation based on customer activity patterns.

---

## 10. City Tier Analysis

Compared transaction activity across different city tiers.

### City Tiers

* Tier 1
* Tier 2
* Tier 3

### Metrics Analyzed

* Transaction Count
* Total Transaction Value
* Average Transaction Value

**Business Value**

Provided insights into regional adoption of digital payment services.

---

## 11. KYC Status Analysis

Compared transaction behavior between verified and non-verified customers.

### Metrics Analyzed

* Transaction Count
* Total Spending
* Average Spending

**Business Value**

Evaluated how customer verification influences platform usage and transaction activity.

---

## 12. Customer Loyalty Analysis

Compared transaction behavior based on customer loyalty scores.

### Metrics Analyzed

* Average Transactions
* Average Spending

**Business Value**

Measured the effectiveness of customer loyalty programs and identified highly engaged users.

---

# 📈 Key Insights

The transaction analysis provided insights into:

* Overall platform transaction performance
* Payment application popularity
* Customer payment preferences
* Transaction type distribution
* Device usage trends
* Peak transaction hours
* Weekly activity patterns
* Regional transaction distribution
* Receiver preferences
* Customer verification behavior
* Loyalty-based transaction patterns

---

# 🛠️ SQL Techniques Used

* Aggregate Functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
* GROUP BY
* ORDER BY
* CASE Expressions
* INNER JOIN
* Common Table Expressions (CTEs)
* Window Functions
* Date Functions
* Conditional Aggregation

---

# 💼 Business Impact

The findings support:

* Performance optimization
* Customer experience improvements
* Infrastructure capacity planning
* Marketing campaign planning
* Regional growth analysis
* Loyalty program evaluation
* Risk monitoring during peak transaction periods
* Data-driven operational decision-making

---

# ✅ Conclusion

Transaction Analytics provides a comprehensive view of customer payment behavior across the digital payment platform. By examining transaction patterns across multiple dimensions, the analysis demonstrates how SQL can be used to monitor platform performance, understand customer preferences, and generate actionable business insights for operational improvement and strategic decision-making.

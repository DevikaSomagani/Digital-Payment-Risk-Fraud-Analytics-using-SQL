# 👥 Customer Analytics

## Overview

Customer Analytics was performed to understand customer behavior, spending patterns, loyalty, engagement, and fraud risk within the digital payment platform. By combining data from the **Users** and **Transactions** tables, the analysis provides insights that support customer retention, personalized marketing, and fraud prevention.

---

## 🎯 Objectives

The analysis aimed to:

* Identify high-value customers
* Detect inactive customers
* Segment customers based on spending behavior
* Evaluate customer loyalty
* Compare high-risk users with normal users
* Analyze spending across cities and age groups
* Measure the impact of KYC verification
* Calculate Customer Lifetime Value (CLV)
* Rank top customers
* Identify repeat customers

---

# 📊 Customer Analytics Modules

## 1. Most Valuable Customers

**Business Question:** Who are the platform's highest-value customers?

### Metrics Analyzed

* Total Transactions
* Total Spending
* Average Transaction Value
* Fraud Count
* Fraud Amount

**Business Value**

* Identify premium customers
* Support loyalty programs
* Enable personalized offers
* Prioritize customer support

---

## 2. Inactive Customers

**Business Question:** Which customers have become inactive?

### Metrics Analyzed

* Total Transactions
* Last Transaction Date
* Days Since Last Transaction

**Business Value**

* Identify churn risk
* Improve customer retention
* Launch targeted re-engagement campaigns

---

## 3. Customer Spending Segmentation

Customers were classified into four spending segments:

* Low Value
* Medium Value
* High Value
* VIP

**Business Value**

* Personalized marketing
* Reward optimization
* Customer targeting
* Revenue growth strategies

---

## 4. Loyalty Score Analysis

Evaluated the relationship between customer loyalty scores and spending behavior.

### Metrics Analyzed

* Average Spending
* Average Transactions
* Customer Count

**Business Value**

Measured the effectiveness of customer loyalty programs.

---

## 5. High-Risk vs. Normal Users

Compared customer behavior between high-risk and normal users.

### Metrics Analyzed

* Average Spending
* Average Transactions
* Fraud Rate

**Business Value**

Validated whether existing customer risk classifications accurately identify fraud-prone users.

---

## 6. City-wise Customer Analysis

Compared customer activity across different cities.

### Metrics Analyzed

* Total Transactions
* Total Revenue
* Fraud Amount
* Fraud Rate

**Business Value**

* Identify high-value regions
* Detect fraud hotspots
* Support regional business strategies

---

## 7. Age Group Analysis

Compared spending behavior across customer age groups.

### Metrics Analyzed

* Total Spending
* Average Spending
* Fraud Rate

**Business Value**

Supported customer segmentation and targeted marketing initiatives.

---

## 8. KYC Status Analysis

Compared verified and non-verified customers.

### Metrics Analyzed

* Total Spending
* Fraud Amount
* Fraud Rate

**Business Value**

Evaluated the effectiveness of KYC verification in reducing fraudulent activity.

---

## 9. Customer Lifetime Value (CLV)

Estimated the long-term value of each customer.

### Metrics Analyzed

* Total Spending
* Total Transactions
* Average Transaction Value
* Account Age
* Spending per Day

**Business Value**

* Identify premium customers
* Improve retention strategies
* Optimize marketing investments

---

## 10. Top Customer Ranking

Ranked customers based on their total spending.

### Metrics Analyzed

* Total Spending
* Total Transactions
* Fraud Count
* Customer Rank

**Business Value**

Helped identify customers eligible for premium services, exclusive rewards, and personalized financial products.

---

## 11. Repeat Customer Analysis

Customers were classified based on transaction frequency.

### Customer Categories

* One-Time Customers
* Repeat Customers

**Business Value**

Measured customer engagement and retention, helping assess long-term platform adoption.

---

# 📈 Key Business Insights

The analysis identified:

* High-value customers contributing the largest share of revenue
* Inactive customers requiring retention efforts
* Customer spending segments for targeted marketing
* The relationship between loyalty scores and spending behavior
* Differences between high-risk and normal users
* High-performing cities and regions
* Spending trends across age groups
* The effectiveness of KYC verification
* Customer Lifetime Value (CLV)
* Repeat customer behavior and platform engagement

---

# 🛠️ SQL Techniques Used

* JOINs
* Aggregate Functions (`COUNT`, `SUM`, `AVG`, `MAX`)
* CASE Expressions
* Common Table Expressions (CTEs)
* Window Functions
* `RANK()` and `DENSE_RANK()`
* Date Functions
* Conditional Aggregation
* `ROUND()` and `NULLIF()`

---

# ✅ Conclusion

Customer Analytics transformed transactional and customer profile data into actionable business insights. The analysis supports customer segmentation, retention strategies, fraud prevention, loyalty program evaluation, and data-driven decision-making, demonstrating how SQL can be applied to solve real-world business problems in the digital payments domain.

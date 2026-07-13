# 💳 Digital Payment Risk & Fraud Analytics using SQL

## 📌 Project Overview

This project demonstrates an end-to-end SQL data analytics workflow using a digital payment dataset. It focuses on analyzing customer transactions, identifying fraud patterns, evaluating business performance, and generating actionable insights using **Microsoft SQL Server**.

The project simulates the responsibilities of a **Data Analyst**, covering everything from database design and data validation to exploratory analysis, KPI reporting, customer segmentation, and fraud analytics.

---

## 🎯 Business Problem

Digital payment platforms process millions of transactions every day, making fraud detection a critical business challenge. Organizations need to identify suspicious activities while maintaining a seamless customer experience.

This project answers business questions such as:

* Which payment applications experience the highest fraud?
* Which customers contribute the most to fraudulent transactions?
* Which cities require stronger fraud monitoring?
* Does KYC verification reduce fraud?
* Are new devices more likely to perform fraudulent transactions?
* Which merchant categories are most vulnerable to fraud?
* During which hours does fraud occur most frequently?
* Which customer segments generate the highest business value?

---

## 🎯 Project Objectives

* Design a relational database in Microsoft SQL Server.
* Import and organize raw CSV datasets.
* Perform data validation and quality assessment.
* Conduct Exploratory Data Analysis (EDA).
* Build KPI and trend analysis reports.
* Analyze customer behavior and transaction patterns.
* Detect fraud using transaction-level indicators.
* Generate business insights and recommendations.
* Demonstrate advanced SQL concepts in a real-world business scenario.

---

## 📂 Project Workflow

1. Database Design
2. Data Import
3. Data Validation
4. Data Quality Assessment
5. Exploratory Data Analysis (EDA)
6. KPI & Trend Analysis
7. Customer Segmentation Analysis
8. Fraud Pattern & Risk Analysis
9. Business Insights & Recommendations

---

## 🛠️ Technologies Used

| Technology                          | Purpose                         |
| ----------------------------------- | ------------------------------- |
| Microsoft SQL Server 2022 Express   | Database Management System      |
| SQL Server Management Studio (SSMS) | Query Development               |
| T-SQL                               | Data Analysis and Querying      |
| CSV Files                           | Source Dataset                  |
| GitHub                              | Version Control & Documentation |

---

## 📊 Dataset Overview

The project analyzes three datasets:

| Table        | Records |
| ------------ | ------: |
| Users        |   2,000 |
| Merchants    |     400 |
| Transactions |  20,000 |

The **Transactions** table includes fraud-related attributes such as:

* Fraud status
* Transaction velocity
* IP location mismatch
* Failed authentication attempts
* New device indicator

These attributes enable fraud analysis without requiring a separate fraud table.

---

## 🗄️ Database Design

**Database:** `DigitalPaymentRiskDB`

**Schema:** `staging`

### Tables

* **users** – Customer profile information
* **merchants** – Merchant details
* **transactions** – Payment transactions and fraud indicators

Relationships are maintained using primary and foreign keys to ensure data integrity.

---

## 📁 Repository Structure

```text
Digital-Payment-Risk-Fraud-Analytics-using-SQL

├── 01_Database_Setup
├── 02_SQL_Analysis
├── README.md
```

---

## 📚 SQL Concepts Demonstrated

* DDL (Data Definition Language)
* DML (Data Manipulation Language)
* Aggregate Functions
* CASE Expressions
* Common Table Expressions (CTEs)
* JOIN Operations
* Subqueries
* GROUP BY & HAVING
* Window Functions
* Ranking Functions
* Views
* Stored Procedures
* Business KPI Calculations
* Fraud Analytics Queries

---

## 📈 Analysis Performed

* Data Quality Assessment
* Exploratory Data Analysis (EDA)
* KPI & Trend Analysis
* Customer Segmentation
* Transaction Analysis
* Fraud Pattern Analysis
* Risk Analytics
* Business Insights

---

## 💡 Business Outcomes

The analysis helps organizations:

* Identify high-value customers
* Detect high-risk users
* Measure fraud across payment applications
* Compare fraud across cities and merchant categories
* Understand customer spending behavior
* Monitor key business KPIs
* Identify fraud trends over time
* Support data-driven business decisions

---

## 🎓 Skills Demonstrated

* Relational Database Design
* SQL Server Development
* Data Validation
* Data Quality Assessment
* Exploratory Data Analysis
* Business KPI Reporting
* Customer Segmentation
* Fraud Detection
* Advanced SQL Programming
* Business Insight Generation
* Technical Documentation

---

## 🚀 Conclusion

This project demonstrates how SQL can be used beyond data retrieval to solve real-world business problems. By combining database design, data validation, exploratory analysis, KPI reporting, customer analytics, and fraud detection, it delivers a complete end-to-end analytics solution while showcasing practical SQL and business analysis skills.

# SQL Concepts Used

## Digital Payment Risk & Fraud Analytics using SQL

---

## Overview

This project demonstrates the practical application of **SQL** to solve real-world business problems in the digital payments domain. Using **Microsoft SQL Server 2022**, the project covers the complete analytics workflow—from database design and data preparation to fraud detection and business reporting.

The following SQL concepts were applied throughout the project.

---

## Database Design (DDL)

Database objects were created using Data Definition Language (DDL).

**Concepts Used**

- CREATE DATABASE
- CREATE SCHEMA
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- CHECK Constraints
- NOT NULL

**Applied To**

- Creating the `staging` schema
- Creating the `Users`, `Merchants`, and `Transactions` tables
- Enforcing data integrity through keys and constraints

---

## Data Import

CSV datasets were imported into SQL Server using the Import Wizard.

**Datasets Imported**

- Users
- Merchants
- Transactions

After import, validation checks were performed to ensure data quality before analysis.

---

## Data Validation

Several validation checks were performed to verify the integrity and consistency of the imported data.

**Validation Performed**

- Row Count Validation
- Primary Key Validation
- Missing Value Checks
- Domain Validation
- Data Range Validation
- Foreign Key Validation
- Business Rule Validation
- Fraud Distribution Validation

---

## Data Querying (DML)

The following DML statements were used throughout the project:

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY

These statements formed the foundation of all analytical queries.

---

## Aggregate Functions

Aggregate functions were used to summarize business metrics.

**Functions Used**

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

**Business Applications**

- Transaction volume
- Customer spending
- Merchant performance
- Fraud statistics
- KPI reporting

---

## CASE Expressions

`CASE` expressions were used to classify and categorize data.

**Applications**

- Customer Segmentation
- Fraud Categories
- Transaction Amount Buckets
- Transaction Velocity Groups
- Risk Classification

---

## JOIN Operations

Tables were combined using **INNER JOIN** to generate business insights.

**Relationships Used**

- Transactions ↔ Users
- Transactions ↔ Merchants

**Applications**

- Customer Analytics
- Merchant Analytics
- Fraud Analytics
- City Analysis
- Age Group Analysis

---

## Common Table Expressions (CTEs)

CTEs were used to simplify complex analytical queries.

**Applications**

- Customer Segmentation
- Fraud Analysis
- Intermediate Aggregations
- Ranking Preparation

**Benefits**

- Improved readability
- Reduced query complexity
- Easier maintenance

---

## Window Functions

Window functions were used for ranking and comparative analysis.

**Functions Used**

- RANK()

**Applications**

- Top Customers
- Merchant Ranking
- City Ranking

---

## Views

Views were created to simplify reporting and improve code reusability.

**Benefits**

- Reusable query logic
- Simplified reporting
- Easier maintenance

---

## Stored Procedures

Stored procedures were created to automate frequently used analytical reports.

**Benefits**

- Code reusability
- Centralized business logic
- Simplified execution
- Easier maintenance

---

## Subqueries

Subqueries were used for layered calculations and comparative analysis.

**Applications**

- Ranking calculations
- Intermediate summaries
- Business comparisons

---

## Mathematical Functions

Mathematical functions improved numerical reporting.

**Functions Used**

- ROUND()

**Applications**

- Fraud Rate
- Average Transaction Amount
- Percentage Calculations

---

## Operators

### Logical Operators

- AND
- OR
- IN
- BETWEEN

### Comparison Operators

- =
- >
- <
- >=
- <=
- <>

These operators were used extensively for filtering and conditional analysis.

---

## Business Analytics Performed

### Customer Analytics

- Customer Segmentation
- Customer Lifetime Value
- Loyalty Analysis
- KYC Analysis
- High-Risk User Analysis

### Transaction Analytics

- Payment Application Analysis
- Transaction Type Analysis
- Device Analysis
- Hourly Trends
- Weekly Trends

### Fraud Analytics

- Fraud by Payment App
- Fraud by Merchant
- Fraud by User
- Fraud by City
- Fraud by Device
- Transaction Velocity Analysis
- High-Value Transaction Analysis
- Fraud Pattern Analysis

---

## SQL Skills Demonstrated

This project demonstrates proficiency in:

- Relational Database Design
- SQL Server Development
- Data Validation
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Customer Analytics
- Transaction Analytics
- Fraud Analytics
- KPI Reporting
- Business Intelligence
- Query Optimization

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| Microsoft SQL Server 2022 Express | Database Management System |
| SQL Server Management Studio (SSMS) | Query Development |
| T-SQL | SQL Programming |
| CSV Files | Source Dataset |
| GitHub | Version Control & Documentation |

---

## Project Outcomes

By applying these SQL concepts, the project successfully:

- Designed a normalized relational database.
- Imported and validated raw datasets.
- Performed exploratory data analysis.
- Generated customer and transaction insights.
- Detected fraud patterns.
- Ranked customers, merchants, and cities.
- Produced KPI reports.
- Delivered actionable business recommendations.

---

## Conclusion

This project demonstrates how SQL can be applied beyond data retrieval to solve real-world business problems. By combining database design, data validation, analytical querying, and business interpretation, the project highlights practical SQL skills commonly required for **Data Analyst**, **SQL Developer**, and **Business Intelligence** roles.

# Digital Payment Risk & Fraud Analytics using SQL

> **End-to-End SQL Portfolio Project using Microsoft SQL Server 2022**

------------------------------------------------------------------------

# Overview

The **Digital Payment Risk & Fraud Analytics using SQL** project
demonstrates how Structured Query Language (SQL) can be used to solve
real-world business problems in the digital payments industry. As
digital payment platforms continue to grow, organizations process
millions of transactions every day, making fraud detection, customer
behavior analysis, and transaction monitoring critical business
functions.

This project was developed using **Microsoft SQL Server 2022 Express
Edition** and **SQL Server Management Studio (SSMS)**. It covers the
complete analytics lifecycle---from relational database design and data
validation to business reporting and fraud analysis.

Instead of focusing only on writing SQL queries, this project emphasizes
transforming raw transactional data into actionable business insights
that can support fraud prevention, improve operational efficiency, and
enhance customer trust.

------------------------------------------------------------------------

# Project Objectives

The primary objectives of this project are:

-   Design a normalized relational database.
-   Import CSV datasets into SQL Server.
-   Validate data quality before analysis.
-   Perform exploratory data analysis (EDA).
-   Analyze customer behavior and transaction trends.
-   Detect fraud patterns using SQL.
-   Rank users, merchants, cities, and payment applications by fraud
    metrics.
-   Generate business insights and recommendations.

------------------------------------------------------------------------

# Dataset Summary

  Dataset                Records
  -------------------- ---------
  Users                    2,000
  Merchants                  400
  Transactions            20,000
  Fraud Transactions         763

The project uses four CSV files:

-   users.csv
-   merchants.csv
-   transactions.csv
-   fraud_labels.csv

------------------------------------------------------------------------

# Technology Stack

-   Microsoft SQL Server 2022 Express Edition
-   SQL Server Management Studio (SSMS)
-   T-SQL (Transact-SQL)
-   Git & GitHub

------------------------------------------------------------------------

# Database Design

The database contains three primary tables:

## Users

Stores customer profile information including:

-   User ID
-   Age Group
-   City
-   KYC Status
-   Account Age
-   Linked Bank Count
-   Preferred Payment App
-   Preferred Device
-   Loyalty Score
-   High Risk Flag

## Merchants

Stores merchant details including:

-   Merchant ID
-   Merchant Name
-   Merchant Category
-   Merchant Size
-   City
-   Registration Status
-   Rating

## Transactions

Stores transaction-level details including:

-   Transaction ID
-   User ID
-   Receiver ID
-   Amount
-   Timestamp
-   Transaction Type
-   Payment Application
-   Device Type
-   Status
-   Transaction Velocity
-   Fraud Flag
-   New Device Flag
-   IP Mismatch
-   Failed Attempts
-   Balance After Transaction

The design enforces:

-   Primary Keys
-   Foreign Keys
-   CHECK Constraints
-   NOT NULL Constraints

------------------------------------------------------------------------

# Data Validation

Before analysis, extensive validation checks were performed:

-   Row Count Validation
-   Primary Key Validation
-   Missing Values
-   Domain Validation
-   Data Range Validation
-   Foreign Key Validation
-   Fraud Distribution Validation
-   Business Rule Validation
-   Negative Amount Validation
-   Invalid Hour Validation

These checks ensured that the data was accurate and reliable for
analysis.

------------------------------------------------------------------------

# Analytics Performed

## Exploratory Data Analysis

EDA answered questions such as:

-   Total transactions
-   Transaction status distribution
-   Payment app usage
-   Transaction type distribution
-   Device usage
-   Hourly transaction trends
-   Weekday analysis

## Customer Analytics

Customer-focused analysis included:

-   Age group analysis
-   City analysis
-   KYC analysis
-   Loyalty score analysis
-   High-risk user analysis
-   Customer ranking

## Transaction Analytics

Transaction analysis covered:

-   Transaction amount distribution
-   Large transaction analysis
-   Payment application analysis
-   Device analysis
-   Transaction velocity
-   New device activity

## Fraud Analytics

Fraud analysis identified:

-   Fraud by payment application
-   Fraud by merchant category
-   Fraud by city
-   Fraud by user
-   Fraud by device
-   Fraud by transaction type
-   Fraud timing
-   Fraud amount buckets
-   Merchant and user rankings

------------------------------------------------------------------------

# SQL Concepts Demonstrated

This project demonstrates practical usage of:

-   DDL
-   DML
-   Aggregate Functions
-   CASE Expressions
-   INNER JOIN
-   Common Table Expressions (CTEs)
-   Views
-   Stored Procedures
-   Window Functions (RANK)
-   Subqueries
-   Constraints
-   Mathematical Functions
-   Logical Operators

------------------------------------------------------------------------

# Business Insights

The analysis revealed that fraud patterns differ across payment
applications, merchant categories, transaction types, devices, cities,
and customer segments.

Key recommendations include:

-   Increase monitoring during high-risk hours.
-   Strengthen verification for new-device logins.
-   Apply additional authentication for high-value transactions.
-   Expand KYC adoption.
-   Continuously monitor high-risk merchants and users.
-   Develop behaviour-based fraud detection models.

------------------------------------------------------------------------

# Repository Structure

``` text
01.Dataset/
02.Database/
03.SQL_Scripts/
04.Documentation/
05.Images/
README.md
LICENSE
```

------------------------------------------------------------------------

# Future Enhancements

Future improvements include:

-   Interactive Power BI dashboard
-   Real-time fraud monitoring
-   Machine learning fraud prediction
-   Automated reporting using SQL Agent
-   Dynamic customer risk scoring

------------------------------------------------------------------------

# Learning Outcomes

This project strengthened practical skills in:

-   SQL Server
-   Relational Database Design
-   Data Validation
-   Data Cleaning
-   Business Analytics
-   Fraud Detection
-   Customer Analytics
-   Transaction Analytics
-   Business Reporting

------------------------------------------------------------------------

# Author

**Devika Somagani**

This project was developed as a portfolio project to demonstrate
practical SQL, analytical thinking, and business problem-solving skills
for Data Analyst and SQL Developer roles.


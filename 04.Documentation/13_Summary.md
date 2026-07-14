# 📌 Project Summary

## Executive Summary

The **Digital Payment Risk & Fraud Analytics using SQL** project was developed to analyze transaction data from a digital payment ecosystem and identify meaningful business insights related to customer behavior, transaction patterns, merchant performance, and fraud detection.

The project was implemented using **Microsoft SQL Server 2022 Express Edition** and T-SQL. A normalized relational database (**DigitalPaymentRiskDB**) was designed to store and manage customer, merchant, and transaction information. After performing data validation and cleaning, multiple analytical SQL queries were executed to understand transaction trends, customer characteristics, fraud distribution, and business risks.

The analysis covered approximately **20,000 digital payment transactions**, **2,000 users**, and **400 merchants**, providing a realistic simulation of a digital payment platform.

---

# 🎯 Project Outcome

The primary objective of this project was to demonstrate how SQL can be used to solve real-world business problems by transforming raw transactional data into actionable insights.

The project successfully achieved the following:

- Designed a normalized relational database using SQL Server.
- Imported and validated multiple datasets.
- Performed comprehensive exploratory data analysis.
- Analyzed customer demographics and transaction behavior.
- Identified fraud patterns across payment applications, merchants, and customers.
- Generated business recommendations to strengthen fraud prevention.

The project demonstrates practical SQL skills commonly required for **Data Analyst**, **SQL Developer**, and **Business Intelligence Analyst** roles.

---

# 📊 Key Business Findings

## 1. Payment Application Analysis

The analysis revealed significant differences in fraud occurrence across payment applications.

| Payment Application | Total Transactions | Fraud Transactions | Fraud Rate |
|---------------------|------------------:|------------------:|-----------:|
| GPay | 6,438 | 245 | 3.81% |
| PhonePe | 5,864 | 220 | 3.75% |
| Paytm | 3,738 | 149 | 3.99% |
| Amazon Pay | 1,584 | 66 | 4.17% |
| BHIM | 1,595 | 49 | 3.07% |
| WhatsApp Pay | 781 | 34 | **4.35%** |

### Insights

- **GPay** processed the highest number of transactions and also recorded the highest number of fraudulent transactions.
- **PhonePe** ranked second in both transaction volume and fraud count.
- **WhatsApp Pay** recorded the highest fraud rate despite processing the fewest transactions.
- **BHIM** showed the lowest fraud rate among all payment applications.

These findings indicate that fraud monitoring should consider both fraud volume and fraud rate instead of relying solely on transaction count.

---

## 2. Merchant Category Analysis

Fraud distribution varied across merchant categories.

The analysis showed that:

- Fuel merchants recorded the highest fraud rate.
- Grocery and Food & Dining merchants also experienced relatively higher fraud activity.
- Shopping merchants processed the highest number of transactions but did not have the highest fraud rate.

This suggests that merchant-specific fraud rules should be implemented based on category risk rather than transaction volume alone.

---

## 3. Customer Analytics

Customer analysis highlighted differences in fraud occurrence across demographic groups.

Key observations include:

- Customers aged **55 years and above** recorded one of the highest fraud rates.
- Users with **Verified KYC** generated the majority of transactions because they represent most active customers.
- However, **Not Verified KYC** users showed a significantly higher fraud rate, making KYC verification an important fraud prevention measure.
- High-risk users experienced substantially higher fraud rates compared to normal users.

These findings demonstrate that customer profile information plays a critical role in fraud risk assessment.

---

## 4. Device Analysis

The project analyzed transaction behavior across different device platforms.

The results showed that:

- Web transactions recorded the highest fraud rate.
- Android users generated the largest transaction volume.
- Transactions initiated from **newly registered devices** showed significantly higher fraud rates than transactions from existing devices.

Device information can therefore be considered an important behavioral feature for fraud detection.

---

## 5. Transaction Behaviour Analysis

Transaction analysis identified several interesting patterns.

- Most transactions belonged to the lower transaction amount range.
- Fraudulent transactions were also concentrated in smaller transaction amounts.
- Transaction timing showed certain periods with relatively higher fraud occurrence.
- Weekend and weekday fraud rates were relatively consistent, indicating that fraud monitoring should remain active throughout the week.

---

## 6. Fraud Pattern Analysis

The fraud analysis identified several important behavioural indicators.

The strongest fraud indicators observed were:

- New device usage
- Incomplete KYC verification
- High-risk customer classification
- High-risk merchant categories
- Web platform transactions
- Certain payment applications exhibiting higher fraud rates

These behavioural features can be incorporated into fraud detection models to improve prediction accuracy.

---

# 💼 Business Recommendations

Based on the findings obtained from SQL analysis, the following recommendations are proposed.

### Strengthen KYC Verification

Customers without completed KYC verification exhibited significantly higher fraud rates. Mandatory KYC verification before enabling high-value transactions can reduce fraud exposure.

---

### Increase Monitoring for New Devices

Transactions initiated from newly registered devices demonstrated substantially higher fraud risk.

Additional verification methods such as OTP confirmation or biometric authentication should be applied to new devices.

---

### Risk-Based Monitoring for Payment Applications

Different payment applications exhibited different fraud rates.

Applications with relatively higher fraud rates should be monitored using stricter fraud detection thresholds.

---

### Merchant Risk Monitoring

Merchant categories such as Fuel, Grocery, and Food & Dining require additional fraud monitoring because of their relatively higher fraud exposure.

Merchant-specific fraud scoring can improve overall fraud detection efficiency.

---

### Behaviour-Based Fraud Detection

Fraud detection systems should combine multiple behavioural indicators, including:

- Device information
- Payment application
- KYC status
- User loyalty score
- Transaction velocity
- Failed authentication attempts
- IP location mismatch

Combining these indicators will improve fraud prediction compared to rule-based detection.

---

# 🛠 SQL Skills Demonstrated

This project demonstrates practical implementation of numerous SQL concepts including:

- Database Design
- Data Definition Language (DDL)
- Data Manipulation Language (DML)
- Aggregate Functions
- GROUP BY
- HAVING
- CASE Expressions
- Common Table Expressions (CTEs)
- INNER JOIN
- LEFT JOIN
- Window Functions
- Ranking Functions
- Views
- Stored Procedures
- Constraints
- Data Validation
- Business Reporting

---

# 📈 Business Impact

The analysis performed in this project demonstrates how SQL can support business decision-making in digital payment systems.

The generated insights can help organizations:

- Reduce financial losses due to fraud.
- Improve customer verification processes.
- Detect suspicious transactions more quickly.
- Prioritize investigation of high-risk users.
- Monitor high-risk merchant categories.
- Strengthen transaction security.
- Improve fraud prevention strategies.

---

# 🎓 Learning Outcomes

Through this project, the following technical and analytical skills were strengthened:

- Relational Database Design
- Microsoft SQL Server
- T-SQL Programming
- Data Validation
- Data Cleaning
- Exploratory Data Analysis
- Customer Analytics
- Fraud Analytics
- Business Intelligence
- Problem Solving
- Data-Driven Decision Making

---

# 🏁 Final Conclusion

The **Digital Payment Risk & Fraud Analytics using SQL** project demonstrates how SQL can be applied to solve real-world analytical problems in the financial technology domain.

Starting from database design and ending with business recommendations, the project covers the complete lifecycle of a SQL analytics solution. By integrating customer, merchant, and transaction data, meaningful fraud patterns were identified and translated into practical recommendations that can improve transaction security and operational decision-making.

This project showcases practical SQL development, relational database design, analytical thinking, and business problem-solving skills, making it highly relevant for Data Analyst, SQL Developer, Business Intelligence Analyst, and Data Engineering roles.

---

## ⭐ Repository Information

**Project Name:** Digital Payment Risk & Fraud Analytics using SQL

**Database:** DigitalPaymentRiskDB

**RDBMS:** Microsoft SQL Server 2022 Express Edition

**Language:** T-SQL

**Records Analysed:**

- Users: 2,000
- Merchants: 400
- Transactions: 20,000

**Project Type:** End-to-End SQL Analytics Portfolio Project

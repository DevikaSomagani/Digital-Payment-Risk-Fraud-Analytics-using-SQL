# 🗄️ Database Design

## Overview

The **Digital Payment Risk & Fraud Analytics** project is built using a **relational database** in **Microsoft SQL Server 2022 Express Edition**. The database is designed to store customer, merchant, and transaction data in a structured format to support:

* Fraud Detection
* Customer Analytics
* KPI Reporting
* Business Intelligence

The design follows relational database principles by separating data into independent tables connected through primary and foreign keys. This reduces redundancy, improves data integrity, and enables efficient SQL analysis.

---

## 📋 Database Information

| Property      | Value                                         |
| ------------- | --------------------------------------------- |
| Database      | **DigitalPaymentRiskDB**                      |
| Platform      | **Microsoft SQL Server 2022 Express Edition** |
| Schema        | **staging**                                   |
| Database Type | Relational Database                           |
| Language      | T-SQL                                         |

---

# 🏗️ Database Architecture

```text
                 +----------------------+
                 |        USERS         |
                 +----------------------+
                 | PK user_id           |
                 | age_group            |
                 | city                 |
                 | city_tier            |
                 | kyc_status           |
                 | user_loyalty_score   |
                 +----------------------+
                          |
                          | user_id
                          ▼
                 +---------------------------+
                 |      TRANSACTIONS         |
                 +---------------------------+
                 | PK transaction_id         |
                 | FK user_id                |
                 | receiver_id               |
                 | payment_app               |
                 | amount                    |
                 | device_type               |
                 | is_fraud                  |
                 | transaction_velocity      |
                 +---------------------------+
                          |
                          | receiver_id
                          ▼
                 +----------------------+
                 |      MERCHANTS       |
                 +----------------------+
                 | PK merchant_id       |
                 | merchant_name        |
                 | merchant_category    |
                 | city                 |
                 +----------------------+
```

---

# 📂 Database Tables

| Table            | Purpose                                          |
| ---------------- | ------------------------------------------------ |
| **Users**        | Stores customer profile information              |
| **Merchants**    | Stores merchant information                      |
| **Transactions** | Stores payment transactions and fraud indicators |

---

# 👤 Users Table

**Primary Key:** `user_id`

Stores customer profile information including:

* Demographics
* KYC status
* Loyalty score
* Account age
* Preferred payment application
* Preferred device
* Risk classification

Used for:

* Customer Segmentation
* Loyalty Analysis
* KYC Analysis
* Customer Lifetime Value
* High-Risk Customer Identification

---

# 🏪 Merchants Table

**Primary Key:** `merchant_id`

Stores merchant information used for:

* Merchant Performance Analysis
* Merchant Category Analysis
* Revenue Analysis
* Fraud Monitoring

---

# 💳 Transactions Table

**Primary Key:** `transaction_id`

The central **fact table** containing every payment transaction.

It includes:

* Transaction details
* Payment information
* Customer attributes
* Device information
* Time information
* Fraud indicators

Most analytical queries in this project are built using this table.

---

# 🔗 Table Relationships

## Users → Transactions

**Relationship:** One-to-Many

One customer can perform multiple transactions.

```text
User001
   ├── Transaction001
   ├── Transaction002
   ├── Transaction003
   └── Transaction004
```

---

## Merchants → Transactions

**Relationship:** One-to-Many

One merchant can receive payments from multiple customers.

```text
Merchant010
   ├── Transaction210
   ├── Transaction580
   ├── Transaction971
   └── Transaction1502
```

---

# 🔑 Primary Keys

| Table        | Primary Key      |
| ------------ | ---------------- |
| Users        | `user_id`        |
| Merchants    | `merchant_id`    |
| Transactions | `transaction_id` |

Primary keys uniquely identify each record and prevent duplicate entries.

---

# 🔗 Foreign Keys

| Child Table  | Parent Table | Column    |
| ------------ | ------------ | --------- |
| Transactions | Users        | `user_id` |

This relationship ensures every transaction belongs to a valid customer.

---

# ❓ Why `receiver_id` Is Not a Foreign Key

The `receiver_id` column can reference either:

* Another **User**
* A **Merchant**

The actual destination is determined by the `receiver_type` column.

Because a SQL Server foreign key cannot reference multiple parent tables, `receiver_id` is intentionally **not enforced as a foreign key**. This design reflects how real-world payment platforms support both peer-to-peer and merchant payments.

---

# ✅ Constraints Implemented

| Constraint                                         | Purpose                                |
| -------------------------------------------------- | -------------------------------------- |
| Primary Key                                        | Ensures unique records                 |
| Foreign Key                                        | Maintains referential integrity        |
| `CHECK (amount > 0)`                               | Prevents invalid transaction amounts   |
| `CHECK (hour_of_day BETWEEN 0 AND 23)`             | Ensures valid transaction hours        |
| `CHECK (receiver_type IN ('User','Merchant'))`     | Restricts receiver types               |
| `CHECK (status IN ('Success','Failed','Pending'))` | Allows only valid transaction statuses |

---

# 🧩 Normalization

The database follows normalization principles:

* ✅ **First Normal Form (1NF)** – Atomic values with no repeating groups.
* ✅ **Second Normal Form (2NF)** – Non-key attributes depend on the entire primary key.
* ✅ **Third Normal Form (3NF)** – No transitive dependencies; customer and merchant information is stored separately to reduce redundancy.

---

# 📁 Why the `staging` Schema?

A dedicated **staging** schema was used to:

* Organize database objects
* Improve maintainability
* Separate project objects from system tables
* Enhance readability
* Follow industry-standard database practices

---

# 🛠️ SQL Objects Created

The project includes the following SQL objects:

* Database
* Schema
* Tables
* Primary Keys
* Foreign Keys
* Check Constraints
* Views
* Stored Procedures

---

# ⭐ Design Advantages

* Normalized database structure
* Minimal data redundancy
* High data consistency
* Easy maintenance
* Efficient JOIN operations
* Supports advanced SQL analysis
* Optimized for fraud detection
* Suitable for business reporting
* Easily extensible for future enhancements

---

# ⚠️ Design Limitations

* `receiver_id` is not enforced as a foreign key because it can reference either a user or a merchant.
* Historical customer profile changes are not tracked.
* Real-time transaction streaming is outside the project scope.
* Fraud attributes are stored within the **Transactions** table instead of a separate fraud table.

---

# ✅ Conclusion

The **DigitalPaymentRiskDB** database follows a clean and scalable relational design that supports customer analytics, business reporting, KPI measurement, and fraud detection. By separating customer, merchant, and transaction data into dedicated tables while enforcing appropriate constraints, the database ensures data integrity, minimizes redundancy, and enables efficient analytical querying using T-SQL.

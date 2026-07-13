/*Who are our most valuable customers?
What are we doing?
Find users who:
Spend the most
Make the most transactions
Generate the highest fraud amount
Output
User ID
Total Transactions
Total Amount
Average Amount
Fraud Count
Fraud Amount*/

select user_id,
count(*) total_transactions,
sum(amount) total_amount,
AVG(amount) AS Average_Amount,
sum(case when is_fraud=1 then 1 else 0 end) fraud_count,
sum(case when is_fraud=1 then amount else 0 end) fraud_amount
from staging.transactions 
group by user_id
ORDER BY
Total_Amount DESC,
Total_Transactions DESC,
Fraud_Amount DESC;

/*Which users are inactive?
What are we doing?
Identify users with very few transactions.
Example:
Total Transactions
Last Transaction Date
Days Since Last Transaction

This is useful for customer retention.*/
SELECT
    user_id,
    COUNT(*) AS Total_Transactions,
    MAX(date) AS Last_Transaction_Date,
    DATEDIFF(
        DAY,
        MAX(date),
        (SELECT MAX(date) FROM staging.transactions)
    ) AS Days_Since_Last_Transaction
FROM staging.transactions
GROUP BY user_id
ORDER BY Days_Since_Last_Transaction DESC;

/*Customer Spending Segments
What are we doing?
Classify customers into spending groups.*/
WITH UserSpend AS
(
    SELECT
        user_id,
        SUM(amount) AS Total_Spend
    FROM staging.transactions
    GROUP BY user_id
)

SELECT
    user_id,
    Total_Spend,
    CASE
        WHEN Total_Spend < 5000 THEN 'Low Value'
        WHEN Total_Spend < 20000 THEN 'Medium Value'
        WHEN Total_Spend < 50000 THEN 'High Value'
        ELSE 'VIP'
    END AS Customer_Segment
FROM UserSpend
ORDER BY Total_Spend DESC;

/*What are we doing?

Check whether higher loyalty scores actually spend more money.

Output

Loyalty Score
Average Spend
Average Transactions*/
WITH UserSummary AS
(
    SELECT
        u.user_id,
        u.user_loyalty_score,
        COUNT(t.transaction_id) AS Total_Transactions,
        SUM(t.amount) AS Total_Spend
    FROM staging.users u
    JOIN staging.transactions t
        ON u.user_id = t.user_id
    GROUP BY
        u.user_id,
        u.user_loyalty_score
)

SELECT
    user_loyalty_score,
    COUNT(*) AS Total_Users,
    AVG(Total_Transactions) AS Avg_Transactions_Per_User,
    ROUND(AVG(Total_Spend),2) AS Avg_Spend_Per_User
FROM UserSummary
GROUP BY user_loyalty_score
ORDER BY user_loyalty_score DESC;

/*High Risk Users vs Normal Users
What are we doing?
Compare:
Average Spend
Fraud Rate
Average Transaction Amount
between
High Risk Users
Normal Users*/
WITH UserSummary AS
(
SELECT
u.user_id,
u.is_high_risk_user,
SUM(t.amount) Total_Spend,
AVG(t.amount) Avg_Transaction,
COUNT(*) Total_Transactions,
SUM(CASE WHEN t.is_fraud=1 THEN 1 ELSE 0 END) Fraud_Count
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY
u.user_id,
u.is_high_risk_user
)

SELECT
is_high_risk_user,
COUNT(*) Users,
ROUND(AVG(Total_Spend),2) Avg_Spend_Per_User,
ROUND(AVG(Avg_Transaction),2) Avg_Transaction_Amount,
ROUND(
AVG(Fraud_Count*100.0/Total_Transactions),
2
) Fraud_Rate
FROM UserSummary
GROUP BY is_high_risk_user;
/*Which cities generate the highest revenue?
Output
City
Total Transactions
Total Amount
Fraud Amount
Fraud Rate*/
SELECT
    u.city,
    COUNT(*) AS Total_Transactions,
    SUM(t.amount) AS Total_Revenue,
    SUM(CASE WHEN t.is_fraud=1 THEN amount ELSE 0 END) AS Fraud_Amount,
    ROUND(
        SUM(CASE WHEN t.is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY u.city
ORDER BY Total_Revenue DESC;

/*Age Group Spending

Output

Age Group
Total Spend
Avg Spend
Fraud Rate*/
SELECT
    u.age_group,
    COUNT(*) AS Total_Transactions,
    SUM(t.amount) AS Total_Spend,
    AVG(t.amount) AS Avg_Spend,
    ROUND(
        SUM(CASE WHEN t.is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY u.age_group
ORDER BY Total_Spend DESC;

/*KYC vs Spending
Output
KYC Status
Total Spend
Fraud Amount
Fraud Rate*/
SELECT
    u.kyc_status,
    COUNT(*) AS Total_Transactions,
    SUM(t.amount) AS Total_Spend,
    SUM(CASE WHEN t.is_fraud=1 THEN amount ELSE 0 END) AS Fraud_Amount,
    ROUND(
        SUM(CASE WHEN t.is_fraud=1 THEN 1.0 ELSE 0 END)
        *100/COUNT(*),
        2
    ) AS Fraud_Rate
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY u.kyc_status;

/*User Lifetime Value

Calculate for each user:

Total Spend
Total Transactions
Average Transaction
Account Age
Spend per Day*/

SELECT
    u.user_id,
    u.account_age_days,
    COUNT(*) AS Total_Transactions,
    SUM(t.amount) AS Total_Spend,
    AVG(t.amount) AS Avg_Transaction,
    ROUND(
SUM(t.amount)*1.0/
NULLIF(account_age_days,0),
2
) AS Spend_Per_Day
FROM staging.users u
JOIN staging.transactions t
ON u.user_id=t.user_id
GROUP BY
    u.user_id,
    u.account_age_days
ORDER BY Total_Spend DESC;

/*Top 20 Customers

Output

User
Total Spend
Total Transactions
Fraud Count
Rank

Use:

RANK()
DENSE_RANK()*/
WITH CustomerSpend AS
(
SELECT
user_id,
SUM(amount) Total_Spend,
COUNT(*) Total_Transactions,
SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) Fraud_Count
FROM staging.transactions
GROUP BY user_id
)

SELECT TOP(20)
*,
RANK() OVER(ORDER BY Total_Spend DESC) AS Rank_No,
DENSE_RANK() OVER(ORDER BY Total_Spend DESC) AS Dense_Rank_No
FROM CustomerSpend
ORDER BY Total_Spend DESC;

/*Customer Repeat Rate*/
SELECT
CASE
WHEN Total_Transactions = 1 THEN 'One Time Customer'
ELSE 'Repeat Customer'
END AS Customer_Type,
COUNT(*) AS Users
FROM
(
SELECT
user_id,
COUNT(*) AS Total_Transactions
FROM staging.transactions
GROUP BY user_id
)t
GROUP BY
CASE
WHEN Total_Transactions = 1 THEN 'One Time Customer'
ELSE 'Repeat Customer'
END;


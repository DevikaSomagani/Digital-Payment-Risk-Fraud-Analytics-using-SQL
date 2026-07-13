11_Business_Insights

select 
case when amount>=0 and amount<=8000  then 'LOW'
    WHEN amount>8000 and amount<=16000 then 'medium'
    when amount>16000 and amount<=24000 then 'High'
    when amount>24000 then 'Very high'
    end as amount_bucket
,count(*) total_transactions,
sum(case when is_fraud=1 then 1 else 0 end) Fraud_Transactions,
ROUND(
SUM(CASE WHEN is_fraud=1 THEN 1.0 ELSE 0 END)
*100.0/COUNT(*),
2
) AS Fraud_Rate
from staging.transactions
group by case when amount>=0 and amount<=8000  then 'LOW'
    WHEN amount>8000 and amount<=16000 then 'medium'
    when amount>16000 and amount<=24000 then 'High'
    when amount>24000 then 'Very high'
    end
order by Fraud_Rate DESC

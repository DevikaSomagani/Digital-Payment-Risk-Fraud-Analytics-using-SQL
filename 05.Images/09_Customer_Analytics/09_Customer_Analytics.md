09_Customer_Analytics

SELECT age_group,
COUNT(*)
FROM staging.users
GROUP BY age_group;


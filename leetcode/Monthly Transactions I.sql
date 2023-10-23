SOL 1:
SELECT 
CONCAT(YEAR(trans_date) , '-',CASE WHEN (MONTH(trans_date))<10 THEN  '0' ELSE '' END, MONTH(trans_date)) AS month 
, country 
, COUNT(*) AS trans_count
, SUM(state='approved') AS approved_count
, SUM(amount) AS trans_total_amount
,SUM(CASE WHEN  state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
Transactions 
GROUP BY month, country;

SOL 2:
# Write your MySQL query statement below
SELECT 
date_format(trans_date, '%Y-%m') AS month
, country 
, COUNT(*) AS trans_count
, SUM(state='approved') AS approved_count
, SUM(amount) AS trans_total_amount
,SUM(CASE WHEN  state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM
Transactions 
GROUP BY month, country;

# Write your MySQL query statement below
SELECT customer_id ,count(transaction_id) count_no_trans
from Visits 
LEFT JOIN Transactions
ON Visits.visit_id=Transactions.visit_id 
where transaction_id is null
group by(customer_id );

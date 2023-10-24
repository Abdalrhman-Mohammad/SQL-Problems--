# Write your MySQL query statement below
SELECT ROUND(AVG(MainTable.x*100),2) AS immediate_percentage
FROM
(
    SELECT customer_id,MIN(order_date)=MIN(customer_pref_delivery_date) AS x
    FROM Delivery t1
    GROUP BY customer_id
) AS MainTable;

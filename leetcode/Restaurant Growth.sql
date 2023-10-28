SELECT t1.visited_on ,SUM(t2.amount)/COUNT(DISTINCT t1.customer_id) AS amount,ROUND(SUM(t2.amount)/(7*COUNT DISTINCT t1.customer_id)),2) AS average_amount
FROM Customer AS t1 
JOIN Customer AS t2
ON DATEDIFF(t1.visited_on,t2.visited_on) BETWEEN 0 AND 6
GROUP BY t1.visited_on
HAVING COUNT(DISTINCT t2.visited_on)=7
ORDER BY t1.visited_on

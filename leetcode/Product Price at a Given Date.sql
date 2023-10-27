SELECT DISTINCT t1.product_id , if(t2.mx IS null,10,new_price) AS price
FROM Products AS t1
LEFT JOIN
(
SELECT product_id  ,MAX(CASE WHEN DATEDIFF("2019-08-16",change_date)>=0 THEN change_date ELSE NULL END) AS mx
FROM Products 
GROUP BY product_id
) AS t2
ON t1.product_id=t2.product_id 
WHERE t2.mx IS NULL OR t1.change_date=t2.mx


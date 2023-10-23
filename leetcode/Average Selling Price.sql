SOL 1:
# Write your MySQL query statement below
SELECT 
p1.product_id ,
  COALESCE(
      ROUND(
        SUM(CASE WHEN purchase_date >= start_date AND  purchase_date <= end_date THEN units * price ELSE 0 END)
        /
        SUM(CASE WHEN purchase_date >= start_date AND  purchase_date <= end_date THEN units ELSE 0 END)
    ,2)
    ,0)  AS average_price
FROM Prices AS p1 LEFT JOIN UnitsSold AS u1
USING(product_id)
# WHERE purchase_date >= start_date AND  purchase_date <= end_date;
GROUP BY p1.product_id;


SOL 2:
# Write your MySQL query statement below
SELECT DISTINCT t1.product_id , COALESCE(t2.average_price,0) AS average_price
FROM Prices AS t1 LEFT JOIN 
(SELECT p1.product_id  AS p1p, ROUND((SUM(units * price)/SUM(units)),2) AS average_price
FROM Prices AS p1 CROSS JOIN UnitsSold AS u1
USING(product_id)
WHERE purchase_date BETWEEN start_date AND end_date
GROUP BY p1.product_id
) t2
ON t1.product_id=p1p
;

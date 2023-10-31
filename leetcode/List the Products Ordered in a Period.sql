SELECT product_name ,SUM(unit) AS unit
FROM Products 
LEFT JOIN Orders
USING(product_id)
WHERE order_date LIKE "2020-02%" 
GROUP BY product_id
HAVING SUM(unit)>=100

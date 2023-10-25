# Write your MySQL query statement below
SELECT product_id , year AS first_year , quantity , price
FROM Sales AS t1
NATURAL JOIN 
(
    SELECT product_id ,MIN(year) AS year
    FROM Sales
    GROUP BY product_id
) AS t2;

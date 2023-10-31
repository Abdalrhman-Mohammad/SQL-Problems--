SELECT t1.person_name
FROM Queue AS t1 
JOIN Queue AS t2
ON t1.turn>=t2.turn
GROUP BY t1.turn
HAVING SUM(t2.weight)<=1000
ORDER BY t1.turn DESC
LIMIT 1

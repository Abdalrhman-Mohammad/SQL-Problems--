SOL 1:
SELECT DISTINCT t1.num AS ConsecutiveNums
FROM 
Logs t1 
lEFT JOIN Logs t2
ON t1.id+1=t2.id AND t1.num=t2.num

LEFT JOIN Logs AS t3
ON t2.id+1=t3.id AND t2.num=t3.num
WHERE t3.id IS NOT NULL;


SOL 2:
SELECT DISTINCT t1.num AS ConsecutiveNums
FROM 
Logs t1 
JOIN Logs t2
JOIN Logs AS t3
ON t1.id+1=t2.id AND t1.num=t2.num AND t2.id+1=t3.id AND t2.num=t3.num


# Write your MySQL query statement below
SELECT ROUND(COUNT(*)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2)AS fraction
FROM
Activity t1 LEFT JOIN 
(
SELECT t3.player_id ,MIN(t3.event_date) as event_date
FROM Activity AS t3
GROUP BY t3.player_id
) AS t2
USING(player_id)
WHERE DATEDIFF(t1.event_date,t2.event_date)=1;

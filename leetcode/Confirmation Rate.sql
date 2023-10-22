SOL 1:
# Write your MySQL query statement below
SELECT t1.user_id ,
ROUND(COALESCE(COALESCE(t4.x,0)/
    ( COALESCE(t4.x,0)+  COALESCE(t4.y,0))
    ,0),2) AS confirmation_rate
FROM Signups AS t1 LEFT JOIN
(
SELECT t2.user_id , x , y 
 FROM(
    SELECT user_id ,COUNT(*) AS x FROM Confirmations WHERE action = 'confirmed' GROUP BY user_id
) AS t2
LEFT JOIN
(
    SELECT user_id ,COUNT(*) AS y FROM Confirmations WHERE action = 'timeout' GROUP BY user_id
) AS t3 
ON 
t2.user_id=t3.user_id
) AS t4
ON t4.user_id=t1.user_id;



SOL 2:
# Write your MySQL query statement below
SELECT t5.col1 AS user_id,ROUND(COALESCE( col2/(col2+col3),0),2) AS confirmation_rate
FROM
(
SELECT t1.user_id as col1,COALESCE(t4.x,0) as col2,  COALESCE(t4.y,0) as col3
FROM Signups AS t1 LEFT JOIN
(
SELECT t2.user_id , x , y 
 FROM(
    SELECT user_id ,COUNT(*) AS x FROM Confirmations WHERE action = 'confirmed' GROUP BY user_id
) AS t2
LEFT JOIN
(
    SELECT user_id ,COUNT(*) AS y FROM Confirmations WHERE action = 'timeout' GROUP BY user_id
) AS t3 
ON 
t2.user_id=t3.user_id
) AS t4
ON t4.user_id=t1.user_id
) AS t5;



SOL 3:
# Write your MySQL query statement below
SELECT 
t1.user_id ,( CASE WHEN t2.time_stamp IS NULL THEN 0 ELSE ROUND(SUM(t2.action='confirmed')/COUNT(*),2) END) AS confirmation_rate
FROM Signups AS t1 LEFT JOIN Confirmations AS t2
ON t1.user_id=t2.user_id
GROUP BY t1.user_id;

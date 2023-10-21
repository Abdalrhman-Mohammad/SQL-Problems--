# Write your MySQL query statement below
SELECT t1.id
FROM Weather t1,Weather t2 
where DATEDIFF(t1.recordDate, t2.recordDate) = 1 and t1.temperature>t2.temperature ;

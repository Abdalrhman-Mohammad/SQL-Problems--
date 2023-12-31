SOL 1:
# Write your MySQL query statement below
SELECT t2.name AS Department , t1.name AS Employee, t1.salary AS Salary 
FROM Employee AS t1
LEFT JOIN Department AS t2
ON t1.departmentId = t2.id
WHERE 3>= 

(
    SELECT COUNT(DISTINCT salary) 
    FROM Employee AS t3
    WHERE t3.departmentId = t2.id AND t3.salary>=t1.salary 
)


SOL 2:SELECT t1.name AS Department , t4.name AS Employee, t4.salary AS Salary 
FROM  (
    SELECT t2.departmentId ,t2.salary , t2.name , COUNT(DISTINCT t3.salary) AS c 
    FROM Employee AS t2 JOIN Employee AS t3 
    WHERE t2.salary<=t3.salary AND t2.departmentId=t3.departmentId 
    GROUP BY t2.departmentId ,t2.id
) AS t4
LEFT JOIN Department AS t1
ON t1.id=t4.departmentId
WHERE t4.c<=3

# Write your MySQL query statement below
SELECT name
FROM
(
SELECT e1.id as x, COUNT(*) as sum
FROM Employee e1 CROSS JOIN Employee e2
WHERE e2.managerId=e1.id
GROUP BY e1.id
) as tmpTable
LEFT JOIN Employee
ON tmpTable.x=Employee.id
WHERE tmpTable.sum >= 5;

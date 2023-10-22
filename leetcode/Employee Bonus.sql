# Write your MySQL query statement below
SELECT name , bonus
FROM Bonus b RIGHT JOIN Employee e
ON e.empId=b.empId
WHERE bonus is NULL OR bonus < 1000;

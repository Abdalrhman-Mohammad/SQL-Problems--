# Write your MySQL query statement below
SELECT EmployeeUNI.unique_id, Employees.name FROM Employees LEFT JOIN EmployeeUNI ON EmployeeUNI.id=Employees.id;


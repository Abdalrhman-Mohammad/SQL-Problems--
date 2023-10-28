SOL 1:
SELECT employee_id
FROM Employees AS t
WHERE salary<30000 AND !(manager_id IS NULL) AND 0 = (SELECT COUNT(*) FROM Employees t1 WHERE t1.employee_id=t.manager_id)
ORDER BY employee_id

SOL 2:
SELECT t.employee_id
FROM Employees AS t
LEFT JOIN 
Employees AS t1
ON t.manager_id = t1.employee_id 
WHERE t1.employee_id IS NULL AND t.manager_id IS NOT NULL AND t.salary<30000
ORDER BY 1

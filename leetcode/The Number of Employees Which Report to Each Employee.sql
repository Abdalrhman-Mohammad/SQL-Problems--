# Write your MySQL query statement below
SELECT t1.employee_id , t1.name , t2.reports_count ,t2.average_age
FROM
(
    SELECT reports_to AS  employee_id, COUNT(employee_id) AS reports_count , ROUND(AVG(age)) AS average_age
    FROM Employees
    WHERE !(reports_to IS null)
    GROUP BY reports_to
) AS t2
LEFT JOIN Employees AS t1
USING (employee_id)
ORDER BY t1.employee_id
;

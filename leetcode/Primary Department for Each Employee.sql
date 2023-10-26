SOL 1:
SELECT  
 mployee_id , department_id
FROM Employee AS t
LEFT JOIN (SELECT employee_id,COUNT(*) AS c FROM Employee GROUP BY 1) AS t1
USING (employee_id)
WHERE t.primary_flag='Y'
OR t1.c=1
;

SOL 2:

SELECT employee_id , department_id
FROM Employee AS t
WHERE 
(SELECT COUNT(*) FROM Employee AS t1 WHERE t.employee_id=t1.employee_id) = 1
OR t.primary_flag='Y' 
GROUP BY employee_id
;

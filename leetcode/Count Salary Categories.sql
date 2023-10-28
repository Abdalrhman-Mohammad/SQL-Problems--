    SELECT "Low Salary" category ,COUNT(*) AS accounts_count FROM Accounts AS t1 WHERE income<20000

UNION 

    SELECT "Average Salary" ,COUNT(*)  FROM Accounts AS t2 WHERE income BETWEEN 20000 AND 50000

UNION 

    SELECT "High Salary" ,COUNT(*)  FROM Accounts AS t3 WHERE income  > 50000


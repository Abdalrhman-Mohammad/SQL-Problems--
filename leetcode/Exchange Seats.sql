SELECT  if(t1.id>t2.mx,t2.mx,t1.id) AS id , t1.student 
FROM 
(
    SELECT 
    if(id%2=0,id-1,id+1) AS id ,student
    FROM Seat
) AS t1
JOIN
(
    SELECT MAX(id) AS mx FROM Seat
) AS t2
ORDER BY t1.id

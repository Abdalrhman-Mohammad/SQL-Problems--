SOL 1:
SELECT
 DISTINCT t1.query_name , 
ROUND(
  (
    SELECT SUM(rating/position) FROM Queries as x where  t1.query_name=x.query_name 
  )
  /t2.x
,2)
 AS quality 
 ,
ROUND(
  (
    SELECT COUNT(rating) FROM Queries as x where  t1.query_name=x.query_name AND x.rating <3 
  )
  /t2.x * 100
,2)

  AS poor_query_percentage 
FROM Queries AS t1 
LEFT JOIN 
(SELECT query_name, COUNT(*) AS x
FROM Queries
GROUP BY query_name
) AS t2
USING (query_name)


SOL 2:
SELECT
  t1.query_name , 
ROUND(
  (
    SELECT SUM(rating/position) FROM Queries as x where  t1.query_name=x.query_name 
  )
  /t2.x
,2)
 AS quality 
 ,
ROUND(
  (
    SELECT COUNT(rating) FROM Queries as x where  t1.query_name=x.query_name AND x.rating <3 
  )
  /t2.x * 100
,2)

  AS poor_query_percentage 
FROM (SELECT DISTINCT query_name FROM Queries) AS t1 
LEFT JOIN 
(SELECT query_name, COUNT(*) AS x
FROM Queries
GROUP BY query_name
) AS t2
USING (query_name)
;



SOL 3:

SELECT 
query_name , 
ROUND(AVG((rating/position)),2) AS quality ,
ROUND(AVG(rating <3)* 100,2)  AS poor_query_percentage 
FROM  Queries 
GROUP BY query_name
;

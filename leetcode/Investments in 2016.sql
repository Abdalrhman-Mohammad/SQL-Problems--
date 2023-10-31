SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM 
Insurance AS t1
LEFT JOIN (SELECT lat,lon,COUNT(*) AS c FROM Insurance GROUP BY lat,lon) AS t2
USING(lat,lon)
LEFT JOIN (SELECT tiv_2015,COUNT(*) AS c FROM Insurance GROUP BY tiv_2015) AS t4
USING (tiv_2015)
WHERE t2.c=1 AND t4.c>1

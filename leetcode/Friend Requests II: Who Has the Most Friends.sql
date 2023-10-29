SELECT id,SUM(c) AS num
FROM
(
    SELECT requester_id AS id, COUNT(*) AS c FROM RequestAccepted GROUP BY requester_id
    UNION ALL
    SELECT accepter_id AS id, COUNT(*) AS c FROM RequestAccepted GROUP BY accepter_id
) AS t
GROUP BY id
ORDER BY num DESC
LIMIT 1

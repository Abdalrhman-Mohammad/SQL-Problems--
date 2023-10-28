# Write your MySQL query statement below
(
    SELECT t1.name AS results
    FROM Users AS t1 
    LEFT JOIN
    (
        SELECT user_id , COUNT(*) AS c
        FROM MovieRating
        GROUP BY user_id
    ) AS t2
    USING (user_id)
    WHERE t2.user_id IS NOT NULL
    ORDER BY t2.c DESC , t1.name ASC
    LIMIT 1
)

UNION ALL

(
    SELECT t3.title AS result
    FROM Movies AS t3 
    LEFT JOIN
    (
        SELECT movie_id , AVG(rating) AS Average
        FROM MovieRating
        WHERE created_at BETWEEN "2020-02-01" AND "2020-02-29"
        GROUP BY movie_id
    ) AS t4
    USING (movie_id)
    WHERE t4.movie_id IS NOT NULL
    ORDER BY t4.Average DESC , t3.title ASC
    LIMIT 1
)

/***********************************
Which movies are the most popular?

Need:
- dim_movies
- fct_ratings

Concepts:
- JOIN
- AVG
- COUNT
- GROUP BY

Popularity Formula:
Popularity Score = Average Rating × SQRT(Total Ratings)

************************************/

WITH movies AS (

    SELECT 
        movie_id,
        movie_title
    FROM {{ ref('dim_movies') }}

),

movie_ratings AS (

    SELECT
        movie_id,
        rating
    FROM {{ ref('fct_ratings') }}

)

SELECT

    m.movie_id,
    m.movie_title,
    ROUND(AVG(r.rating),2) AS average_rating,
    COUNT(r.rating) AS total_ratings,
    ROUND(
    AVG(r.rating) * SQRT(COUNT(r.rating)),
    2) AS popularity_score
FROM movies m

LEFT JOIN movie_ratings r
ON m.movie_id=r.movie_id

GROUP BY
     m.movie_id,
     m.movie_title
ORDER BY popularity_score DESC


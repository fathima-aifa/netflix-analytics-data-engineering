/***********************************

Which genres perform the best based on
user ratings and engagement?

Need:
-----
- dim_movies
    - movie_id
    - movie_title
    - genre_array

- fct_ratings
    - movie_id
    - rating

Metrics:
--------
- Average Rating
- Total Ratings
- Unique Movies

Purpose:
--------
This mart evaluates the overall performance
of each movie genre by combining movie ratings
and genre information into a business-friendly
dataset for reporting and dashboards.
************************************/

WITH movies AS (

    SELECT
        movie_id,
        movie_title,
        genre_array
    FROM {{ ref('dim_movies') }}

),

ratings AS (

    SELECT
        movie_id,
        rating
    FROM {{ ref('fct_ratings') }}

),

genre_ratings AS (

    SELECT
        m.movie_id,
        m.movie_title,
        f.value::STRING AS genre,
        r.rating
    FROM movies m

    LEFT JOIN ratings r
        ON m.movie_id = r.movie_id

    ,
    LATERAL FLATTEN(input => m.genre_array) f

)

SELECT

    genre,

    ROUND(AVG(rating), 2) AS average_rating,

    COUNT(rating) AS total_ratings,

    COUNT(DISTINCT movie_id) AS unique_movies

FROM genre_ratings

GROUP BY genre

ORDER BY average_rating DESC
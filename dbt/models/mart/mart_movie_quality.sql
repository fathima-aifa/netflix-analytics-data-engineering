/***********************************
Business Question:
------------------
Which movies are highly rated, average rated,
or poorly rated based on user ratings?

Need:
-----
- dim_movies
    - movie_id
    - movie_title

- fct_ratings
    - movie_id
    - rating

Concepts:
---------
- CTE
- LEFT JOIN
- AVG()
- COUNT()
- GROUP BY
- CASE WHEN

Metrics:
--------
- Average Rating
- Total Ratings
- Quality Category

Purpose:
--------
Creates a business mart that classifies movies
into quality categories using their average
user rating.
************************************/



WITH movies AS (

    SELECT
        movie_id,
        movie_title
    FROM {{ ref('dim_movies') }}

),

ratings AS (

    SELECT
        movie_id,
        AVG(rating) AS average_rating,
        COUNT(*) AS total_ratings
    FROM {{ ref('fct_ratings') }}
    GROUP BY movie_id

)

SELECT
    m.movie_id,
    m.movie_title,
    ROUND(r.average_rating, 2) AS average_rating,
    r.total_ratings,

    CASE
        WHEN r.average_rating IS NULL
            THEN 'No Ratings'

        WHEN r.average_rating >= 4
            THEN 'Highly Rated'

        WHEN r.average_rating >= 3
            THEN 'Average'

        ELSE 'Poorly Rated'

    END AS quality_category

FROM movies m

LEFT JOIN ratings r
    ON m.movie_id = r.movie_id

ORDER BY average_rating DESC,
         total_ratings DESC
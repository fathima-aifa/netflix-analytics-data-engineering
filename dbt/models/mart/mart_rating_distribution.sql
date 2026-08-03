/***********************************
Business Question:
------------------
How are movie ratings distributed?

Need:
-----
- fct_ratings
    - rating


Metrics:
--------
- Rating
- Total Ratings

Purpose:
--------
Creates a business mart that summarizes
the distribution of user ratings across
all movies.
************************************/

WITH ratings AS (

    SELECT
        rating
    FROM {{ ref('fct_ratings') }}

)

SELECT
    rating,
    COUNT(*) AS total_ratings

FROM ratings

GROUP BY rating

ORDER BY rating ASC
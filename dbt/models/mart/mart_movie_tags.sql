
/***********************************
What tags describe each movie the most?

Need:
-----
- dim_movies
    - movie_id
    - movie_title

- fct_genome_scores
    - movie_id
    - tag_id
    - relevance_score

- dim_genome_tags
    - tag_id
    - tag_name

Metrics:
--------
- Tag Name
- Relevance Score

Purpose:
--------
Creates a business mart that identifies
the strongest descriptive tags associated
with each movie based on genome relevance
scores.
************************************/

WITH movies AS (

    SELECT
        movie_id,
        movie_title
    FROM {{ ref('dim_movies') }}

),

genome_scores AS (

    SELECT
        movie_id,
        tag_id,
        relevance_score
    FROM {{ ref('fct_genome_scores') }}

),

tags AS (

    SELECT
        tag_id,
        tag_name
    FROM {{ ref('dim_genome_tags') }}

)

SELECT
    m.movie_id,
    m.movie_title,
    t.tag_id,
    t.tag_name,
    gs.relevance_score

FROM movies AS m

LEFT JOIN genome_scores AS gs
    ON m.movie_id = gs.movie_id

LEFT JOIN tags AS t
    ON gs.tag_id = t.tag_id

WHERE gs.relevance_score >= 0.90

ORDER BY
    m.movie_title,
    gs.relevance_score DESC
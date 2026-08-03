/***********************************
Which users are the most engaged on the platform?

Need:
-----
- dim_users
    - user_id

- fct_ratings
    - user_id

- src_tags
    - user_id


Metrics:
--------
- Ratings Given
- Tags Added
- Total Activity

Purpose:
--------
Creates a business mart that measures user engagement
by combining rating activity and tagging activity into
a single engagement metric.
************************************/
WITH ratings AS (

    SELECT
        user_id,
        COUNT(*) AS ratings_given
    FROM {{ ref('fct_ratings') }}
    GROUP BY user_id

),

tags AS (

    SELECT
        user_id,
        COUNT(*) AS tags_added
    FROM {{ ref('src_tags') }}
    GROUP BY user_id

),

users AS (

    SELECT
        user_id
    FROM {{ ref('dim_users') }}

)

SELECT
    u.user_id,
    COALESCE(r.ratings_given, 0) AS ratings_given,
    COALESCE(t.tags_added, 0) AS tags_added,
    COALESCE(r.ratings_given, 0) + COALESCE(t.tags_added, 0) AS total_activity

FROM users u

LEFT JOIN ratings r
    ON u.user_id = r.user_id

LEFT JOIN tags t
    ON u.user_id = t.user_id

ORDER BY total_activity DESC
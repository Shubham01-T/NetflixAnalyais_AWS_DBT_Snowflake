{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH movies AS(
SELECT * FROM {{ref("src_movies")}}
),
tags AS (
  SELECT DISTINCT user_id FROM {{ ref('src_tags') }}
),
scores AS(
    SELECT * FROM {{ref("fct_genome_score")}}
)


SELECT
 m.movie_id,
 m.movie_title,
 m.genres,
 s.relevance_score

from movies m 
left join scores s ON m.movie_id = s.movie_id
left join tags t ON t.tag_id = s.tag_id

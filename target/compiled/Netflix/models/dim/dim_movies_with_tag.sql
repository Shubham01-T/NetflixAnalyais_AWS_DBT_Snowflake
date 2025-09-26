

WITH movies AS(
SELECT * FROM MOVIELENS.DEV.src_movies
),
tags AS (
  SELECT DISTINCT user_id FROM MOVIELENS.DEV.src_tags
),
scores AS(
    SELECT * FROM MOVIELENS.DEV.fct_genome_score
)


SELECT
 m.movie_id,
 m.movie_title,
 m.genres,
 s.relevance_score

from movies m 
left join scores s ON m.movie_id = s.movie_id
left join tags t ON t.tag_id = s.tag_id
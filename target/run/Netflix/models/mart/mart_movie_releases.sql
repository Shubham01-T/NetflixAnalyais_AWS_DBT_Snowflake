
  
    

        create or replace transient table MOVIELENS.DEV.mart_movie_releases
         as
        (

WITH fct_rating AS (
    SELECT * FROM MOVIELENS.DEV.fct_rating
),
seed_dates AS (
    SELECT * FROM MOVIELENS.DEV.seed_movie_relese_dates
)

SELECT 
    f.*,
    CASE
        WHEN d.release_date IS NULL THEN 'unknown'
        ELSE 'known'
    END AS release_info_available
FROM fct_rating f
LEFT JOIN seed_dates d
ON f.movie_id = d.movie_id
        );
      
  
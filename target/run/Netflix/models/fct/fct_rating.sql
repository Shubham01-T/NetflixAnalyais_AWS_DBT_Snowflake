-- back compat for old kwarg name
  
  begin;
    

        insert into MOVIELENS.DEV.fct_rating ("USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP")
        (
            select "USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP"
            from MOVIELENS.DEV.fct_rating__dbt_tmp
        );
    commit;
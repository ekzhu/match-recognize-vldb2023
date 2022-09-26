select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID
    one row per match
    after match skip to next row
    pattern ((A | B) (C | D))
    subset U = (A, B)
    define A as (primary_category_id = 27), B as (primary_category_id = 18), C as ((primary_category_id = 19) AND ((latitude - U.latitude) >= -0.025) and ((latitude - U.latitude) <= 0.025) AND ((longitude - U.longitude) >= -0.025) and ((longitude - U.longitude) <= 0.025) AND (timestamp_long <= (U.timestamp_long + 1800000))), D as ((primary_category_id = 19) AND ((latitude - U.latitude) >= -0.025) and ((latitude - U.latitude) <= 0.025) AND ((longitude - U.longitude) >= -0.025) and ((longitude - U.longitude) <= 0.025) AND (timestamp_long <= (U.timestamp_long + 1800000)))
);
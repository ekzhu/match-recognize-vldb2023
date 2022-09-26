select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID
    one row per match
    after match skip to next row
    pattern (A (Z)* ((B)+ | (C)+) (Z)* D)
    define A as (primary_category_id = 11), Z as (timestamp_long <= (A.timestamp_long + 1800000)), B as ((primary_category_id = 27) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 9) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), D as ((primary_category_id = 6) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
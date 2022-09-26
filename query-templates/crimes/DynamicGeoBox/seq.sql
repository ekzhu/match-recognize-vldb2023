select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_id, B.id as B_id, C.id as C_id
    one row per match
    after match skip to next row
    pattern (A (G)* B (G)* C)
    define A as (primary_category_id = 27), G as (timestamp_long <= (A.timestamp_long + 1800000)), B as ((primary_category_id = 1) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025)), C as ((primary_category_id = 24) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
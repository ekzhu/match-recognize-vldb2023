select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID
    one row per match
    after match skip to next row
    pattern (A (Z)* B (Z)* C)
    define A as ((primary_category_id = 3) AND (beat = 2232)), Z as (timestamp_long <= (A.timestamp_long + 1800000)), B as ((primary_category_id = 31) AND (beat = 2232) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 18) AND (beat = 2232) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
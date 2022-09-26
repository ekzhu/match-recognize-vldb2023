select * from crimes match_recognize(
    partition by beat
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID
    one row per match
    after match skip to next row
    pattern (A (((B)+ C))+ D)
    define A as (primary_category_id = 27), B as ((primary_category_id = 18) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 19) AND (timestamp_long <= (A.timestamp_long + 1800000))), D as ((primary_category_id = 19) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
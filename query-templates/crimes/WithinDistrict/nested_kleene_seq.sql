select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID
    one row per match
    after match skip to next row
    pattern (A (((B)+ C))+ D)
    define A as ((primary_category_id = 2) AND (district = 14)), B as ((primary_category_id = 1) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 7) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), D as ((primary_category_id = 24) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
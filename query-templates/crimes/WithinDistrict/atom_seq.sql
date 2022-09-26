select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID, E.id as E_ID, F.id as F_ID, G.id as G_ID
    one row per match
    after match skip to next row
    pattern (A B C D E F G)
    define A as ((primary_category_id = 2) AND (district = 14)), B as ((primary_category_id = 34) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 24) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), D as ((primary_category_id = 6) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), E as ((primary_category_id = 3) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), F as ((primary_category_id = 29) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000))), G as ((primary_category_id = 10) AND (district = 14) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
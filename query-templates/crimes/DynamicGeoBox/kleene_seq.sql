select * from crimes match_recognize(
    order by timestamp_long, id
    measures A.id as A_ID, B.id as B_ID, C.id as C_ID, D.id as D_ID, E.id as E_ID, F.id as F_ID
    one row per match
    after match skip to next row
    pattern (A (B)+ C (D)+ E (F)+)
    define A as (primary_category_id = 24), B as ((primary_category_id = 31) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), C as ((primary_category_id = 7) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), D as ((primary_category_id = 2) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), E as ((primary_category_id = 7) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000))), F as ((primary_category_id = 4) AND ((latitude - A.latitude) >= -0.025) and ((latitude - A.latitude) <= 0.025) AND ((longitude - A.longitude) >= -0.025) and ((longitude - A.longitude) <= 0.025) AND (timestamp_long <= (A.timestamp_long + 1800000)))
);
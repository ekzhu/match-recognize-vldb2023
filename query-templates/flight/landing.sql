select * from flight match_recognize(
    order by timestamp_long
    measures W.baroaltitude as baroaltitude_1, W.velocity as velocity
    one row per match
    after match skip to next row
    pattern (S W (Y)+ Z)
    define S as ((velocity >= 140.0) AND (geoaltitude >= 500.0)), W as ((velocity < 140.0) AND (vertrate < 0.0)), Y as ((velocity <= prev(velocity)) AND (baroaltitude <= prev(baroaltitude)) AND (timestamp_long <= (S.timestamp_long + 900000))), Z as ((velocity < 83.0) AND (geoaltitude < 500.0) AND (baroaltitude <= (W.baroaltitude * 0.5)) AND (velocity <= prev(velocity)) AND (timestamp_long <= (S.timestamp_long + 900000)))
);
create schema if not exists hive.index_accelerated;

use hive.index_accelerated;

drop table if exists crimes_raw;
drop table if exists crimes;
create table crimes_raw as select * from hive.default.Crimes_Ordered;
create table crimes as (
	select 
		a.primary_category_id, 
		id,
		case_number,
		block,
		iucr,
		b.primary_category as primary_category,
		description,
		location_desc,
		arrest,
		domestic,
		beat,
		cast(district as integer) as district, 
		cast(ward as integer) as ward,
		cast(community as integer) as community,
		fbi,
		x,
		y,
		year,
		updated,
		latitude,
		longitude,
		timestamp_long
	from 
	(
		select primary_category, cast((rank() over (order by primary_category)) as int) as primary_category_id from crimes_raw group by primary_category
	) as a, crimes_raw as b
	where a.primary_category = b.primary_category
);
drop table crimes_raw;


drop table if exists flight;
create table flight as select * from hive.default.flight;

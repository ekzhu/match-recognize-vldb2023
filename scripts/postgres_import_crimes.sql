CREATE extension IF NOT EXISTS citus;

DROP TABLE IF EXISTS crimes;
DROP TABLE IF EXISTS crimes_temp;

CREATE TABLE crimes_temp
(
	id bigint,
    case_number text,
    block text,
    iucr text,
    primary_category text,
    description text,
    location_desc text,
    arrest boolean,
    domestic boolean,
    beat int,
    district real,
    ward real,
    community real,
    fbi text,
    x double precision,
    y double precision,
    year int,
    updated text,
    latitude real,
    longitude real,
    timestamp_long bigint
);

CREATE TABLE crimes
(
    primary_category_id int,
	id bigint,
    case_number text,
    block text,
    iucr text,
    primary_category text,
    description text,
    location_desc text,
    arrest boolean,
    domestic boolean,
    beat int,
    district real,
    ward real,
    community real,
    fbi text,
    x double precision,
    y double precision,
    year int,
    updated text,
    latitude real,
    longitude real,
    timestamp_long bigint
)
using columnar;

COPY crimes_temp
FROM '/path/to/dataset/Crimes_Ordered.csv'
DELIMITER ';'
CSV HEADER;

insert into crimes
select a.primary_category_id, b.* from 
(
    select primary_category, cast((rank() over (order by primary_category)) as int) as primary_category_id from crimes_temp group by primary_category
) as a, crimes_temp as b
where a.primary_category = b.primary_category;

drop table crimes_temp;
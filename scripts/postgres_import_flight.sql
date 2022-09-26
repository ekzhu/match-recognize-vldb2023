CREATE extension IF NOT EXISTS citus;

drop table if exists flight;
create table flight (
	time_long bigint,
	icao24 text,
	lat real,
	lon real,
	velocity real,
	heading real,
	vertrate real,
	callsign text,
	onground int,
	alert int,
	spi int,
	squawk int,
	baroaltitude real,
	geoaltitude real,
	lastposupdate real,
	lastcontact real,
	timestamp_long bigint
)
using columnar;

COPY flight FROM '/path/to/dataset/flight.csv'
DELIMITER ';'
CSV HEADER;

/* 
 * Download original data from: https://github.com/sigmod2021-index-pattern/index-pattern
 */
DROP TABLE IF EXISTS flight;
CREATE EXTERNAL TABLE flight
(
	TIME_LONG bigint,
	ICAO24 string,
	LAT float,
	LON float,
	VELOCITY float,
	HEADING float,
	VERTRATE float,
	CALLSIGN string,
	ONGROUND int,
	ALERT int,
	SPI int,
	SQUAWK int,
	BAROALTITUDE float,
	GEOALTITUDE float,
	LASTPOSUPDATE double,
	LASTCONTACT double,
	TIMESTAMP_LONG bigint
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "\u003B" STORED AS TEXTFILE
LOCATION "/path/to/dataset/flight.csv"
TBLPROPERTIES("skip.header.line.count"="1");


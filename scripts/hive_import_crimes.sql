/* 
 * Download original data from: https://github.com/sigmod2021-index-pattern/index-pattern
 */
DROP TABLE IF EXISTS Crimes_Ordered;
CREATE EXTERNAL TABLE Crimes_Ordered
(
	ID bigint,
    CASE_NUMBER string,
    BLOCK string,
    IUCR string,
    PRIMARY_CATEGORY string,
    DESCRIPTION string,
    LOCATION_DESC string,
    ARREST BOOLEAN,
    DOMESTIC BOOLEAN,
    BEAT int,
    DISTRICT float,
    WARD float,
    COMMUNITY float,
    FBI string,
    X double,
    Y double,
    YEAR int,
    UPDATED string,
    LATITUDE float,
    LONGITUDE float,
    TIMESTAMP_LONG bigint
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY "\u003B" STORED AS TEXTFILE
LOCATION "/path/to/dataset/Crimes_Ordered.csv" 
TBLPROPERTIES("skip.header.line.count"="1");

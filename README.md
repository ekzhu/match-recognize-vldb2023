# Note

This repository contains the MATCH_RECOGNIZE query templates and scripts for
importing raw datasets into [Trino](https://trino.io/) (Hive + HDFS) and [PostgreSQL 14](https://www.postgresql.org/docs/14/index.html).

The raw CSV files for the datasets can be obtained from [here](https://github.com/sigmod2021-index-pattern/index-pattern).

Directories:
    - query-templates:
        - [benchmark dataset]
            - [pattern definition]
                - [pattern name].sql: MATCH_RECOGNIZE query with example parameters.
    - scripts:
        - hive_import_[dataset].sql: create tables in Hive after copying the raw CSV files into HDFS.
        - trino_import_[dataset].sql: create tables in Trino from Hive tables.
        - postgres_import_[dataset].sql: create tables in PostgreSQL from raw CSV files. [Citus](https://github.com/citusdata/citus) extension is required.

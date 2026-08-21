-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "sqldatawarehouse"
-- META   },
-- META   "dependencies": {
-- META     "warehouse": {
-- META       "default_warehouse": "b9e4f7ae-a6a9-8dcd-4856-d0aa8df7e81a",
-- META       "known_warehouses": [
-- META         {
-- META           "id": "b9e4f7ae-a6a9-8dcd-4856-d0aa8df7e81a",
-- META           "type": "Datawarehouse"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

DROP TABLE IF EXISTS dbo.customer;
DROP TABLE IF EXISTS dbo.lineitem;
DROP TABLE IF EXISTS dbo.lineitem_clustered;
DROP TABLE IF EXISTS dbo.lineitem_clustered_bad;
DROP TABLE IF EXISTS dbo.lineitem_data_factory;
DROP TABLE IF EXISTS dbo.lineitem_insert_into;
DROP TABLE IF EXISTS dbo.lineitem_openrowset;
DROP TABLE IF EXISTS dbo.nation;
DROP TABLE IF EXISTS dbo.orders;
DROP TABLE IF EXISTS dbo.part;
DROP TABLE IF EXISTS dbo.partsupp;
DROP TABLE IF EXISTS dbo.region;
DROP TABLE IF EXISTS dbo.supplier;


CREATE TABLE dbo.customer
    (
        c_custkey           BIGINT          NOT NULL,
        c_name              VARCHAR(25)     NOT NULL,
        c_address           VARCHAR(40)     NOT NULL,
        c_nationkey         INT             NOT NULL,
        c_phone             CHAR(15)        NOT NULL,
        c_acctbal           DECIMAL(12, 2)  NOT NULL,
        c_mktsegment        CHAR(10)        NOT NULL,
        c_comment           VARCHAR(117)    NOT NULL
    );


CREATE TABLE dbo.lineitem
    (
        l_orderkey          BIGINT          NOT NULL,
        l_partkey           BIGINT          NOT NULL,
        l_suppkey           BIGINT          NOT NULL,
        l_linenumber        INT             NOT NULL,
        l_quantity          DECIMAL(12, 2)  NOT NULL,
        l_extendedprice     DECIMAL(12, 2)  NOT NULL,
        l_discount          DECIMAL(12, 2)  NOT NULL,
        l_tax               DECIMAL(12, 2)  NOT NULL,
        l_returnflag        CHAR(1)         NOT NULL,
        l_linestatus        CHAR(1)         NOT NULL,
        l_shipdate          DATE            NOT NULL,
        l_commitdate        DATE            NOT NULL,
        l_receiptdate       DATE            NOT NULL,
        l_shipinstruct      CHAR(25)        NOT NULL,
        l_shipmode          CHAR(10)        NOT NULL,
        l_comment           VARCHAR(44)     NOT NULL
    )
WITH (CLUSTER BY (l_shipdate));

CREATE TABLE dbo.lineitem_data_factory
    (
        l_orderkey          BIGINT          NOT NULL,
        l_partkey           BIGINT          NOT NULL,
        l_suppkey           BIGINT          NOT NULL,
        l_linenumber        INT             NOT NULL,
        l_quantity          DECIMAL(12, 2)  NOT NULL,
        l_extendedprice     DECIMAL(12, 2)  NOT NULL,
        l_discount          DECIMAL(12, 2)  NOT NULL,
        l_tax               DECIMAL(12, 2)  NOT NULL,
        l_returnflag        CHAR(1)         NOT NULL,
        l_linestatus        CHAR(1)         NOT NULL,
        l_shipdate          DATE            NOT NULL,
        l_commitdate        DATE            NOT NULL,
        l_receiptdate       DATE            NOT NULL,
        l_shipinstruct      CHAR(25)        NOT NULL,
        l_shipmode          CHAR(10)        NOT NULL,
        l_comment           VARCHAR(44)     NOT NULL
    );


CREATE TABLE dbo.nation
    (
        n_nationkey         INT             NOT NULL,
        n_name              CHAR(25)        NOT NULL,
        n_regionkey         INT             NOT NULL,
        n_comment           VARCHAR(152)    NOT NULL
    );


CREATE TABLE dbo.orders
    (
        o_orderkey          BIGINT          NOT NULL,
        o_custkey           BIGINT          NOT NULL,
        o_orderstatus       CHAR(1)         NOT NULL,
        o_totalprice        DECIMAL(12, 2)  NOT NULL,
        o_orderdate         DATE            NOT NULL,
        o_orderpriority     CHAR(15)        NOT NULL,
        o_clerk             CHAR(15)        NOT NULL,
        o_shippriority      INT             NOT NULL,
        o_comment           VARCHAR(79)     NOT NULL
    );


CREATE TABLE dbo.part
    (
        p_partkey           BIGINT          NOT NULL,
        p_name              VARCHAR(55)     NOT NULL,
        p_mfgr              CHAR(25)        NOT NULL,
        p_brand             CHAR(10)        NOT NULL,
        p_type              VARCHAR(25)     NOT NULL,
        p_size              INT             NOT NULL,
        p_container         CHAR(10)        NOT NULL,
        p_retailprice       DECIMAL(12, 2)  NOT NULL,
        p_comment           VARCHAR(23)     NOT NULL
    );


CREATE TABLE dbo.partsupp
    (
        ps_partkey          BIGINT          NOT NULL,
        ps_suppkey          BIGINT          NOT NULL,
        ps_availqty         INT             NOT NULL,
        ps_supplycost       DECIMAL(12, 2)  NOT NULL,
        ps_comment          VARCHAR(199)    NOT NULL
    );


CREATE TABLE dbo.region
    (
        r_regionkey         INT             NOT NULL,
        r_name              VARCHAR(25)     NOT NULL,
        r_comment           VARCHAR(152)    NOT NULL
    );


CREATE TABLE dbo.supplier
    (
        s_suppkey           BIGINT          NOT NULL,
        s_name              CHAR(25)        NOT NULL,
        s_address           VARCHAR(40)     NOT NULL,
        s_nationkey         INT             NOT NULL,
        s_phone             CHAR(15)        NOT NULL,
        s_acctbal           DECIMAL(12, 2)  NOT NULL,
        s_comment           VARCHAR(101)    NOT NULL
    );


COPY INTO dbo.lineitem                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/lineitem/*.parquet'   WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - lineitem_clustered - COPY INTO');
COPY INTO dbo.customer                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1//customer/*.parquet'   WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - customer - COPY INTO');
COPY INTO dbo.nation                    FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/nation/*.parquet'     WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - nation - COPY INTO');
COPY INTO dbo.orders                    FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/orders/*.parquet'     WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - orders - COPY INTO');
COPY INTO dbo.part                      FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/part/*.parquet'       WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - part - COPY INTO');
COPY INTO dbo.partsupp                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/partsupp/*.parquet'   WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - partsupp - COPY INTO');
COPY INTO dbo.region                    FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/region/*.parquet'     WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - region - COPY INTO');
COPY INTO dbo.supplier                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/supplier/*.parquet'   WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - supplier - COPY INTO');



-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

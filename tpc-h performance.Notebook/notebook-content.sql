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
COPY INTO dbo.customer                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpch_sf1/customer/*.parquet'   WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - customer - COPY INTO');
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

-- CELL ********************

-- Q1: Pricing Summary Report
select
	l_returnflag,
	l_linestatus,
	sum(l_quantity) as sum_qty,
	sum(l_extendedprice) as sum_base_price,
	sum(l_extendedprice * (1 - l_discount)) as sum_disc_price,
	sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) as sum_charge,
	avg(l_quantity) as avg_qty,
	avg(l_extendedprice) as avg_price,
	avg(l_discount) as avg_disc,
	count(*) as count_order
from
	lineitem
where
	l_shipdate <= dateadd(day, -90, '1998-12-01')
group by
	l_returnflag,
	l_linestatus
order by
	l_returnflag,
	l_linestatus
option (label = 'TPC-H Q1');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q2: Minimum Cost Supplier Query
select top 100
	s_acctbal,
	s_name,
	n_name,
	p_partkey,
	p_mfgr,
	s_address,
	s_phone,
	s_comment
from
	part,
	supplier,
	partsupp,
	nation,
	region
where
	p_partkey = ps_partkey
	and s_suppkey = ps_suppkey
	and p_size = 15
	and p_type like '%BRASS'
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'EUROPE'
	and ps_supplycost = (
		select
			min(ps_supplycost)
		from
			partsupp,
			supplier,
			nation,
			region
		where
			p_partkey = ps_partkey
			and s_suppkey = ps_suppkey
			and s_nationkey = n_nationkey
			and n_regionkey = r_regionkey
			and r_name = 'EUROPE'
	)
order by
	s_acctbal desc,
	n_name,
	s_name,
	p_partkey
option (label = 'TPC-H Q2');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q3: Shipping Priority Query
select top 10
	l_orderkey,
	sum(l_extendedprice * (1 - l_discount)) as revenue,
	o_orderdate,
	o_shippriority
from
	customer,
	orders,
	lineitem
where
	c_mktsegment = 'BUILDING'
	and c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and o_orderdate < '1995-03-15'
	and l_shipdate > '1995-03-15'
group by
	l_orderkey,
	o_orderdate,
	o_shippriority
order by
	revenue desc,
	o_orderdate
option (label = 'TPC-H Q3');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q4: Order Priority Checking Query
select
	o_orderpriority,
	count(*) as order_count
from
	orders
where
	o_orderdate >= '1993-07-01'
	and o_orderdate < dateadd(month, 3, '1993-07-01')
	and exists (
		select
			*
		from
			lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority
option (label = 'TPC-H Q4');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q5: Local Supplier Volume Query
select
	n_name,
	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	customer,
	orders,
	lineitem,
	supplier,
	nation,
	region
where
	c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and l_suppkey = s_suppkey
	and c_nationkey = s_nationkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'ASIA'
	and o_orderdate >= '1994-01-01'
	and o_orderdate < dateadd(year, 1, '1994-01-01')
group by
	n_name
order by
	revenue desc
option (label = 'TPC-H Q5');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q6: Forecasting Revenue Change Query
select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= '1994-01-01'
	and l_shipdate < dateadd(year, 1, '1994-01-01')
	and l_discount between 0.06 - 0.01 and 0.06 + 0.01
	and l_quantity < 24
option (label = 'TPC-H Q6');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q7: Volume Shipping Query
select
	supp_nation,
	cust_nation,
	l_year,
	sum(volume) as revenue
from
	(
		select
			n1.n_name as supp_nation,
			n2.n_name as cust_nation,
			year(l_shipdate) as l_year,
			l_extendedprice * (1 - l_discount) as volume
		from
			supplier,
			lineitem,
			orders,
			customer,
			nation n1,
			nation n2
		where
			s_suppkey = l_suppkey
			and o_orderkey = l_orderkey
			and c_custkey = o_custkey
			and s_nationkey = n1.n_nationkey
			and c_nationkey = n2.n_nationkey
			and (
				(n1.n_name = 'FRANCE' and n2.n_name = 'GERMANY')
				or (n1.n_name = 'GERMANY' and n2.n_name = 'FRANCE')
			)
			and l_shipdate between '1995-01-01' and '1996-12-31'
	) as shipping
group by
	supp_nation,
	cust_nation,
	l_year
order by
	supp_nation,
	cust_nation,
	l_year
option (label = 'TPC-H Q7');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q8: National Market Share Query
select
	o_year,
	sum(case when nation = 'BRAZIL' then volume else 0 end) / sum(volume) as mkt_share
from
	(
		select
			year(o_orderdate) as o_year,
			l_extendedprice * (1 - l_discount) as volume,
			n2.n_name as nation
		from
			part,
			supplier,
			lineitem,
			orders,
			customer,
			nation n1,
			nation n2,
			region
		where
			p_partkey = l_partkey
			and s_suppkey = l_suppkey
			and l_orderkey = o_orderkey
			and o_custkey = c_custkey
			and c_nationkey = n1.n_nationkey
			and n1.n_regionkey = r_regionkey
			and r_name = 'AMERICA'
			and s_nationkey = n2.n_nationkey
			and o_orderdate between '1995-01-01' and '1996-12-31'
			and p_type = 'ECONOMY ANODIZED STEEL'
	) as all_nations
group by
	o_year
order by
	o_year
option (label = 'TPC-H Q8');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q9: Product Type Profit Measure Query
select
	nation,
	o_year,
	sum(amount) as sum_profit
from
	(
		select
			n_name as nation,
			year(o_orderdate) as o_year,
			l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
		from
			part,
			supplier,
			lineitem,
			partsupp,
			orders,
			nation
		where
			s_suppkey = l_suppkey
			and ps_suppkey = l_suppkey
			and ps_partkey = l_partkey
			and p_partkey = l_partkey
			and o_orderkey = l_orderkey
			and s_nationkey = n_nationkey
			and p_name like '%green%'
	) as profit
group by
	nation,
	o_year
order by
	nation,
	o_year desc
option (label = 'TPC-H Q9');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q10: Returned Item Reporting Query
select top 20
	c_custkey,
	c_name,
	sum(l_extendedprice * (1 - l_discount)) as revenue,
	c_acctbal,
	n_name,
	c_address,
	c_phone,
	c_comment
from
	customer,
	orders,
	lineitem,
	nation
where
	c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and o_orderdate >= '1993-10-01'
	and o_orderdate < dateadd(month, 3, '1993-10-01')
	and l_returnflag = 'R'
	and c_nationkey = n_nationkey
group by
	c_custkey,
	c_name,
	c_acctbal,
	c_phone,
	n_name,
	c_address,
	c_comment
order by
	revenue desc
option (label = 'TPC-H Q10');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q11: Important Stock Identification Query
select
	ps_partkey,
	sum(ps_supplycost * ps_availqty) as value
from
	partsupp,
	supplier,
	nation
where
	ps_suppkey = s_suppkey
	and s_nationkey = n_nationkey
	and n_name = 'GERMANY'
group by
	ps_partkey having
		sum(ps_supplycost * ps_availqty) > (
			select
				sum(ps_supplycost * ps_availqty) * 0.0001000000
			from
				partsupp,
				supplier,
				nation
			where
				ps_suppkey = s_suppkey
				and s_nationkey = n_nationkey
				and n_name = 'GERMANY'
		)
order by
	value desc
option (label = 'TPC-H Q11');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q12: Shipping Modes and Order Priority Query
select
	l_shipmode,
	sum(case
		when o_orderpriority = '1-URGENT' or o_orderpriority = '2-HIGH'
			then 1
		else 0
	end) as high_line_count,
	sum(case
		when o_orderpriority <> '1-URGENT' and o_orderpriority <> '2-HIGH'
			then 1
		else 0
	end) as low_line_count
from
	orders,
	lineitem
where
	o_orderkey = l_orderkey
	and l_shipmode in ('MAIL', 'SHIP')
	and l_commitdate < l_receiptdate
	and l_shipdate < l_commitdate
	and l_receiptdate >= '1994-01-01'
	and l_receiptdate < dateadd(year, 1, '1994-01-01')
group by
	l_shipmode
order by
	l_shipmode
option (label = 'TPC-H Q12');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q13: Customer Distribution Query
select
	c_count,
	count(*) as custdist
from
	(
		select
			c_custkey,
			count(o_orderkey) as c_count
		from
			customer left outer join orders on
				c_custkey = o_custkey
				and o_comment not like '%special%requests%'
		group by
			c_custkey
	) as c_orders
group by
	c_count
order by
	custdist desc,
	c_count desc
option (label = 'TPC-H Q13');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q14: Promotion Effect Query
select
	100.00 * sum(case
		when p_type like 'PROMO%'
			then l_extendedprice * (1 - l_discount)
		else 0
	end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
	lineitem,
	part
where
	l_partkey = p_partkey
	and l_shipdate >= '1995-09-01'
	and l_shipdate < dateadd(month, 1, '1995-09-01')
option (label = 'TPC-H Q14');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q15: Top Supplier Query
with revenue0 as (
	select
		l_suppkey as supplier_no,
		sum(l_extendedprice * (1 - l_discount)) as total_revenue
	from
		lineitem
	where
		l_shipdate >= '1996-01-01'
		and l_shipdate < dateadd(month, 3, '1996-01-01')
	group by
		l_suppkey
)
select
	s_suppkey,
	s_name,
	s_address,
	s_phone,
	total_revenue
from
	supplier,
	revenue0
where
	s_suppkey = supplier_no
	and total_revenue = (
		select
			max(total_revenue)
		from
			revenue0
	)
order by
	s_suppkey
option (label = 'TPC-H Q15');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q16: Parts/Supplier Relationship Query
select
	p_brand,
	p_type,
	p_size,
	count(distinct ps_suppkey) as supplier_cnt
from
	partsupp,
	part
where
	p_partkey = ps_partkey
	and p_brand <> 'Brand#45'
	and p_type not like 'MEDIUM POLISHED%'
	and p_size in (49, 14, 23, 45, 19, 3, 36, 9)
	and ps_suppkey not in (
		select
			s_suppkey
		from
			supplier
		where
			s_comment like '%Customer%Complaints%'
	)
group by
	p_brand,
	p_type,
	p_size
order by
	supplier_cnt desc,
	p_brand,
	p_type,
	p_size
option (label = 'TPC-H Q16');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q17: Small-Quantity-Order Revenue Query
select
	sum(l_extendedprice) / 7.0 as avg_yearly
from
	lineitem,
	part
where
	p_partkey = l_partkey
	and p_brand = 'Brand#23'
	and p_container = 'MED BOX'
	and l_quantity < (
		select
			0.2 * avg(l_quantity)
		from
			lineitem
		where
			l_partkey = p_partkey
	)
option (label = 'TPC-H Q17');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q18: Large Volume Customer Query
select top 100
	c_name,
	c_custkey,
	o_orderkey,
	o_orderdate,
	o_totalprice,
	sum(l_quantity) as sum_qty
from
	customer,
	orders,
	lineitem
where
	o_orderkey in (
		select
			l_orderkey
		from
			lineitem
		group by
			l_orderkey having
				sum(l_quantity) > 300
	)
	and c_custkey = o_custkey
	and o_orderkey = l_orderkey
group by
	c_name,
	c_custkey,
	o_orderkey,
	o_orderdate,
	o_totalprice
order by
	o_totalprice desc,
	o_orderdate
option (label = 'TPC-H Q18');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q19: Discounted Revenue Query
select
	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	lineitem,
	part
where
	(
		p_partkey = l_partkey
		and p_brand = 'Brand#12'
		and p_container in ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
		and l_quantity >= 1 and l_quantity <= 1 + 10
		and p_size between 1 and 5
		and l_shipmode in ('AIR', 'AIR REG')
		and l_shipinstruct = 'DELIVER IN PERSON'
	)
	or
	(
		p_partkey = l_partkey
		and p_brand = 'Brand#23'
		and p_container in ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
		and l_quantity >= 10 and l_quantity <= 10 + 10
		and p_size between 1 and 10
		and l_shipmode in ('AIR', 'AIR REG')
		and l_shipinstruct = 'DELIVER IN PERSON'
	)
	or
	(
		p_partkey = l_partkey
		and p_brand = 'Brand#34'
		and p_container in ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
		and l_quantity >= 20 and l_quantity <= 20 + 10
		and p_size between 1 and 15
		and l_shipmode in ('AIR', 'AIR REG')
		and l_shipinstruct = 'DELIVER IN PERSON'
	)
option (label = 'TPC-H Q19');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q20: Potential Part Promotion Query
select top 100
	s_name,
	s_address
from
	supplier,
	nation
where
	s_suppkey in (
		select
			ps_suppkey
		from
			partsupp
		where
			ps_partkey in (
				select
					p_partkey
				from
					part
				where
					p_name like 'forest%'
			)
			and ps_availqty > (
				select
					0.5 * sum(l_quantity)
				from
					lineitem
				where
					l_partkey = ps_partkey
					and l_suppkey = ps_suppkey
					and l_shipdate >= '1994-01-01'
					and l_shipdate < dateadd(year, 1, '1994-01-01')
			)
	)
	and s_nationkey = n_nationkey
	and n_name = 'CANADA'
order by
	s_name
option (label = 'TPC-H Q20');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q21: Suppliers Who Kept Orders Waiting Query
select top 100
	s_name,
	count(*) as numwait
from
	supplier,
	lineitem l1,
	orders,
	nation
where
	s_suppkey = l1.l_suppkey
	and o_orderkey = l1.l_orderkey
	and o_orderstatus = 'F'
	and l1.l_receiptdate > l1.l_commitdate
	and exists (
		select
			*
		from
			lineitem l2
		where
			l2.l_orderkey = l1.l_orderkey
			and l2.l_suppkey <> l1.l_suppkey
	)
	and not exists (
		select
			*
		from
			lineitem l3
		where
			l3.l_orderkey = l1.l_orderkey
			and l3.l_suppkey <> l1.l_suppkey
			and l3.l_receiptdate > l3.l_commitdate
	)
	and s_nationkey = n_nationkey
	and n_name = 'SAUDI ARABIA'
group by
	s_name
order by
	numwait desc,
	s_name
option (label = 'TPC-H Q21');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- Q22: Global Sales Opportunity Query
select
	cntrycode,
	count(*) as numcust,
	sum(c_acctbal) as totacctbal
from
	(
		select
			substring(c_phone, 1, 2) as cntrycode,
			c_acctbal
		from
			customer
		where
			substring(c_phone, 1, 2) in ('13', '31', '23', '29', '30', '18', '17')
			and c_acctbal > (
				select
					avg(c_acctbal)
				from
					customer
				where
					c_acctbal > 0.00
					and substring(c_phone, 1, 2) in ('13', '31', '23', '29', '30', '18', '17')
			)
			and not exists (
				select
					*
				from
					orders
				where
					o_custkey = c_custkey
			)
	) as custsale
group by
	cntrycode
order by
	cntrycode
option (label = 'TPC-H Q22');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- _Run all 22 TPC-H query cells above (Q1-Q22) to complete a TPC-H power run, then run the cell below to review the runtime and cost of every query in this run via query insights._

-- CELL ********************

-- TPC-H power run results: one row per query, filtered to just the TPC-H query labels
SELECT
	UPPER(distributed_statement_id) AS distributed_statement_id,
	label,
	submit_time,
	start_time,
	end_time,
	DATEDIFF(SECOND, start_time, end_time) AS runtime_in_seconds,
	row_count,
	allocated_cpu_time_ms,
	data_scanned_remote_storage_mb + data_scanned_memory_mb + data_scanned_disk_mb AS total_data_scanned_mb
FROM queryinsights.exec_requests_history
WHERE
	status = 'Succeeded'
	AND label IN (
		'TPC-H Q1', 'TPC-H Q2', 'TPC-H Q3', 'TPC-H Q4', 'TPC-H Q5', 'TPC-H Q6', 'TPC-H Q7',
		'TPC-H Q8', 'TPC-H Q9', 'TPC-H Q10', 'TPC-H Q11', 'TPC-H Q12', 'TPC-H Q13', 'TPC-H Q14',
		'TPC-H Q15', 'TPC-H Q16', 'TPC-H Q17', 'TPC-H Q18', 'TPC-H Q19', 'TPC-H Q20', 'TPC-H Q21', 'TPC-H Q22'
	)
ORDER BY label

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

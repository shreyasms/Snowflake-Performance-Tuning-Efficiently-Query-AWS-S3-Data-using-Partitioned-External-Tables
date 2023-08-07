
--------- External Tables WithOut Partitions ---------

create or replace external table ORDERS_WITHOUT_PARTITION
(
 O_ORDERKEY NUMBER(38,0) as (Value:c1::int),
 O_CUSTKEY NUMBER(38,0) as (Value:c2::int),
 O_ORDERSTATUS VARCHAR(1) as (Value:c3::varchar),
 O_TOTALPRICE NUMBER(12,2) as (Value:c4::int),
 O_ORDERDATE DATE as (Value:c5::DATE),
 O_ORDERPRIORITY VARCHAR(15) as (Value:c6::varchar),
 O_CLERK VARCHAR(15) as (Value:c7::varchar),
 O_SHIPPRIORITY NUMBER(38,0) as (Value:c8::int),
 O_COMMENT VARCHAR(79) as (Value:c9::varchar)
)
with 
location = @AWS_S3_Stage/TableName=ORDERS file_format ='AWS_S3_CSV_Format';



create or replace external table CUSTOMER_WITHOUT_PARTITION
(
 C_CUSTKEY NUMBER(38,0) as (Value:c1::int),
 C_NAME VARCHAR(25) as (Value:c2::varchar),
 C_ADDRESS VARCHAR(40) as (Value:c3::varchar),
 C_NATIONKEY NUMBER(38,0) as (Value:c4::int),
 C_PHONE VARCHAR(15) as (Value:c5::varchar),
 C_ACCTBAL NUMBER(12,2) as (Value:c6::int),
 C_MKTSEGMENT VARCHAR(10) as (Value:c7::varchar),
 C_COMMENT VARCHAR(117) as (Value:c8::varchar)
)
with 
location = @AWS_S3_Stage/TableName=CUSTOMER file_format ='AWS_S3_CSV_Format';
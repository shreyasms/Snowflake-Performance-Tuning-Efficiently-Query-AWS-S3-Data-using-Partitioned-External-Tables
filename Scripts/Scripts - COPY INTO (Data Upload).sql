
---------  To upload the ORDERS table related data -----------

copy into @AWS_S3_Stage/TableName=ORDERS
from 
(select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS)
partition by(split_part(O_ORDERDATE,'-',1))
FILE_FORMAT=AWS_S3_CSV_Format
HEADER=TRUE
DETAILED_OUTPUT=TRUE;
;

---------  To upload the CUSTOMER table related data -----------

copy into @AWS_S3_Stage/TableName=CUSTOMER
from 
(select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.CUSTOMER)
partition by(C_MKTSEGMENT)
FILE_FORMAT=AWS_S3_CSV_Format
HEADER=TRUE
DETAILED_OUTPUT=TRUE;
;
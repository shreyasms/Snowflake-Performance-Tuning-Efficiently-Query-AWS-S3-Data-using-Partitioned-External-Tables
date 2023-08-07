
--------- SQL Query WithOut Partition External Tables -----------

select
       O_ORDERSTATUS,
       O_ORDERDATE,
       O_ORDERPRIORITY,
       C_NAME,
       C_ADDRESS,
       C_PHONE,
       C_MKTSEGMENT,
       O_TOTALPRICE
 from
       ORDERS_WITHOUT_PARTITION orders inner join CUSTOMER_WITHOUT_PARTITION CUSTOMER on ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
 where
       cast(split_part(o_orderdate,'-',1) as int)  in (1992,1996,1998)
       and C_MKTSEGMENT in ('MACHINERY','AUTOMOBILE')
 order by
       O_ORDERDATE;


--------- SQL Query With Partition External Tables -----------

select
       O_ORDERSTATUS,
       O_ORDERDATE,
       O_ORDERPRIORITY,
       C_NAME,
       C_ADDRESS,
       C_PHONE,
       C_MKTSEGMENT,
       O_TOTALPRICE
 from
       ORDERS_WITH_PARTITION orders inner join CUSTOMER_WITH_PARTITION CUSTOMER on ORDERS.O_CUSTKEY = CUSTOMER.C_CUSTKEY
 where
       orders.File_Partition in (1992,1996,1998)
       and CUSTOMER.File_Partition in ('MACHINERY','AUTOMOBILE')
 order by
       O_ORDERDATE;
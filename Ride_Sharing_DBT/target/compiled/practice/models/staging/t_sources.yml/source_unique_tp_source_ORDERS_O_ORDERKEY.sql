
    
    

select
    O_ORDERKEY as unique_field,
    count(*) as n_records

from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
where O_ORDERKEY is not null
group by O_ORDERKEY
having count(*) > 1



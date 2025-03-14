
    
    

select
    L_ORDERKEY as unique_field,
    count(*) as n_records

from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM
where L_ORDERKEY is not null
group by L_ORDERKEY
having count(*) > 1



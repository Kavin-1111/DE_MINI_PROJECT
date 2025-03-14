
  
    

        create or replace transient table snowflake_prac.public.samp
         as
        (

select 
o_comment as comments,
o_orderkey as orderkey,
o_orderdate as orderdate,
o_totalprice as total_price,
  
    (total_price / 100)::numeric(16, 2)
 as amount_usd
from 
snowflake_prac.public.tpch_orders as orders
        );
      
  
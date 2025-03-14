

select *
from
snowflake_prac.public.samp as orders
join 
snowflake_prac.public.tpc_lineage as tpc_lineage
on orders.orderkey=tpc_lineage.L_ORDERKEY

  create or replace   view snowflake_prac.public.tpc_lineage
  
   as (
    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.LINEITEM
  );


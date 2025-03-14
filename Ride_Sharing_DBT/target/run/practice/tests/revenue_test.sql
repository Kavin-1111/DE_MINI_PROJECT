select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT
    *
from RIDE_SHARING_DB.STAGING.stg_transaction
WHERE REVENUE<0
      
    ) dbt_internal_test
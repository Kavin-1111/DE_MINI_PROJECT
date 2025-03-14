select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select PRODUCT_ID
from RIDE_SHARING_DB.RAW.PRODUCTS
where PRODUCT_ID is null



      
    ) dbt_internal_test
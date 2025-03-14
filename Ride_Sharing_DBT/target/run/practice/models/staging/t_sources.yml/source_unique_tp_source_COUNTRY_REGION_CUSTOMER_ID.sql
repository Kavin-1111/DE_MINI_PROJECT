select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    CUSTOMER_ID as unique_field,
    count(*) as n_records

from RIDE_SHARING_DB.RAW.COUNTRY_REGION
where CUSTOMER_ID is not null
group by CUSTOMER_ID
having count(*) > 1



      
    ) dbt_internal_test
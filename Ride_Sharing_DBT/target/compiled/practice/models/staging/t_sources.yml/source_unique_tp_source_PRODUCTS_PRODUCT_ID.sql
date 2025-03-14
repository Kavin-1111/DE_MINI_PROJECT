
    
    

select
    PRODUCT_ID as unique_field,
    count(*) as n_records

from RIDE_SHARING_DB.RAW.PRODUCTS
where PRODUCT_ID is not null
group by PRODUCT_ID
having count(*) > 1



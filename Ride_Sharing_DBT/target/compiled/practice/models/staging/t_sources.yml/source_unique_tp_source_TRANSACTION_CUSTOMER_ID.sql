
    
    

select
    CUSTOMER_ID as unique_field,
    count(*) as n_records

from RIDE_SHARING_DB.RAW.TRANSACTION
where CUSTOMER_ID is not null
group by CUSTOMER_ID
having count(*) > 1



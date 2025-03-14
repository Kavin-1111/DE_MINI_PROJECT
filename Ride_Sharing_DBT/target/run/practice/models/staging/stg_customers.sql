
  create or replace   view RIDE_SHARING_DB.STAGING.stg_customers
  
   as (
    

SELECT 
    CUSTOMER_ID,
    CUSTOMERNAME,
    COMPANY
FROM RIDE_SHARING_DB.RAW.CUSTOMERS
  );


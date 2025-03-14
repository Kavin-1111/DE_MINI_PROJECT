
  create or replace   view RIDE_SHARING_DB.STAGING.stg_country
  
   as (
    

SELECT 
    CUSTOMER_ID,
    COUNTRY,
    REGION
FROM RIDE_SHARING_DB.RAW.COUNTRY_REGION
  );



  create or replace   view RIDE_SHARING_DB.STAGING.stg_transaction
  
   as (
    

SELECT 
    CUSTOMER_ID,
    PRODUCT_ID,
    TO_DATE(PAYMENT_MONTH, 'DD-MM-YYYY') AS PAYMENT_MONTH,
    REVENUE_TYPE,
    REVENUE,
    QUANTITY,
    COMPANIES
FROM RIDE_SHARING_DB.RAW.TRANSACTION
  );


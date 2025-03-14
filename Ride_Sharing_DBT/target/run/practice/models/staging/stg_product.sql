
  
    

        create or replace transient table RIDE_SHARING_DB.MART.stg_product
         as
        (

SELECT 
    PRODUCT_ID,
    PRODUCT_FAMILY,
    PRODUCT_SUB_FAMILY
FROM RIDE_SHARING_DB.RAW.PRODUCTS



        );
      
  
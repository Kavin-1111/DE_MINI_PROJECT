
  
    

        create or replace transient table RIDE_SHARING_DB.MARTS.mart_high_cross
         as
        (
WITH cross_sell as(
SELECT 
    CUSTOMER_ID,
    Count(DISTINCT PRODUCT_ID) AS UNIQUE_PRODUCTS,
    SUM(REVENUE) AS TOTAL_REVENUE
FROM RIDE_SHARING_DB.STAGING.stg_transaction
GROUP BY CUSTOMER_ID
)
SELECT 
    CUSTOMER_ID,
    UNIQUE_PRODUCTS,
    DENSE_RANK() OVER (ORDER BY UNIQUE_PRODUCTS DESC) AS RANK,
    TOTAL_REVENUE
FROM cross_sell
    wHERE UNIQUE_PRODUCTS > 1
    ORDER BY UNIQUE_PRODUCTS DESC
        );
      
  

  
    

        create or replace transient table RIDE_SHARING_DB.MARTS.mart_product_revenue
         as
        (
SELECT 
    p.PRODUCT_ID,
    p.PRODUCT_FAMILY,
    SUM(r.REVENUE) AS TOTAL_REVENUE,
    COUNT(DISTINCT r.CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    RANK() OVER (ORDER BY TOTAL_REVENUE DESC) AS RANK
FROM RIDE_SHARING_DB.MART.stg_product p
JOIN RIDE_SHARING_DB.STAGING.stg_transaction r 
ON p.PRODUCT_ID = r.PRODUCT_ID
GROUP BY p.PRODUCT_ID, p.PRODUCT_FAMILY
ORDER BY TOTAL_REVENUE DESC
        );
      
  
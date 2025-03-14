
  
    

        create or replace transient table RIDE_SHARING_DB.MARTS.customers_rank
         as
        (
WITH stg_customers AS (
SELECT 
    c.CUSTOMER_ID,
    c.CUSTOMERNAME,
    SUM(r.REVENUE) AS TOTAL_REVENUE,
    RANK() OVER (ORDER BY TOTAL_REVENUE DESC) AS RANK
FROM RIDE_SHARING_DB.STAGING.stg_customers c
JOIN RIDE_SHARING_DB.STAGING.stg_transaction r 
ON c.CUSTOMER_ID = r.CUSTOMER_ID
GROUP BY c.CUSTOMER_ID,CUSTOMERNAME
ORDER BY TOTAL_REVENUE DESC
)
SELECT 
    s.CUSTOMER_ID,
    s.CUSTOMERNAME,
    con.COUNTRY,
    con.REGION,
    s.TOTAL_REVENUE,
    s.RANK
    
FROM stg_customers s
JOIN RIDE_SHARING_DB.STAGING.stg_country con
on s.CUSTOMER_ID = con.CUSTOMER_ID
        );
      
  
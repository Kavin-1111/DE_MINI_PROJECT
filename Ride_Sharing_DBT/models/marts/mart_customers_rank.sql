
{{ config(
    materialized='table',
    schema='MARTS'
) }}
WITH stg_customers AS (
SELECT 
    c.CUSTOMER_ID,
    c.CUSTOMERNAME,
    SUM(r.REVENUE) AS TOTAL_REVENUE,
    RANK() OVER (ORDER BY TOTAL_REVENUE DESC) AS RANK
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('stg_transaction') }} r 
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
JOIN {{ ref('stg_country') }} con
on s.CUSTOMER_ID = con.CUSTOMER_ID
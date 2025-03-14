
{{ config(
    materialized='table',
    schema='MARTS'
) }}
SELECT 
    p.PRODUCT_ID,
    p.PRODUCT_FAMILY,
    SUM(r.REVENUE) AS TOTAL_REVENUE,
    COUNT(DISTINCT r.CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    RANK() OVER (ORDER BY TOTAL_REVENUE DESC) AS RANK
FROM {{ ref('stg_product') }} p
JOIN {{ ref('stg_transaction') }} r 
ON p.PRODUCT_ID = r.PRODUCT_ID
GROUP BY p.PRODUCT_ID, p.PRODUCT_FAMILY
ORDER BY TOTAL_REVENUE DESC




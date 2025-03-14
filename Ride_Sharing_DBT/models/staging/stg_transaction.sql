{{ config(
    schema='STAGING', 
    materialized='view'  
) }}

SELECT 
    CUSTOMER_ID,
    PRODUCT_ID,
    TO_DATE(PAYMENT_MONTH, 'DD-MM-YYYY') AS PAYMENT_MONTH,
    REVENUE_TYPE,
    REVENUE,
    QUANTITY,
    COMPANIES
FROM {{ source('tp_source', 'TRANSACTION') }}


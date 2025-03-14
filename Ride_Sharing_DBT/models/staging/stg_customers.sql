{{ config(
    schema='STAGING',
    materialized='view'  
) }}

SELECT 
    CUSTOMER_ID,
    CUSTOMERNAME,
    COMPANY
FROM {{ source('tp_source', 'CUSTOMERS') }}

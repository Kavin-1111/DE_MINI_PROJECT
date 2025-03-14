{{ config(
    schema='STAGING',
    materialized='view'  
) }}

SELECT 
    PRODUCT_ID,
    PRODUCT_FAMILY,
    PRODUCT_SUB_FAMILY
FROM {{ source('tp_source', 'PRODUCTS') }}


{{ config(
    schema='MART',
    materialized='table'
) }}

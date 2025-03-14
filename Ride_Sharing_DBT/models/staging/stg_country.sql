{{ config(
    schema='STAGING',
    materialized='view'  
) }}

SELECT 
    CUSTOMER_ID,
    COUNTRY,
    REGION
FROM {{ source('tp_source', 'COUNTRY_REGION') }}

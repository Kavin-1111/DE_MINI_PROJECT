{{ config(
    schema='MARTS',
    materialized='table'  
) }}


WITH first_payment AS (
    SELECT
        customer_id,
        YEAR(MIN(PAYMENT_MONTH)) AS fiscal_Year,
    FROM
        {{ref('stg_transaction')}}
    GROUP BY customer_id
)
SELECT
    fiscal_Year,
    COUNT(customer_id) AS new_logos_count
FROM
    first_payment
GROUP BY fiscal_Year
 
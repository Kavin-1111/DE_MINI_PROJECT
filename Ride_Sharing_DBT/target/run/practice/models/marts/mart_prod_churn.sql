
  
    

        create or replace transient table RIDE_SHARING_DB.MARTS.mart_prod_churn
         as
        (



WITH transactions AS (
    SELECT
        PRODUCT_ID,
        DATE_TRUNC('month',PAYMENT_MONTH) AS tran_month
    FROM RIDE_SHARING_DB.STAGING.stg_transaction
),
 
max_month AS (
    SELECT MAX(tran_month) AS latest_month FROM transactions
),
 
churn_status AS (
    SELECT
        t.PRODUCT_ID,
        m.latest_month,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -3, m.latest_month) THEN 'Churned'
            ELSE 'Active'
        END AS L3m_churn_status,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -1, m.latest_month) THEN 'Churned'
            ELSE 'Active'
        END AS LM_churn_status,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -12, m.latest_month) THEN 'Churned'
            ELSE 'Active'
        END AS Ltm_churn_status
    FROM transactions t
    CROSS JOIN max_month m
    GROUP BY t.PRODUCT_ID,m.latest_month
)
SELECT * FROM churn_status
        );
      
  
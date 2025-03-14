



WITH transactions AS (
    SELECT
        customer_id,
        DATE_TRUNC('month',PAYMENT_MONTH) AS tran_month
    FROM RIDE_SHARING_DB.STAGING.stg_transaction
),
 
max_month AS (
    SELECT MAX(tran_month) AS latest_month FROM transactions
),
 
churn_status AS (
    SELECT
        t.customer_id,
        MAX(t.tran_month) AS last_transaction_month,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -3, m.latest_month) THEN 1
            ELSE 0
        END AS L3m_churn_status,
        CASE
            WHEN MIN(t.tran_month) >= DATEADD('month', -3, m.latest_month) THEN 1
            ELSE 0
        END AS L3MCustomer_Status,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -1, m.latest_month) THEN 1
            ELSE 0
        END AS LM_churn_status,
        CASE
            WHEN MIN(t.tran_month) >= DATEADD('month', -1, m.latest_month) THEN 1 
            ELSE 0
        END AS LM_Customer_Status,
        CASE
            WHEN MAX(t.tran_month) <= DATEADD('month', -12, m.latest_month) THEN 1
            ELSE 0
        END AS Ltm_churn_status,
        CASE
            WHEN MIN(t.tran_month) >= DATEADD('month', -12, m.latest_month) THEN 1
            ELSE 0
        END AS Ltm_Customer_Status
    FROM transactions t
    CROSS JOIN max_month m
    GROUP BY t.customer_id,m.latest_month
)
SELECT sum(LM_churn_status) as churned_last_month,
sum(L3m_churn_status) as churned_last_3_months,
sum(Ltm_churn_status) as churned_last_12_months,
sum(LM_Customer_Status) as new_customers_last_month,
sum(L3MCustomer_Status) as new_customers_last_3_months,
sum(Ltm_Customer_Status) as new_customers_last_12_months
 FROM 
churn_status
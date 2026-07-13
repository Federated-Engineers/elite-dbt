{{ config(materialized='table') }}

SELECT
    payer_id
    , count(*) AS total_claims
    , sum(total_billed_amount) AS total_billed
    , sum(amount_paid_by_insurance) AS insurance_paid
    , avg(amount_paid_by_insurance / nullif(total_billed_amount, 0)
    ) AS reimbursement_ratio
    , avg(
        CASE
            WHEN claim_status = 'Denied' THEN 1
            ELSE 0
        END
    ) AS denial_rate
    , current_timestamp() AS last_updated
FROM {{ ref('fct_claims') }}
GROUP BY payer_id

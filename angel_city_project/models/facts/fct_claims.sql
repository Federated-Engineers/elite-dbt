{{ config(materialized='table') }}

SELECT
    claim_id
    , encounter_id
    , payer_id
    , processed_date
    , total_billed_amount
    , amount_paid_by_insurance
    , patient_responsibility_amount
    , reimbursement_rate
    , claim_status
    , denial_reason
    , load_timestamp
FROM {{ ref('stg_claims') }}

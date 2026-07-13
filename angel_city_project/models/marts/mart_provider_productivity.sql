{{ config(materialized='table') }}

SELECT
    provider_id
    , specialty_code
    , provider_type
    , encounter_class
    , COUNT(DISTINCT encounter_id) AS encounter_count
    , COUNT(DISTINCT claim_id) AS claim_count
    , SUM(total_billed_amount) AS total_billed_amount
    , SUM(amount_paid_by_insurance) AS insurance_paid
    , SUM(patient_responsibility_amount) AS patient_responsibility
    , AVG(encounter_duration_minutes) AS avg_encounter_duration_minutes
    , CURRENT_TIMESTAMP() AS last_updated
FROM {{ ref('int_claims_activity') }}
GROUP BY 1, 2, 3, 4

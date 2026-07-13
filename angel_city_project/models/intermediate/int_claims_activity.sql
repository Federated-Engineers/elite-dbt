{{ config(materialized='table') }}

SELECT
    claims.claim_id
    , claims.encounter_id
    , claims.payer_id
    , claims.claim_status
    , claims.denial_reason
    , claims.reimbursement_rate
    , claims.processed_date
    , claims.total_billed_amount
    , claims.amount_paid_by_insurance
    , claims.patient_responsibility_amount
    , encounters.patient_id
    , encounters.provider_id
    , encounters.encounter_start_timestamp
    , encounters.encounter_end_timestamp
    , encounters.encounter_class
    , encounters.admission_source
    , patients.patient_first_name
    , patients.patient_last_name
    , patients.gender_code
    , patients.date_of_birth
    , patients.residential_zip_code
    , patients.primary_insurance_id
    , providers.provider_type
    , providers.specialty_code
    , providers.facility_id
    , providers.is_active
    , DATEDIFF(
        MINUTE
        , encounters.encounter_start_timestamp
        , encounters.encounter_end_timestamp
    ) AS encounter_duration_minutes
    , DATEDIFF(
        YEAR
        , patients.date_of_birth
        , CURRENT_DATE()
    ) AS patient_age

    , CURRENT_TIMESTAMP() AS load_timestamp

FROM {{ ref('fct_claims') }} AS claims

LEFT JOIN {{ ref('fct_encounters') }} AS encounters
    ON claims.encounter_id = encounters.encounter_id

LEFT JOIN {{ ref('dim_patients') }} AS patients
    ON encounters.patient_id = patients.patient_id

LEFT JOIN {{ ref('dim_providers') }} AS providers
    ON encounters.provider_id = providers.provider_id

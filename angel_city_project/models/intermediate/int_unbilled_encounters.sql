{{ config(materialized='table') }}

SELECT
    encounters.encounter_id
    , encounters.patient_id
    , encounters.provider_id
    , encounters.encounter_start_timestamp
    , encounters.encounter_end_timestamp
    , encounters.encounter_class
    , encounters.admission_source
    , encounters.load_timestamp
FROM {{ ref('fct_encounters') }} AS encounters
LEFT JOIN {{ ref('fct_claims') }} AS claims
    ON encounters.encounter_id = claims.encounter_id
WHERE claims.claim_id IS null

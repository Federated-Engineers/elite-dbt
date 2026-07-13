{{ config(materialized='table') }}

SELECT
    encounter_id
    , patient_id
    , provider_id
    , encounter_class
    , encounter_end_timestamp
    , 'missing_claim' AS operational_issue
    , current_timestamp() AS last_updated
FROM {{ ref('int_unbilled_encounters') }}

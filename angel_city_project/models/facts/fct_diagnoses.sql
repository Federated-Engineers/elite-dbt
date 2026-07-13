{{ config(

materialized='incremental',
unique_key='diagnosis_id'

) }}

WITH diagnoses_details AS (
    SELECT *
    FROM {{ ref('stg_diagnoses') }} AS diagnoses
    {% if is_incremental() %}
        WHERE diagnoses.load_timestamp > ( SELECT max(load_timestamp) FROM {{ this }})  --noqa
    {% endif %}
)

, final AS (
    SELECT
        diagnosis_id
        , encounter_id
        , icd_10_code
        , diagnosis_rank
        , coding_system
        , recorded_at_timestamp
        , load_timestamp
    FROM diagnoses_details
)

SELECT *
FROM final

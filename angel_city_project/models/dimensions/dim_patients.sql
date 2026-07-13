{{ config(

materialized='incremental',
unique_key='patient_id'

) }}

WITH patient_details AS (
    SELECT *
    FROM {{ ref('stg_patients') }} AS patients
    {% if is_incremental() %}
        WHERE patients.load_timestamp > ( SELECT max(load_timestamp) FROM {{ this }}) --noqa
    {% endif %}
)

, final AS (
    SELECT
        patient_id
        , patient_first_name
        , patient_last_name
        , gender_code
        , date_of_birth
        , residential_zip_code
        , primary_insurance_id
        , load_timestamp
    FROM patient_details
)

SELECT *
FROM final

{{ config(

materialized='incremental',
unique_key='encounter_id'

) }}

WITH encounters_details AS (
    SELECT *
    FROM {{ ref('stg_encounters') }} AS encounters
    {% if is_incremental() %}
        WHERE encounters.load_timestamp > (SELECT max(load_timestamp) FROM {{ this }}) --noqa
    {% endif %}
)

, final AS (
    SELECT
        encounter_id
        , patient_id
        , provider_id
        , encounter_start_timestamp
        , encounter_end_timestamp
        , encounter_class
        , admission_source
        , load_timestamp
    FROM encounters_details
)

SELECT *
FROM final

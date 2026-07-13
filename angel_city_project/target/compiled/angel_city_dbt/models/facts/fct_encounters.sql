WITH encounters_details AS (
    SELECT *
    FROM angel_city_health_db.dev.stg_encounters

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

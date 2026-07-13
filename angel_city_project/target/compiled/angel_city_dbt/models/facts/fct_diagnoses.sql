WITH diagnoses_details AS (
    SELECT *
    FROM angel_city_health_db.dev.stg_diagnoses

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

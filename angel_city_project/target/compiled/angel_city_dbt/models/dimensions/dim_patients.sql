WITH patient_details AS (
    SELECT *
    FROM angel_city_health_db.dev.stg_patients

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

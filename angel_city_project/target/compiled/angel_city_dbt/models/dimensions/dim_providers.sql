WITH provider_details AS (
    SELECT *
    FROM angel_city_health_db.dev.stg_providers

)

, final AS (
    SELECT
        provider_id
        , npi_number
        , specialty_code
        , provider_type
        , facility_id
        , hire_date
        , is_active
        , load_timestamp
    FROM provider_details
)

SELECT *
FROM final

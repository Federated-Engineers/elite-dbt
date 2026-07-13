{{ config(

materialized='incremental',
unique_key='provider_id'

) }}

WITH provider_details AS (
    SELECT *
    FROM {{ ref('stg_providers') }} AS providers
    {% if is_incremental() %}
        WHERE providers.load_timestamp > (SELECT max(load_timestamp) FROM {{ this }}) --noqa
    {% endif %}
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

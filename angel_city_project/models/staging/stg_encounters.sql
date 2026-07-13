{{ config(materialized='view') }}

SELECT

    ENCOUNTER_DATA:encounter_id::STRING AS ENCOUNTER_ID
    , ENCOUNTER_DATA:patient_id::STRING AS PATIENT_ID
    , ENCOUNTER_DATA:provider_id::STRING AS PROVIDER_ID
    , ENCOUNTER_DATA:admission_source::STRING AS ADMISSION_SOURCE
    , SOURCE_FILE_NAME
    , FILE_ROW_NUMBER
    , FILE_LAST_MODIFIED
    , LOAD_TIMESTAMP
    , TRY_TO_TIMESTAMP(
        ENCOUNTER_DATA:encounter_start_timestamp::STRING
    ) AS ENCOUNTER_START_TIMESTAMP
    , TRY_TO_TIMESTAMP(
        ENCOUNTER_DATA:encounter_end_timestamp::STRING
    ) AS ENCOUNTER_END_TIMESTAMP
    , COALESCE(
        ENCOUNTER_DATA:encounter_class::STRING
        , ENCOUNTER_DATA:encounterClass::STRING
    ) AS ENCOUNTER_CLASS
FROM {{ source('angel_city_db','encounters_raw') }}

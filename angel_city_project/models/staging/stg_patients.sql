{{ config(materialized='view') }}

SELECT
    PATIENT_DATA:patient_id::STRING AS PATIENT_ID
    , PATIENT_DATA:first_name::STRING AS PATIENT_FIRST_NAME
    , PATIENT_DATA:last_name::STRING AS PATIENT_LAST_NAME
    , PATIENT_DATA:gender_code::STRING AS GENDER_CODE
    , PATIENT_DATA:social_security_hash::STRING AS SOCIAL_SECURITY_HASH
    , PATIENT_DATA:primary_insurance_id::STRING AS PRIMARY_INSURANCE_ID
    , PATIENT_DATA:contact_info.phone::STRING AS PHONE
    , PATIENT_DATA:contact_info.email::STRING AS PATIENT_EMAIL
    , SOURCE_FILE_NAME
    , FILE_ROW_NUMBER
    , FILE_LAST_MODIFIED
    , LOAD_TIMESTAMP
    , TRY_TO_DATE(
        PATIENT_DATA:date_of_birth::STRING
    ) AS DATE_OF_BIRTH
    , COALESCE(
        PATIENT_DATA:residential_zip_code::STRING
        , PATIENT_DATA:contact_info.residential_zip_code::STRING
    ) AS RESIDENTIAL_ZIP_CODE
    , COALESCE(
        TRY_TO_TIMESTAMP(PATIENT_DATA:created_at::STRING)
        , TRY_TO_TIMESTAMP(PATIENT_DATA:createdAt::STRING)
    ) AS CREATED_AT
FROM {{ source('angel_city_db','patients_raw') }}

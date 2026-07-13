CREATE OR REPLACE VIEW ANGEL_CITY_HEALTH_DB.DEV.STG_CLAIMS

AS (

    SELECT
        CLAIMS_DATA:claim_id::STRING AS CLAIM_ID
        , CLAIMS_DATA:encounter_id::STRING AS ENCOUNTER_ID
        , CLAIMS_DATA:payer_id::STRING AS PAYER_ID
        , CLAIMS_DATA:total_billed_amount::NUMBER(18, 2) AS TOTAL_BILLED_AMOUNT
        , CLAIMS_DATA:amount_paid_by_insurance::NUMBER(18, 2)
            AS AMOUNT_PAID_BY_INSURANCE
        , CLAIMS_DATA:patient_responsibility_amount::NUMBER(18, 2)
            AS PATIENT_RESPONSIBILITY_AMOUNT
        , CLAIMS_DATA:claim_status::STRING AS CLAIM_STATUS
        , CLAIMS_DATA:adjudication.denial_reason::STRING
            AS DENIAL_REASON
        , CLAIMS_DATA:adjudication.reimbursement_rate::FLOAT
            AS REIMBURSEMENT_RATE
        , SOURCE_FILE_NAME

        , FILE_ROW_NUMBER
        , FILE_LAST_MODIFIED
        , LOAD_TIMESTAMP
        , TRY_TO_DATE(
            CLAIMS_DATA:adjudication.processed_date::STRING
        ) AS PROCESSED_DATE
    FROM ANGEL_CITY_HEALTH_DB.RAW.CLAIMS_RAW
);

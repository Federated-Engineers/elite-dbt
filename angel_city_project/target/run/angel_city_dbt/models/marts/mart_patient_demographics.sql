CREATE OR REPLACE TRANSIENT TABLE ANGEL_CITY_HEALTH_DB.DEV.MART_PATIENT_DEMOGRAPHICS

AS (

    WITH PATIENT_AGE AS (
        SELECT
            PATIENT_ID
            , GENDER_CODE
            , RESIDENTIAL_ZIP_CODE
            , PATIENT_RESPONSIBILITY_AMOUNT
            , DATEDIFF(
                YEAR
                , DATE_OF_BIRTH
                , CURRENT_DATE()
            ) AS AGE
            , CASE
                WHEN
                    DATEDIFF(YEAR, DATE_OF_BIRTH, CURRENT_DATE()) < 18
                    THEN '0-17'
                WHEN
                    DATEDIFF(
                        YEAR, DATE_OF_BIRTH, CURRENT_DATE()
                    ) BETWEEN 18 AND 35
                    THEN '18-35'
                WHEN
                    DATEDIFF(
                        YEAR, DATE_OF_BIRTH, CURRENT_DATE()
                    ) BETWEEN 36 AND 50
                    THEN '36-50'
                WHEN
                    DATEDIFF(
                        YEAR, DATE_OF_BIRTH, CURRENT_DATE()
                    ) BETWEEN 51 AND 65
                    THEN '51-65'
                ELSE '65+'
            END AS AGE_GROUP
        FROM ANGEL_CITY_HEALTH_DB.DEV.INT_CLAIMS_ACTIVITY

    )

    SELECT
        RESIDENTIAL_ZIP_CODE
        , AGE_GROUP
        , GENDER_CODE
        , CONCAT(
            AGE_GROUP
            , '-'
            , GENDER_CODE
        ) AS AGE_GENDER
        , COUNT(DISTINCT PATIENT_ID) AS PATIENT_COUNT
        , AVG(PATIENT_RESPONSIBILITY_AMOUNT) AS AVERAGE_PATIENT_RESPONSIBILITY
        , SUM(PATIENT_RESPONSIBILITY_AMOUNT) AS TOTAL_PATIENT_RESPONSIBILITY
    FROM PATIENT_AGE
    GROUP BY
        RESIDENTIAL_ZIP_CODE
        , AGE_GROUP
        , GENDER_CODE
);

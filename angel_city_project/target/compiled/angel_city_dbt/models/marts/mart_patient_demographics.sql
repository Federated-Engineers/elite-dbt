WITH patient_age AS (
    SELECT
        patient_id
        , gender_code
        , residential_zip_code
        , patient_responsibility_amount
        , DATEDIFF(
            YEAR
            , date_of_birth
            , CURRENT_DATE()
        ) AS age
        , CASE
            WHEN DATEDIFF(YEAR, date_of_birth, CURRENT_DATE()) < 18 THEN '0-17'
            WHEN
                DATEDIFF(YEAR, date_of_birth, CURRENT_DATE()) BETWEEN 18 AND 35
                THEN '18-35'
            WHEN
                DATEDIFF(YEAR, date_of_birth, CURRENT_DATE()) BETWEEN 36 AND 50
                THEN '36-50'
            WHEN
                DATEDIFF(YEAR, date_of_birth, CURRENT_DATE()) BETWEEN 51 AND 65
                THEN '51-65'
            ELSE '65+'
        END AS age_group
    FROM angel_city_health_db.dev.int_claims_activity

)

SELECT
    residential_zip_code
    , age_group
    , gender_code
    , CONCAT(
        age_group
        , '-'
        , gender_code
    ) AS age_gender
    , COUNT(DISTINCT patient_id) AS patient_count
    , AVG(patient_responsibility_amount) AS average_patient_responsibility
    , SUM(patient_responsibility_amount) AS total_patient_responsibility
FROM patient_age
GROUP BY
    residential_zip_code
    , age_group
    , gender_code

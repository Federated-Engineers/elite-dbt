{{ config(materialized='table') }}

WITH diagnoses AS (
    SELECT
        residential_zip_code
        , icd_10_code
        , COUNT(*) AS diagnosis_count
    FROM {{ ref('int_diagnosis_history') }}
    GROUP BY
        residential_zip_code
        , icd_10_code

)

, ranked AS (
    SELECT
        residential_zip_code
        , icd_10_code
        , diagnosis_count
        , DENSE_RANK() OVER (
            PARTITION BY residential_zip_code
            ORDER BY diagnosis_count DESC
        ) AS ranking
    FROM diagnoses
)

SELECT
    residential_zip_code
    , icd_10_code
    , diagnosis_count
    , ranking
    , CONCAT(
        residential_zip_code
        , '-'
        , icd_10_code
    ) AS zip_diagnosis
FROM ranked
WHERE ranking <= 5

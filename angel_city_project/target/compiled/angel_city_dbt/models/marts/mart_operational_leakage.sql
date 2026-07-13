SELECT
    encounter_id
    , patient_id
    , provider_id
    , encounter_class
    , encounter_end_timestamp
    , 'missing_claim' AS operational_issue
    , current_timestamp() AS last_updated
FROM angel_city_health_db.dev.int_unbilled_encounters

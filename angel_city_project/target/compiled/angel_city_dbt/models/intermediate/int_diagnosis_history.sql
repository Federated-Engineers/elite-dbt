SELECT
    diagnoses.diagnosis_id
    , diagnoses.encounter_id
    , patients.gender_code
    , patients.residential_zip_code
    , diagnoses.icd_10_code
    , diagnoses.diagnosis_rank
    , diagnoses.coding_system
    , diagnoses.recorded_at_timestamp
    , encounters.patient_id
    , encounters.provider_id
    , encounters.encounter_start_timestamp
    , encounters.encounter_end_timestamp
    , encounters.encounter_class
    , encounters.admission_source
FROM angel_city_health_db.dev.fct_diagnoses AS diagnoses
LEFT JOIN angel_city_health_db.dev.fct_encounters AS encounters
    ON diagnoses.encounter_id = encounters.encounter_id
LEFT JOIN angel_city_health_db.dev.dim_patients AS patients
    ON encounters.patient_id = patients.patient_id

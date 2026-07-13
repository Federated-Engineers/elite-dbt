SELECT
    claim_id
    , payer_id
    , claim_status
    , total_billed_amount
    , amount_paid_by_insurance
    , patient_responsibility_amount
    , encounter_end_timestamp
    , processed_date
    , datediff(
        DAY
        , encounter_end_timestamp
        , processed_date
    ) AS days_to_payment
    , current_timestamp() AS last_updated
FROM angel_city_health_db.dev.int_claims_activity
WHERE claim_status = 'Paid'

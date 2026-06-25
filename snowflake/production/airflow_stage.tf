resource "snowflake_stage_external_s3" "angel_city_stage" {
  name                = "ANGEL_CITY_STAGE"
  url                 = "s3://angel-city-health-data/"
  database            = snowflake_database.elite_dbt_db.name
  schema              = snowflake_schema.raw.name
  storage_integration = snowflake_storage_integration_aws.angel_city_s3_integration.name
  comment             = "External stage for JSON files"
}

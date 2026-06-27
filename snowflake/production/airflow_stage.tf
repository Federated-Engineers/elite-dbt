resource "snowflake_stage_external_s3" "angel_city_stage" {
  name                = "ANGEL_CITY_STAGE"
  url                 = ["s3://${data.aws_s3_bucket.angel_city_health_data.bucket}/"]
  database            = snowflake_database.angel_city_dbt_db.name
  schema              = snowflake_schema.raw.name
  storage_integration = snowflake_storage_integration_aws.angel_city_s3_integration.name
  comment             = "External stage for JSON files"
}

resource "snowflake_storage_integration_aws" "angel_city_s3_integration" {
  name                      = "ANGEL_CITY_S3_INTEGRATION"
  storage_provider          = "S3"
  enabled                   = true
  storage_aws_role_arn      = data.aws_iam_role.elite_snowflake_s3_role.arn
  storage_allowed_locations = ["s3://angel-city-health-data/"]
  comment                   = "Storage integration for Angel City data lake"
}

resource "snowflake_stage_external_s3" "angel_city_stage" {
  name                = "ANGEL_CITY_STAGE"
  url                 = "s3://angel-city-health-data/"
  database            = snowflake_database.angel_city_dbt_db.name
  schema              = snowflake_schema.raw.name
  storage_integration = snowflake_storage_integration_aws.angel_city_s3_integration.name
  comment             = "External stage for JSON files"
}

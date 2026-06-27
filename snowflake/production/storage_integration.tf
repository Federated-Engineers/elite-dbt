resource "snowflake_storage_integration_aws" "angel_city_s3_integration" {
  name                      = "ANGEL_CITY_S3_INTEGRATION"
  storage_provider          = "S3"
  enabled                   = true
  storage_aws_role_arn      = data.aws_iam_role.elite_snowflake_s3_role.arn
  storage_allowed_locations = "s3://angel-city-health-data/"
  comment                   = "Storage integration for Angel City data lake"
}

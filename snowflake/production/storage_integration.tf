resource "snowflake_storage_integration_aws" "angel_city_s3_integration" {
  name             = "ANGEL_CITY_S3_INTEGRATION"
  storage_provider = "S3"
  enabled          = true

  # storage_aws_external_id  = "..."
  # storage_aws_iam_user_arn = "..."

  storage_aws_role_arn      = "arn:aws:iam::049417293525:role/elite-snowflake-role"
  storage_allowed_locations = ["s3://angel-city-health-data/"]
  comment                   = "Storage integration for Angel City data lake"
}

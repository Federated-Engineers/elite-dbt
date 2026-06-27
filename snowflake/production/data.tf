data "aws_ssm_parameter" "dbt_snowflake_password" {
  name            = "/staging/elite/snowflake/snowflake_password"
  with_decryption = true
}

data "aws_iam_role" "elite_snowflake_s3_role" {
  name = "elite-snowflake-role"
}

data "aws_s3_bucket" "angel_city_health_data" {
  bucket = "angel-city-health-data"
}

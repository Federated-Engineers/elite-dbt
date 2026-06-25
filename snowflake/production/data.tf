data "aws_ssm_parameter" "elite_dbt_snowflake_password" {
  name            = "/staging/elite/snowflake/snowflake_password"
  with_decryption = true
}

resource "snowflake_account_role" "platform_admin" {
  name = "ELITE_PLATFORM_ADMIN"
}

resource "snowflake_account_role" "data_engineer" {
  name = "ELITE_DATA_ENGINEER"
}

resource "snowflake_account_role" "analytics_engineer" {
  name = "ELITE_ANALYTICS_ENGINEER"
}

resource "snowflake_account_role" "data_scientist" {
  name = "ELITE_DATA_SCIENTIST"
}

resource "snowflake_account_role" "data_analyst" {
  name = "ELITE_DATA_ANALYST"
}

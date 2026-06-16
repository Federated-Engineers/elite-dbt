resource "snowflake_grant_privileges_to_account_role" "platform_admin_database" {
  privileges = [
    "USAGE",
    "MONITOR",
    "MODIFY",
    "CREATE SCHEMA",
    "CREATE DATABASE ROLE"
  ]
  account_role_name = snowflake_account_role.platform_admin.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_db_usage" {
  privileges = ["USAGE","MONITOR","MODIFY"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_db_usage" {
  privileges = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyts_db_usage" {
  privileges = ["USAGE"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_ownership" "platform_admin_dev_schema" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.elite_dbt_db.name}\".\"${snowflake_schema.dev.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_admin_prod_schema" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.elite_dbt_db.name}\".\"${snowflake_schema.prod.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_admin_data_science_schema" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.elite_dbt_db.name}\".\"${snowflake_schema.data_science.name}\""
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_prod" {
  privileges = [
    "USAGE",
    "MONITOR",
    "MODIFY",
    "CREATE TABLE",
    "CREATE VIEW",
    "CREATE STAGE"
  ]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema {
    schema_name = "${snowflake_database.elite_dbt_db.name}.${snowflake_schema.prod.name}"
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_dev" {
  privileges = [
    "USAGE",
    "CREATE TABLE",
    "CREATE VIEW",
    "CREATE STAGE"
  ]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = "${snowflake_database.elite_dbt_db.name}.${snowflake_schema.dev.name}"
  }
}

resource "snowflake_grant_privileges_to_account_role" "scientist_schema" {
  privileges = [
    "USAGE",
    "CREATE TABLE",
    "CREATE MODEL",
    "CREATE VIEW"
  ]
  account_role_name = snowflake_account_role.data_scientist.name
  on_schema {
    schema_name = "${snowflake_database.elite_dbt_db.name}.${snowflake_schema.data_science.name}"
  }
}

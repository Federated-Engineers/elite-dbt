resource "snowflake_grant_privileges_to_account_role" "platform_admin_warehouse" {
  privileges = [
    "USAGE",
    "MONITOR",
    "OPERATE",
    "MODIFY"
  ]

  account_role_name = snowflake_account_role.platform_admin.name

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.elite_dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "engineer_wh" {
  privileges = [
    "USAGE",
    "MONITOR",
    "MODIFY",
    "OPERATE"
  ]
  account_role_name = snowflake_account_role.data_engineer.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.elite_dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_wh" {
  privileges = [
    "USAGE",
    "MONITOR"
  ]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.elite_dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "scientist_wh" {
  privileges = [
    "USAGE",
    "MONITOR"
  ]
  account_role_name = snowflake_account_role.data_scientist.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.elite_dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analyst_wh" {
  privileges = ["USAGE"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.elite_dbt_wh.name
  }
}

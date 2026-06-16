resource "snowflake_grant_account_role" "platform_admin_to_sysadmin" {
  role_name        = snowflake_account_role.platform_admin.name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "engineer_to_platform_admin" {
  role_name        = snowflake_account_role.data_engineer.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "analytics_to_platform_admin" {
  role_name        = snowflake_account_role.analytics_engineer.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "scientist_to_platform_admin" {
  role_name        = snowflake_account_role.data_scientist.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "analyst_to_platform_admin" {
  role_name        = snowflake_account_role.data_analyst.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

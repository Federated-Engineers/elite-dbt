module "elite_platform_admin_user" {
  source = "../modules/user"

  name       = "ELITE_PLATFORM_ADMIN_USER"
  login_name = "ELITE_PLATFORM_ADMIN"
  first_name = "Elite"
  last_name  = "Platform"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "Platform administration user"
  display_name = "Elite Platform Admin"
  disabled     = var.disabled

  default_warehouse = "ELITE_PLATFORM_ADMIN_WH"
  default_role      = "ELITE_PLATFORM_ADMIN"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

module "elite_data_engineer_user" {
  source = "../modules/user"

  name       = "ELITE_DATA_ENGINEER_USER"
  login_name = "ELITE_DATA_ENGINEER"
  first_name = "Elite"
  last_name  = "DataEngineer"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "Data engineering user"
  display_name = "Elite Data Engineer"
  disabled     = var.disabled

  default_warehouse = "ELITE_DATA_ENGINEER_WH"
  default_role      = "ELITE_DATA_ENGINEER"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

module "elite_analytics_engineer_user" {
  source = "../modules/user"

  name       = "ELITE_ANALYTICS_ENGINEER_USER"
  login_name = "ELITE_ANALYTICS_ENGINEER"
  first_name = "Elite"
  last_name  = "AnalyticsEngineer"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "Analytics engineering user"
  display_name = "Elite Analytics Engineer"
  disabled     = var.disabled

  default_warehouse = "ELITE_ANALYTICS_ENGINEER_WH"
  default_role      = "ELITE_ANALYTICS_ENGINEER"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

module "elite_data_analyst_user" {
  source = "../modules/user"

  name       = "ELITE_DATA_ANALYST_USER"
  login_name = "ELITE_DATA_ANALYST"
  first_name = "Elite"
  last_name  = "DataAnalyst"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "Data analyst user"
  display_name = "Elite Data Analyst"
  disabled     = var.disabled

  default_warehouse = "ELITE_DATA_ANALYST_WH"
  default_role      = "ELITE_DATA_ANALYST"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

module "airflow_user" {
  source = "../modules/user"

  name       = "AIRFLOW_USER"
  login_name = "AIRFLOW_USER"
  first_name = "Airflow"
  last_name  = "Service"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "Airflow service account"
  display_name = "Airflow User"
  disabled     = var.disabled

  default_warehouse = "AIRFLOW_WH"
  default_role      = "AIRFLOW_ROLE"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

module "dbt_user" {
  source = "../modules/user"

  name       = "DBT_USER"
  login_name = "DBT_USER"
  first_name = "dbt"
  last_name  = "Service"
  password = data.aws_ssm_parameter.elite_dbt_snowflake_password.value
  comment      = "dbt ECS service account"
  display_name = "dbt User"
  disabled     = var.disabled

  default_warehouse = "DBT_WH"
  default_role      = "DBT_ROLE"

  must_change_password = var.must_change_password
  disable_mfa          = var.disable_mfa
}

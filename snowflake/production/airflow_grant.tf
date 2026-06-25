resource "snowflake_grant_privileges_to_account_role" "airflow_wh" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.airflow_wh.name
  }
}


resource "snowflake_grant_privileges_to_account_role" "airflow_db_usage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_role_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_schema {
    schema_name = snowflake_schema.raw.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_raw_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.raw.fully_qualified_name
    }
  }
}

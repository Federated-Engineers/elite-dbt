resource "snowflake_grant_privileges_to_account_role" "engineer_wh" {
  privileges = [
    "USAGE",
    "MONITOR",
    "MODIFY"
  ]
  account_role_name = snowflake_account_role.data_engineer.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.elite_data_engineer_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_db_usage" {
  privileges        = ["USAGE", "MONITOR", "MODIFY", "CREATE SCHEMA"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema {
    schema_name = snowflake_schema.raw.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_dev" {
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema {
    schema_name = snowflake_schema.dev.fully_qualified_name
  }
  all_privileges    = true
  with_grant_option = true

}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_prod" {
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema {
    schema_name = snowflake_schema.prod.fully_qualified_name
  }
  all_privileges    = true
  with_grant_option = true
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_raw_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.raw.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_dev_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_prod_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_dev_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "data_engineer_prod_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_engineer.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

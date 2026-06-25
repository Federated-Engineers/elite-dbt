resource "snowflake_grant_privileges_to_account_role" "dbt_wh" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_db_usage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.elite_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_role_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.raw.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_role_dev" {
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.dev.fully_qualified_name
  }
  all_privileges    = true
  with_grant_option = true

}

resource "snowflake_grant_privileges_to_account_role" "dbt_role_prod" {
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.prod.fully_qualified_name
  }
  all_privileges    = true
  with_grant_option = true
}

resource "snowflake_grant_privileges_to_account_role" "raw_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.raw.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dev_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "prod_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dev_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "prod_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

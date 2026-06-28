resource "snowflake_grant_privileges_to_account_role" "analytics_wh" {
  privileges = [
    "USAGE",
    "MONITOR"
  ]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.analytics_engineer_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_db_usage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.angel_city_dbt_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_raw" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.raw.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_dev" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.dev.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_prod" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.prod.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_raw_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.raw.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_dev_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_prod_tables" {
  privileges        = ["SELECT", "INSERT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_dev_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.dev.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_engineer_prod_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.prod.fully_qualified_name
    }
  }
}

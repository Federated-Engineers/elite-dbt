resource "snowflake_schema" "raw" {
  database = snowflake_database.elite_dbt_db.name
  name     = "RAW"
}

resource "snowflake_schema" "dev" {
  database = snowflake_database.elite_dbt_db.name
  name     = "DEV"
}

resource "snowflake_schema" "prod" {
  database = snowflake_database.elite_dbt_db.name
  name     = "PROD"
}


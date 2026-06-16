resource "snowflake_schema" "dev" {
  database = snowflake_database.elite_dbt_db.name
  name     = "DEV"
}

resource "snowflake_schema" "prod" {
  database = snowflake_database.elite_dbt_db.name
  name     = "PROD"
}

resource "snowflake_schema" "data_science" {
  database = snowflake_database.elite_dbt_db.name
  name     = "DATA_SCIENCE"
}


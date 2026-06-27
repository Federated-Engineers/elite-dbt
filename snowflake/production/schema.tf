resource "snowflake_schema" "raw" {
  database = snowflake_database.angel_city_dbt_db.name
  name     = "RAW"
}

resource "snowflake_schema" "dev" {
  database = snowflake_database.angel_city_dbt_db.name
  name     = "DEV"
}

resource "snowflake_schema" "silver" {
  database = snowflake_database.angel_city_dbt_db.name
  name     = "SILVER"
}

resource "snowflake_schema" "prod" {
  database = snowflake_database.angel_city_dbt_db.name
  name     = "PROD"
}

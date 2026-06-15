resource "snowflake_warehouse" "elite_dbt_wh" {
  name                = "ELITE_DBT_WH"
  warehouse_size      = "XSMALL"
  auto_suspend        = 60
  auto_resume         = true
  initially_suspended = true
}

resource "snowflake_database" "elite_dbt_db" {
  name = "ELITE_DBT_DB"
}

resource "snowflake_schema" "dbt_angel_city" {
  database = snowflake_database.elite_dbt_db.name
  name     = "DBT_ANGEL_CITY"
}

resource "snowflake_schema" "prod" {
  database = snowflake_database.elite_dbt_db.name
  name     = "PROD"
}

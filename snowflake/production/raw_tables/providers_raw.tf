resource "snowflake_table" "providers_raw" {
  database = snowflake_database.angel_city_dbt_db.name
  schema   = snowflake_schema.raw.name
  name     = "PROVIDERS_RAW"
  comment  = "Raw JSON provider data landed from S3."

  column {
    name    = "PROVIDER_DATA"
    type    = "VARIANT"
    comment = "Raw JSON provider record."
  }

  column {
    name = "SOURCE_FILE_NAME"
    type = "VARCHAR"
  }

  column {
    name = "FILE_ROW_NUMBER"
    type = "NUMBER(38,0)"
  }

  column {
    name = "FILE_LAST_MODIFIED"
    type = "TIMESTAMP_NTZ"
  }

  column {
    name = "LOAD_TIMESTAMP"
    type = "TIMESTAMP_NTZ"

    default {
      expression = "CURRENT_TIMESTAMP()"
    }
  }
}

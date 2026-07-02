resource "snowflake_table" "encounters_raw" {
  database = snowflake_database.angel_city_dbt_db.name
  schema   = snowflake_schema.raw.name
  name     = "ENCOUNTERS_RAW"
  comment  = "Raw JSON encounter data landed from S3."

  column {
    name    = "ENCOUNTER_DATA"
    type    = "VARIANT"
    comment = "Raw JSON encounter record."
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

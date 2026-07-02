resource "snowflake_table" "diagnoses_raw" {
  database = snowflake_database.angel_city_dbt_db.name
  schema   = snowflake_schema.raw.name
  name     = "DIAGNOSES_RAW"
  comment  = "Raw JSON diagnoses data landed from S3."

  column {
    name    = "DIAGNOSIS_DATA"
    type    = "VARIANT"
    comment = "Raw JSON diagnosis record."
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

resource "snowflake_table" "claims_raw" {
  database = snowflake_database.angel_city_dbt_db.name
  schema   = snowflake_schema.raw.name
  name     = "CLAIMS_RAW"
  comment  = "Raw JSON claims data landed from S3."

  column {
    name    = "CLAIMS_DATA"
    type    = "VARIANT"
    comment = "Raw JSON claim record."
  }

  column {
    name    = "SOURCE_FILE_NAME"
    type    = "VARCHAR"
    comment = "S3 file name."
  }

  column {
    name    = "FILE_ROW_NUMBER"
    type    = "NUMBER(38,0)"
    comment = "Row number within the source file."
  }

  column {
    name    = "FILE_LAST_MODIFIED"
    type    = "TIMESTAMP_NTZ"
    comment = "Last modified timestamp of the source file."
  }

  column {
    name    = "LOAD_TIMESTAMP"
    type    = "TIMESTAMP_NTZ"
    comment = "Timestamp when the record was loaded."

    default {
      expression = "CURRENT_TIMESTAMP()"
    }
  }
}

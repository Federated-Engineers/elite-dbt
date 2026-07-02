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

resource "snowflake_table" "patients_raw" {
  database = snowflake_database.angel_city_dbt_db.name
  schema   = snowflake_schema.raw.name
  name     = "PATIENTS_RAW"
  comment  = "Raw JSON patient data landed from S3."

  column {
    name    = "PATIENT_DATA"
    type    = "VARIANT"
    comment = "Raw JSON patient record."
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

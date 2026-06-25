resource "snowflake_file_format" "json_data" {
  name          = "JSON_FORMAT"
  database      = snowflake_database.elite_dbt_db.name
  schema        = snowflake_schema.raw.name
  format_type   = "JSON"
  comment       = "JSON file format for S3 ingestion"
}

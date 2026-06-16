resource "snowflake_warehouse" "elite_dbt_wh" {
  name                = "ELITE_DBT_WH"
  warehouse_size      = "XSMALL"
  auto_suspend        = 60
  auto_resume         = true
  initially_suspended = true
  comment             = "Warehouse for dbt workloads"
}

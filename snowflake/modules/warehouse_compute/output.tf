output "name" {
  description = "Warehouse name"
  value       = snowflake_warehouse.elite-dbt-warehouse.name
}

output "warehouse_size" {
  description = "Warehouse size"
  value       = snowflake_warehouse.elite-dbt-warehouse.id
}

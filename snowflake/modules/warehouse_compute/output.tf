output "name" {
  description = "The name of the Snowflake warehouse."
  value       = snowflake_warehouse.angel-city-warehouse.name
}

output "warehouse_size" {
  description = "Warehouse size"
  value       = snowflake_warehouse.angel-city-warehouse.warehouse_size
}

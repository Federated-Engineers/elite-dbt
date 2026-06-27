output "name" {
  description = "Warehouse name"
  value       = snowflake_warehouse.angel-city-warehouse
}

output "warehouse_size" {
  description = "Warehouse size"
  value       = snowflake_warehouse.angel-city-warehouse.id
}

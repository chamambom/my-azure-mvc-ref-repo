# Output variable definitions

output "name" {
  description = "storage container name"
  value       = azurerm_storage_container.mvc_storage_container.name 
}

output "id" {
  description = "storage container id"
  value       = azurerm_storage_container.mvc_storage_container.id
}
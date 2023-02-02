resource "azurerm_management_group" "management_group" {
  name                       = var.management_group_details.id
  display_name               = var.management_group_details.name
  parent_management_group_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_details.parent}"
  subscription_ids           = var.management_group_details.sub_list
}
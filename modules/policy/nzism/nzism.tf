resource "azurerm_management_group_policy_assignment" "nzismassignment" {
  name                 = "nzismassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/d1a462af-7e6d-4901-98ac-61570b4ed22a"
  description          = "MVC Policy NZISM"
  display_name         = "MVC NZISM"
  location             = var.nzismlocation
  identity {
    type = "SystemAssigned"
  }
  parameters = <<PARAMETERS
{
  "MembersToInclude-30f71ea1-ac77-4f26-9fc5-2d926bbd4ba7": {
    "value": ""
  },
  "MembersToExclude-69bf4abd-ca1e-4cf6-8b5a-762d42e61d4f": {
    "value": ""
  },
  "logAnalyticsWorkspaceId-f47b5582-33ec-4c5c-87c0-b010a6b2e917": {
    "value": "${var.logAnalyticsId}"
  }
}
PARAMETERS

}
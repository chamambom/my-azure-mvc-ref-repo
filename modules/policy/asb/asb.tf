resource "azurerm_management_group_policy_assignment" "azsecbmassignment" {
  name                 = "azsecbmassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
  description          = "MVC Policy Azure Security Benchmark"
  display_name         = "MVC ASB"
  location             = var.asblocation
  
}
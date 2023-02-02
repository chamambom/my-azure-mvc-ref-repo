#Enable flags for Azure Defender for open-source relational databases policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_OSdb" {
  display_name = "Azure Defender for open-source relational databases should be enabled"
}

resource "azurerm_management_group_policy_assignment" "osdbassignment" {
  name                 = "defosdbassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_OSdb.id
  description          = "MVC Policy Azure Defender for open-source relational databases"
  display_name         = "MVC Azure Defender for open-source relational databases"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for open-source relational databases policy end -----------------------------------------------------

#Enable flags for Azure Defender for Key Vault policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_keyv" {
  display_name = "Azure Defender for Key Vault should be enabled"
}

resource "azurerm_management_group_policy_assignment" "keyvassignment" {
  name                 = "defkeyvassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_keyv.id
  description          = "MVC Policy Azure Defender for Key Vault"
  display_name         = "MVC Azure Defender for Key Vault"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for Key Vault policy end -----------------------------------------------------

#Enable flags for Azure Defender for App Service policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_app" {
  display_name = "Azure Defender for App Service should be enabled"
}

resource "azurerm_management_group_policy_assignment" "appassignment" {
  name                 = "defappassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_app.id
  description          = "MVC Policy Azure Defender for App Service"
  display_name         = "MVC Azure Defender for App Service"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for App Servic end -----------------------------------------------------

#Enable flags for Azure Defender for Storage policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_stg" {
  display_name = "Azure Defender for Storage should be enabled"
}

resource "azurerm_management_group_policy_assignment" "stgassignment" {
  name                 = "defstgassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_stg.id
  description          = "MVC Policy Azure Defender for Storage"
  display_name         = "MVC Azure Defender for Storage"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for Storage policy end -----------------------------------------------------

#Enable flags for Azure Defender for servers policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_server" {
  display_name = "Azure Defender for servers should be enabled"
}

resource "azurerm_management_group_policy_assignment" "serverassignment" {
  name                 = "defserverassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_server.id
  description          = "MVC Policy Azure Defender for servers"
  display_name         = "MVC Azure Defender for servers"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for servers policy end -----------------------------------------------------

resource "azurerm_management_group_policy_assignment" "sqlassignment" {
  name                 = "defsqlassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6581d072-105e-4418-827f-bd446d56421b"
  description          = "MVC Policy Azure Defender for SQL servers"
  display_name         = "MVC Azure Defender for SQL servers"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for SQL servers policy end -----------------------------------------------------

#Enable flags for Azure Defender for DNS policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_dns" {
  display_name = "Azure Defender for DNS should be enabled"
}

resource "azurerm_management_group_policy_assignment" "dnsassignment" {
  name                 = "defdnsassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_dns.id
  description          = "MVC Policy Azure Defender for DNS"
  display_name         = "MVC Azure Defender for DNS"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for DNS policy end -----------------------------------------------------

#Enable flags for Azure Defender for Resource Manager policy -----------------------------------------------------
data "azurerm_policy_definition" "az_def_rm" {
  display_name = "Azure Defender for Resource Manager should be enabled"
}

resource "azurerm_management_group_policy_assignment" "rmassignment" {
  name                 = "defrmassignment"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.az_def_rm.id
  description          = "MVC Policy Azure Defender for Resource Manager"
  display_name         = "MVC Azure Defender for Resource Manager"
  location             = var.defenderlocation
  
}
#Enable flags for Azure Defender for Resource Manager policy end -----------------------------------------------------
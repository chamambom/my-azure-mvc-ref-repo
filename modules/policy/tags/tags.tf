#Policy Tag Enforcement

data "azurerm_policy_definition" "enforce_tag" {
  display_name = "Require a tag on resource groups"
}

resource "azurerm_management_group_policy_assignment" "enforce_tag_assignment" {
  name                 = "enforcetags"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.enforce_tag.id
  description          = "MVC Enforce tags from Resource Groups"
  display_name         = "MVC Enforce Tags"
  parameters = <<PARAMETERS
{

   "tagName": {
    "value": "${var.tag_values}"
  }
}
PARAMETERS
}

#Policy Tag Enforcement Ends ------------------------------

#Policy Tag Append

data "azurerm_policy_definition" "append_tag" {
  display_name = "Append a tag and its value from the resource group"
}

resource "azurerm_management_group_policy_assignment" "resource_group_tag_assignment" {
  name                 = "inherittags"
  management_group_id  = var.policy_scope
  policy_definition_id = data.azurerm_policy_definition.append_tag.id
  description          = "Inherit tags from Resource Groups"
  display_name         = "Inherit Tags"
  parameters = <<PARAMETERS
{

   "tagName": {
    "value": "${var.tag_values}"
  }
}
PARAMETERS
}

#Policy Tag Append Ends ------------------------------
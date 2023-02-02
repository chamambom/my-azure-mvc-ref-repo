resource "azuread_group" "ad_group_owner" {
  display_name = var.ad_group_owner_name
  security_enabled = true
}

resource "azuread_group" "ad_group_contributor" {
  display_name = var.ad_group_contributorName
  security_enabled = true
}

resource "azuread_group" "ad_group_reader" {
  display_name = var.ad_group_reader_name
  security_enabled = true
}

resource "azurerm_role_assignment" "owner" {
  scope                = var.owner_role_scope
  role_definition_name = "Owner"
  principal_id         = azuread_group.ad_group_owner.id
}

resource "azurerm_role_assignment" "contributor" {
  scope                = var.contributer_role_scope
  role_definition_name = "Contributor" 
  principal_id         = azuread_group.ad_group_contributor.id
}

resource "azurerm_role_assignment" "reader" {
  scope                = var.reader_role_scope
  role_definition_name = "Reader"
  principal_id         = azuread_group.ad_group_reader.id
}
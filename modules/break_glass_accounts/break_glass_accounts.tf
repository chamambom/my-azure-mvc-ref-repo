#### The main Terraform module to create Management Policy            ####
#### Author:                                                          ####
#### Date:                                                            ####
#### Version: 0.1                                                     ####
#### File Name: breakGlassAccounts.tf                                      ####
#### Description: This script to deploy Azure Landing Zone            ####
#### azurerm version = "~>3.0"                                        ####

terraform {
 required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
      configuration_aliases = [ azurerm ]
    }
  }
}

resource "random_id" "bga_password" {
    byte_length = 24
}
resource "azuread_user" "bga" {
  user_principal_name   = var.bga_upn
  display_name          = var.bga_display_name
  password              = azurerm_key_vault_secret.bga_secret.value
  force_password_change = true
}

data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "bga" {
}

resource "azurerm_role_assignment" "bga_role" {
  scope                = var.bga_role_scope
  role_definition_name = "Owner"
  principal_id         = azuread_user.bga.object_id
}

resource "azurerm_key_vault_secret" "bga_secret" {
  name         = "${var.bga_secret_name}-secret"
  value        = random_id.bga_password.id
  key_vault_id = var.bga_keyvault
}
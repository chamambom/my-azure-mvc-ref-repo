#### The main Terraform module to create Management Policy            ####
#### Author:                                                          ####
#### Date:                                                            ####
#### Version: 0.1                                                     ####
#### File Name: storageAccount.tf                                      ####
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

resource "random_id" "storage_id" {
    byte_length = 4
}

resource "azurerm_storage_account" "mvc_storage" {
  name                     = "${var.storage_account_name}i${random_id.storage_id.hex}"
  resource_group_name      = var.saResourceGroup
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  min_tls_version          = var.min_tls_version
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  is_hns_enabled           = var.is_hns_enabled

  blob_properties {
    delete_retention_policy {
      days = var.blob_soft_delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_soft_delete_retention_days
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "${var.environment_tags}"
  }
}

resource "azurerm_management_lock" "lock_storage_account" {

  name       = "BlobStorageDeleteLock"
  scope      = azurerm_storage_account.mvc_storage.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent accidental deletion"
}
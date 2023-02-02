#### The main Terraform module to create Management Policy            ####
#### Author:                                                          ####
#### Date:                                                            ####
#### Version: 0.1                                                     ####
#### File Name: mgmtPolicy.tf                                      ####
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

resource "azurerm_storage_management_policy" "mvc_mgmt_policy" {

  storage_account_id = var.storage_account_id

  rule {
    name   = var.rule_name
    enabled = "true"
    filters {
      prefix_match = ["${var.prefix_match}"]
      blob_types   = ["blockBlob"]
      #match_blob_index_tag {
      #  name      = "tag1"
      #  operation = "=="
      #  value     = "val1"
      #}
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.tier_to_cool_days
        tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_days
        delete_after_days_since_modification_greater_than          = var.blob_delete_after_days
      }
      snapshot {
        delete_after_days_since_creation_greater_than = var.snapshot_delete_after_days
      }
    }
  }
}
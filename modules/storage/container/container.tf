#### The main Terraform module to create Management Policy            ####
#### Author:                                                          ####
#### Date:                                                            ####
#### Version: 0.1                                                     ####
#### File Name: container.tf                                      ####
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
}                                     ####

resource "random_id" "container_id" {
    byte_length = 4
}

resource "azurerm_storage_container" "mvc_storage_container" {
 
	name                  = "${var.container_name}i${random_id.container_id.hex}"
	storage_account_name  = "${var.storage_account_name}"
	container_access_type = var.container_access_type

}
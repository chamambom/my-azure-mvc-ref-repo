terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    azuread ={
      source = "hashicorp/azuread"
      version = "2.24.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "azuread" {
  # Configuration options
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "production"
  subscription_id = var.subscription_prod
  features {}
}

provider "azurerm" {
  alias           = "shared"
  subscription_id = var.subscription_shared
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azurerm" {
  alias           = "nonprod"
  subscription_id = var.subscription_non_prod
  features {}
}
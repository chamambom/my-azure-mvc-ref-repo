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


#Define the default provider (no alias defined):

provider "azurerm" {
  region  = "aus-east"
}

#Define alternate aliased providers:

provider "azurerm" {
  region  = "aus-south"
  alias   = "production"
}

provider "azurerm" {
  region  = "aus-south"
  alias   = "non-production"
}
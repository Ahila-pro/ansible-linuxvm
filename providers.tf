# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
    features {
        resource_group {
          prevent_deletion_if_contains_resources = true
        }
    }
    subscription_id = "<subscription_id>"
}


terraform {
  backend "azurerm" {
    resource_group_name  = "example-resources"
    storage_account_name = "storageaccount19838"
    container_name       = "tf-container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.rsgname
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.srname
  resource_group_name      = var.rsgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "tf-container"
  storage_account_name  = var.srname
  container_access_type = "private"
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}
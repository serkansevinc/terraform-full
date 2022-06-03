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
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.rsgname
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "macawtfstorage"
  resource_group_name      = var.rsgname
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

variable "location" {
  type        = string
  description = "The location for deployment"
  default     = "West Europe"
}

variable "rsgname" {
  type        = string
  description = "Resource Group name"
  default     = "example2-resources"
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}
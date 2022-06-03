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

variable "location" {
  type        = string
  description = "The location for deployment"
  default     = "West US"
}

variable "rsgname" {
  type        = string
  description = "Resource Group name"
  default     = "example2-resources"
}

output "resource_group_id" {
  value = azurerm_resource_group.example.id
}
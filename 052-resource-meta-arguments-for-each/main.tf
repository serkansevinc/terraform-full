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
  for_each = {
      test = "rg-test"
      acceptance = "rg-acceptance"
      production = "rg-production"
  }
  name     = "${var.rsgname}-${each.value}"
  location = var.location
  tags = {
    Name = "Server-${each.key}"
  }
}

variable "location" {
  type        = string
  description = "The location for deployment"
  default     = "West Europe"
}

variable "rsgname" {
  type        = string
  description = "Resource Group name"
  default     = "terraform-example"
}

output "resource_group_id" {
  value = values(azurerm_resource_group.example)[*].id
}
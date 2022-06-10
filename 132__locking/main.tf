terraform {
  cloud {
    organization = "DaCompany"

    workspaces {
      name = "force-unlocking"
    }
  }

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
  count    = 2
  name     = "${var.rsgname}-${count.index}"
  location = var.location
  tags = {
    Name = "Server-${count.index}"
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
  value = azurerm_resource_group.example[*].id
  # sensitive = true
}
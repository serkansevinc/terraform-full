# Configure the Azure provider
variable "prefix" {
  default = "tfvmex"
}

locals {
  project_name = "Serkan"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "DaCompany"

    workspaces {
      name = "getting-started"
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
  name     = "myTFResourceGroup"
  location = "westeurope"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-${local.project_name}-myTFnetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "ExamPro"

#     workspaces {
#       name = "getting-started"
#     }
#   }

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "3.58.0"
#     }
#   }
# }

# locals {
#   project_name = "Andrew"
# }
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.63.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

module "networking" {
  source = "../../modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  vnet_name = var.vnet_name
  address_prefix = var.address_prefix
  subnet_names = var.subnet_names
  subnet_address_prefixes = var.subnet_address_prefixes

  environment = var.environment
  application = var.application
}
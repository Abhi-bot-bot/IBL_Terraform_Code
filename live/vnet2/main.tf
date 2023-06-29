provider "azurerm" {
  features {}
}

module "vnet" {
  source                = "../../modules/networking"
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_names          = var.subnet_names
  subnet_address_prefixes = var.subnet_address_prefixes
}



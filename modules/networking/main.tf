resource "azurerm_virtual_network" "example" {
  name = var.vnet_name
  address_space = var.address_prefix
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_names)
  name = var.subnet_names[count.index]
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = [var.subnet_address_prefixes[count.index]]
}
resource "azurerm_route_table" "rt" {
  name = var.route_table_name
  resource_group_name = var.resource_group_name
  location = var.location

  route {
    name = "route"
    address_prefix = var.route_address_prefix
    next_hop_type = var.next_hop_type
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "subnet_association1" {
  subnet_id = var.subnet_id_1
  route_table_id = azurerm_route_table.rt.id
}

resource "azurerm_subnet_route_table_association" "subnet_association2" {
  subnet_id = var.subnet_id_2
  route_table_id = azurerm_route_table.rt.id
}
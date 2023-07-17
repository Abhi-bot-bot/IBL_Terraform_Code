resource "azurerm_route_table" "rt" {
  name = "route_table"
  location = var.location
  resource_group_name = var.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name = "route"
    address_prefix = "0.0.0.0/0"
    next_hop_type = "VirtualAppliance"
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "rtakssubnet" {
  subnet_id = var.rt_aks_subnet_id_route
  route_table_id = azurerm_route_table.rt.id
}
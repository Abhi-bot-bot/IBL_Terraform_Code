resource "azurerm_private_endpoint" "private-endpoint" {
  name                = var.private_ep_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.service_connection_name
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection = false
  }

  # private_dns_zone_group {
  #   name = var.dns_zone_group_name
  #   private_dns_zone_ids = var.private_dns_zone_ids
  # }

  tags = {
    Environment = var.environment
    Application = var.application
  }
}
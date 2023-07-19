resource "azurerm_redis_cache" "redis_cache" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.redis_sku_name
  enable_non_ssl_port = var.redis_enable_non_ssl_port
  minimum_tls_version = var.redis_minimum_tls_version
  public_network_access_enabled = var.redis_public_network_access_enabled
}
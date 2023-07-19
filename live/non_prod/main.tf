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

data "azurerm_resource_group" "rg"{
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  count = length(var.subnet_name)
  name = var.subnet_name[count.index]
  virtual_network_name = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "firewall" {
  source = "../../modules/firewall"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  subnet_id = data.azurerm_subnet.subnet[0].id
}

module "aks" {
  source = "../../modules/aks"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  aks_subnet_id = data.azurerm_subnet.subnet[1].id

  depends_on = [ module.route_table ]
}

module "node_pool" {
  source = "../../modules/node_pool"
  kubernetes_cluster_id = module.aks.kubernetes_cluster_id
  depends_on = [ module.aks ]
}

module "route_table" {
  source = "../../modules/route_table"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  next_hop_in_ip_address = module.firewall.private_ip
  rt_aks_subnet_id_route = data.azurerm_subnet.subnet[1].id
}

resource "azurerm_role_assignment" "network_contributor" {
  scope = data.azurerm_resource_group.rg.id
  role_definition_name = "Network Contributor"
  principal_id = module.aks.principal_id
  skip_service_principal_aad_check = true
}

module "key_vault" {
  source = "../../modules/key_vault"
  key_vault_name = var.key_vault_name
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

# module "private_dns_zone" {
#   source = "../../modules/private_dns_zone"
#   private_dns_zone_name = var.private_dns_zone_name
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

module "kv_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_ep_name = var.kv_private_ep_name
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id = data.azurerm_subnet.subnet[var.indexnumber].id
  service_connection_name = var.kv_service_connection_name
  private_connection_resource_id = module.key_vault.key_vault_id
  subresource_names = var.kv_subresource_names
  #dns_zone_group_name = var.kv_dns_zone_group_name
  # private_dns_zone_ids = [ module.private_dns_zone.private_dns_zone_id ]
}

module "redis_cache" {
  source = "../../modules/redis_cache"
  redis_cache_name = var.redis_cache_name
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  capacity = var.capacity
  family = var.family
  redis_sku_name = var.redis_sku_name
  redis_enable_non_ssl_port = var.redis_enable_non_ssl_port
  redis_minimum_tls_version = var.redis_minimum_tls_version
  redis_public_network_access_enabled = var.redis_public_network_access_enabled

  depends_on = [ module.key_vault ]
}

module "redis_private_endpoint" {
  source = "../../modules/private_endpoint"
  private_ep_name = var.redis_private_ep_name
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id = data.azurerm_subnet.subnet[var.indexnumber].id
  service_connection_name = var.redis_service_connection_name
  private_connection_resource_id = module.redis_cache.redis_cache_id
  subresource_names = var.redis_subresource_names
}
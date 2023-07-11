terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.64.0"
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

module "vnet" {
  source = "../../modules/networking"
  resource_group_name = var.resource_group_name
  location = var.location
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnet_names = var.subnet_names
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "aks" {
  source = "../../modules/aks"
  resource_group_name = var.resource_group_name
  location = var.location
  aks_name = var.aks_name
  kubernetes_version = var.kubernetes_version
  dns_prefix = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled
  default_node_pool_name = var.default_node_pool_name
  default_node_pool_vm_size = var.default_node_pool_vm_size
  vnet_subnet_id = module.vnet.subnet_id[0]
  default_node_pool_enable_auto_scaling = var.default_node_pool_enable_auto_scaling
  default_node_pool_max_count = var.default_node_pool_max_count
  default_node_pool_min_count = var.default_node_pool_min_count
  default_node_pool_node_count = var.default_node_pool_node_count
  network_plugin = var.network_plugin
  network_policy = var.network_policy
  outbound_type = var.outbound_type
}

module "node_pool"{
    source = "../../modules/node_pool"
    kubernetes_cluster_id = module.aks.kubenetes_cluster_id
    node_pool_name = var.node_pool_name
    node_pool_vm_size = var.node_pool_vm_size
    vnet_subnet_id = module.vnet.subnet_id[1]
    enable_auto_scaling = var.enable_auto_scaling
    enable_host_encryption = var.enable_host_encryption
    enable_node_public_ip = var.enable_node_public_ip
    max_count = var.max_count
    min_count = var.min_count
    node_count = var.node_count
    os_disk_type = var.os_disk_type
}

module "route_table" {
  source = "../../modules/route_table"
  resource_group_name = var.resource_group_name
  location = var.location
  route_table_name = var.route_table_name
  route_address_prefix = var.route_address_prefix
  next_hop_type = var.next_hop_type
  next_hop_in_ip_address = var.next_hop_in_ip_address
  subnet_id_1 = module.vnet.subnet_id[0]
  subnet_id_2 = module.vnet.subnet_id[1]
}

module "firewall" {
  source = "../../modules/firewall"
  resource_group_name = var.resource_group_name
  location = var.location
  pip_name = var.pip_name
  zones = var.zones
  allocation_method = var.allocation_method
  sku = var.sku
  firewall_name = var.firewall_name
  threat_intel_mode = var.threat_intel_mode
  sku_name = var.sku_name
  sku_tier = var.sku_tier
  subnet_id_3 = module.vnet.subnet_id[2]
  policy_name = var.policy_name
}

resource "azurerm_role_assignment" "network_contributor"{
    scope = azurerm_resource_group.rg.id
    role_definition_name = "Network Contributor"
    principal_id = module.aks.aks_identity_principal_id
    skip_service_principal_aad_check = true
}

output "fireall_privae_ip" {
  value = module.firewall.private_ip
}
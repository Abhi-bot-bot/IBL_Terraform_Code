resource "azurerm_user_assigned_identity" "aks_identity" {
  resource_group_name = var.resource_group_name
  location = var.location

  name = "UserIdentity"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  resource_group_name = var.resource_group_name
  location = var.location
  kubernetes_version = var.kubernetes_version
  dns_prefix = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name = var.default_node_pool_name
    vm_size = var.default_node_pool_vm_size
    vnet_subnet_id = var.vnet_subnet_id
    zones = var.default_node_pool_availability_zones
    enable_auto_scaling = var.default_node_pool_enable_auto_scaling
    max_count = var.default_node_pool_max_count
    min_count = var.default_node_pool_min_count
    node_count = var.default_node_pool_node_count
  }

  identity {
    type = "UserAssigned"
    identity_ids = tolist([azurerm_user_assigned_identity.aks_identity.id])
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    outbound_type = var.outbound_type
  }
}
resource "azurerm_user_assigned_identity" "aks_identity" {
  location = var.location
  resource_group_name = var.resource_group_name
  name = "UserIdentity"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  location = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version = var.kubernetes_version
  dns_prefix = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool {
    name = var.default_node_pool_name
    node_count = var.default_node_pool_node_count
    vm_size = var.default_node_pool_vm_size
    vnet_subnet_id = var.aks_subnet_id
    enable_node_public_ip = false
    enable_auto_scaling = true
    max_count = var.default_node_pool_max_count
    min_count = var.default_node_pool_min_count
  }

  identity {
    type = "UserAssigned"
    identity_ids = tolist([azurerm_user_assigned_identity.aks_identity.id])
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    outbound_type = "userDefinedRouting"
  }

  tags = {
    Environment = var.environment
    Application = var.application
  }
}
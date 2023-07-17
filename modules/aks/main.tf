resource "azurerm_user_assigned_identity" "aks_identity" {
  location = var.location
  resource_group_name = var.resource_group_name
  name = "UserIdentity"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = "aks"
  location = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version = "1.25.6"
  dns_prefix = "aksdnsprefix"
  private_cluster_enabled = true

  default_node_pool {
    name = "system"
    node_count = 1
    vm_size = "Standard_DS2_v2"
    vnet_subnet_id = var.aks_subnet_id
    enable_node_public_ip = false
    enable_auto_scaling = true
    max_count = 2
    min_count = 1
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
}
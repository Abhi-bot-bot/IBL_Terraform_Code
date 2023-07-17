resource "azurerm_kubernetes_cluster_node_pool" "node_pool" {
  kubernetes_cluster_id = var.kubernetes_cluster_id
  name = "user"
  vm_size = "Standard_DS2_v2"
  mode = "User"
  enable_node_public_ip = false
  enable_host_encryption = false
  node_count = 1
  enable_auto_scaling = true
  max_count = 2
  min_count = 1
}
output "kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.aks_identity.principal_id
}
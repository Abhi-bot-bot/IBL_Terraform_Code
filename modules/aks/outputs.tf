output "kubenetes_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_identity_principal_id" {
  value = azurerm_user_assigned_identity.aks_identity.principal_id
}
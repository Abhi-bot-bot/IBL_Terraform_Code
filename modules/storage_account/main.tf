resource "azurerm_storage_account" "account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = false

  network_rules {
    default_action = "Deny"
    bypass = [ "None" ]
  }
}
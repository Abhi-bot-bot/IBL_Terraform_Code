data "azurerm_client_config" "current" {}

# Create a key vault
resource "azurerm_key_vault" "key-vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 90
  enable_rbac_authorization = true
  purge_protection_enabled = false
  public_network_access_enabled = false
  sku_name            = "standard"

  network_acls {
    default_action = "Deny"
    bypass = "AzureServices"
  }

  tags = {
    Environment = var.environment
    Application = var.application
  }
}
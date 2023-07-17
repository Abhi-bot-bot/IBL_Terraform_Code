resource "azurerm_public_ip" "pip" {
  name = "testpip"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_firewall" "firewall" {
  name = "testfirewall"
  location = var.location
  resource_group_name = var.resource_group_name
  sku_name = "AZFW_VNet"
  sku_tier = "Standard"
  firewall_policy_id = azurerm_firewall_policy.policy.id

  ip_configuration {
    name = "configuration"
    subnet_id = var.subnet_id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_firewall_policy" "policy" {
  name = "Policy"
  location = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_firewall_policy_rule_collection_group" "policy" {
  name = "AksEgressPolicyRuleCollectionGroup"
  firewall_policy_id = azurerm_firewall_policy.policy.id
  priority = 500

  application_rule_collection {
    name = "ApplicationRules"
    priority = 500
    action = "Allow"

    rule {
      name = "AllowMicrosoftFqdns"
      source_addresses = ["*"]

      destination_fqdns = [
        "*.cdn.mscr.io",
        "mcr.microsoft.com",
        "*.data.mcr.microsoft.com",
        "management.azure.com",
        "login.microsoftonline.com",
        "acs-mirror.azureedge.net",
        "dc.services.visualstudio.com",
        "*.opinsights.azure.com",
        "*.oms.opinsights.azure.com",
        "*.microsoftonline.com",
        "*.monitoring.azure.com",
      ]

      protocols {
        port = "80"
        type = "Http"
      }

      protocols {
        port = "443"
        type = "Https"
      }
    }

    rule {
      name = "AllowFqdnsForOsUpdates"
      source_addresses = ["*"]

      destination_fqdns = [
        "download.opensuse.org",
        "security.ubuntu.com",
        "ntp.ubuntu.com",
        "packages.microsoft.com",
        "snapcraft.io"
      ]

      protocols {
        port = "80"
        type = "Http"
      }

      protocols {
        port = "443"
        type = "Https"
      }
    }

    rule {
      name = "AllowImagesFqdns"
      source_addresses = ["*"]

      destination_fqdns = [
        "auth.docker.io",
        "registry-1.docker.io",
        "production.cloudflare.docker.com",
        "hub.docker.com",
        "cdn.auth0.com",
        "login.docker.com"
      ]

      protocols {
        port = "80"
        type = "Http"
      }

      protocols {
        port = "443"
        type = "Https"
      }
    }

    rule {
      name = "AllowBing"
      source_addresses = ["*"]

      destination_fqdns = [
        "*.bing.com"
      ]

      protocols {
        port = "80"
        type = "Http"
      }

      protocols {
        port = "443"
        type = "Https"
      }
    }

    rule {
      name = "AllowGoogle"
      source_addresses = ["*"]

      destination_fqdns = [
        "*.google.com"
      ]

      protocols {
        port = "80"
        type = "Http"
      }

      protocols {
        port = "443"
        type = "Https"
      }
    }
  }

  network_rule_collection {
    name = "NetworkRules"
    priority = 400
    action = "Allow"

    rule {
      name = "Time"
      source_addresses = ["*"]
      destination_ports = ["123"]
      destination_addresses = ["*"]
      protocols = ["UDP"]
    }

    rule {
      name = "DNS"
      source_addresses = ["*"]
      destination_ports = ["53"]
      destination_addresses = ["*"]
      protocols = ["UDP"]
    }

    rule {
      name = "ServiceTags"
      source_addresses = ["*"]
      destination_ports = ["*"]
      destination_addresses = [
        "AzureContainerRegistry",
        "MicrosoftContainerRegistry",
        "AzureActiveDirectory"
      ]
      protocols = ["Any"]
    }
  }

  lifecycle {
    ignore_changes = [ 
      application_rule_collection,
      network_rule_collection,
      nat_rule_collection
     ]
  }
}
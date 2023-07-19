# resource_group_name = "testing"
# location = "Central India"
# subnet_names = [ "AzureFirewallSubnet", "akssubnet" ]
# subnet_address_prefixes = [ "10.4.4.0/24", "10.4.0.0/22" ]

resource_group_name = "msme-nonprod-rg"
subnet_name = [ "AzureFirewallSubnet", "AksSubnet", "Devazureresources" ]
virtual_network_name = "msme-np-vnet"
key_vault_name = "key-fhasdrr"
# private_dns_zone_name = "privatelink.vaultcore.azure.net"
kv_private_ep_name = "example-private-endpoint"
indexnumber = 2
kv_service_connection_name = "example-private-connection"
kv_subresource_names = [ "vault" ]
# dns_zone_group_name = "example-dns-zone-group"
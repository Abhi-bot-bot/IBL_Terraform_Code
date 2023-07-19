# resource_group_name = "testing"
# location = "Central India"
# subnet_names = [ "AzureFirewallSubnet", "akssubnet" ]
# subnet_address_prefixes = [ "10.4.4.0/24", "10.4.0.0/22" ]

resource_group_name = "msme-nonprod-rg"
subnet_name = [ "AzureFirewallSubnet", "AksSubnet", "Devazureresources" ]
virtual_network_name = "msme-np-vnet"

#key_vault
key_vault_name = "key-fhasdrr"
# private_dns_zone_name = "privatelink.vaultcore.azure.net"
kv_private_ep_name = "example-private-endpoint"
indexnumber = 2
kv_service_connection_name = "example-private-connection"
kv_subresource_names = [ "vault" ]
# dns_zone_group_name = "example-dns-zone-group"

#Redis_Cache
redis_cache_name = "dev-msme-redis-tf"
capacity = 0
family = "C"
redis_sku_name = "Basic"
redis_enable_non_ssl_port = true
redis_minimum_tls_version = "1.2"
redis_public_network_access_enabled = true
redis_private_ep_name = "dev-msme-redis-pe-tf"
redis_service_connection_name = "dev-msme-redis-sc-tf"
redis_subresource_names = [ "redisCache" ]
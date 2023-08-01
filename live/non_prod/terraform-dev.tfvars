# resource_group_name = "testing"
# location = "Central India"
# subnet_names = [ "AzureFirewallSubnet", "akssubnet" ]
# subnet_address_prefixes = [ "10.4.4.0/24", "10.4.0.0/22" ]

resource_group_name = "msme-nonprod-rg"
subnet_name = [ "AzureFirewallSubnet", "AksSubnet", "Devazureresources", "DbvmSubnet" ]
virtual_network_name = "msme-np-vnet"

#tags
environment = "dev"
application = "msme"

#aks
aks_name = "msme-np-aks"
kubernetes_version = "1.25.6"
dns_prefix = "aksdnsprefix"
private_cluster_enabled = true
default_node_pool_name = "system"
default_node_pool_node_count = 1
default_node_pool_vm_size = "Standard_DS2_v2"
default_node_pool_max_count = 2
default_node_pool_min_count = 1

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

#Storage_account_1
storage_account_name_1 = "erdfersa1"
sa1_private_ep_name = "sa1-pe"
sa1_service_connection_name = "sa1-cs"
sa1_subresource_names = [ "Blob" ]

#Storage_account_2
storage_account_name_2 = "abcesa2"
sa2_private_ep_name = "sa2-pe"
sa2_service_connection_name = "sa2-cs"
sa2_subresource_names = [ "Blob" ]

#Virtual_machine
vm_public_ip_name = "vm-public-ip"
network_interface_name = "nic-name"
nic_config_name = "nic-config-name"
vm_name = "db-msme-vm"
vm_size = "Standard_DS1_v2"
admin_username = "dbazureuser"
admin_password = "dbazureuser@123"
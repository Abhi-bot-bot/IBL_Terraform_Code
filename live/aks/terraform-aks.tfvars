#RG
resource_group_name = "MSME-dev-app-rg"
location = "Central India"

#vnet
vnet_name = "MSME-dev-app-vnet"
vnet_address_space = ["10.2.0.0/16"]
subnet_names = ["msme-dev-app-akssubnet", "msme-dev-app-nodepoolsubnet", "AzureFirewallSubnet"]
subnet_address_prefixes = ["10.2.0.0/22", "10.2.4.0/24", "10.2.5.0/24"]

#aks
aks_name = "msme-dev-app-aks "
kubernetes_version = "1.25.6"
dns_prefix = "msme-app-dns-prefix"
private_cluster_enabled = true
default_node_pool_name = "default"
default_node_pool_vm_size = "Standard_DS2_v2"
default_node_pool_enable_auto_scaling = true
default_node_pool_max_count = 2
default_node_pool_min_count = 1
default_node_pool_node_count = 1
network_plugin = "azure"
network_policy = "calico"
outbound_type = "userDefinedRouting"

#nodepool
node_pool_name = "nodepool"
node_pool_vm_size = "Standard_DS2_v2"
enable_auto_scaling = true
enable_host_encryption = false
enable_node_public_ip = false
max_count = 2
min_count = 1
node_count = 1
os_disk_type = "Managed"

#Route_table
route_table_name = "msme-app-non-prod-rt"
#route_name = "route"
route_address_prefix = "0.0.0.0/0"
next_hop_type = "VirtualAppliance"
next_hop_in_ip_address = "10.2.5.4"

#firewall
pip_name = "azure-fw-ip"
zones = [ "1", "2", "3" ]
allocation_method = "Static"
sku = "Standard"
firewall_name = "firewall"
threat_intel_mode = "Alert"
sku_name = "AZFW_VNet"
sku_tier = "Standard"
policy_name = "Policy"
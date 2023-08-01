resource_group_name = "msme-nonprod-rg"
location = "Central India"
vnet_name = "msme-np-vnet"
# address_prefix = [ "10.90.192.09/21" ]
# subnet_names = [ "msme-np-aks-subnet", "msme-dev-db-subnet", "msme-sit-db-subnet", "msme-uat-db-subnet", "msme-dev-azure-resources-subnet", "msme-sit-azure-resources-subnet", "msme-uat-azure-resources-subnet", "msme-compute-subnet" ]
# subnet_address_prefixes = [ "10.90.192.0/21", "10.90.200.32/28", "10.90.200.16/28", "10.90.200.0/28", "10.90.200.128/27", "10.90.200.96/27", "10.90.200.64/27", "10.90.200.160/27" ]

address_prefix = [ "10.4.0.0/16" ]
subnet_names = [ "AzureFirewallSubnet", "AksSubnet", "DbvmSubnet", "Devazureresources" ]
subnet_address_prefixes = [ "10.4.4.0/24", "10.4.0.0/22", "10.4.5.0/24", "10.4.6.0/24" ]

#Tags
environment = "non-prod"
application = "msme"
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.63.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

data "azurerm_resource_group" "rg"{
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  count = length(var.subnet_name)
  name = var.subnet_name[count.index]
  virtual_network_name = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

module "firewall" {
  source = "../../modules/firewall"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  subnet_id = data.azurerm_subnet.subnet[0].id
}

module "aks" {
  source = "../../modules/aks"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  aks_subnet_id = data.azurerm_subnet.subnet[1].id

  depends_on = [ module.route_table ]
}

module "node_pool" {
  source = "../../modules/node_pool"
  kubernetes_cluster_id = module.aks.kubernetes_cluster_id
  depends_on = [ module.aks ]
}

module "route_table" {
  source = "../../modules/route_table"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  next_hop_in_ip_address = module.firewall.private_ip
  rt_aks_subnet_id_route = data.azurerm_subnet.subnet[1].id
}

resource "azurerm_role_assignment" "network_contributor" {
  scope = data.azurerm_resource_group.rg.id
  role_definition_name = "Network Contributor"
  principal_id = module.aks.principal_id
  skip_service_principal_aad_check = true
}
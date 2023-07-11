#resource_group
variable "resource_group_name" {
  description = "value"
  type = string
}

variable "location" {
  description = "value"
  type = string
}

#NETWORKING
variable "vnet_name" {
  description = "value"
  type = string
}

variable "vnet_address_space" {
  description = "value"
  type = list(string)
}

variable "subnet_names" {
  description = "value"
  type = list(string)
}

variable "subnet_address_prefixes" {
  description = "value"
  type = list(string)
}

#AKS
variable "aks_name" {
  description = "value"
  type = string
}

variable "kubernetes_version" {
  description = "value"
  type = string
}

variable "dns_prefix" {
  description = "value"
  type = string
}

variable "private_cluster_enabled" {
  description = "value"
  type = bool
}

variable "default_node_pool_name" {
  description = "value"
  type = string
}

variable "default_node_pool_vm_size" {
  description = "value"
  type = string
}

# variable "vnet_subnet_id" {
#   description = "value"
#   type = string
# }

variable "default_node_pool_availability_zones" {
  description = "value"
  type = list(string)
  default = ["1", "2", "3"]
}

variable "default_node_pool_enable_auto_scaling" {
  description = "value"
  type = bool
}

variable "default_node_pool_max_count" {
  description = "value"
  type = number
}

variable "default_node_pool_min_count" {
  description = "value"
  type = number
}

variable "default_node_pool_node_count" {
  description = "value"
  type = number
}

variable "network_plugin" {
  description = "value"
  type = string
}

variable "network_policy" {
  description = "value"
  type = string
}

variable "outbound_type" {
  description = "value"
  type = string
}

# #Node_Pool
# variable "kubernetes_cluster_id" {
#   description = "value"
#   type = string
# }

variable "node_pool_name" {
  description = "value"
  type = string
}

variable "node_pool_vm_size" {
  description = "value"
  type = string
}

variable "mode" {
  description = "value"
  type = string
  default = "User"
}

variable "node_taints" {
  description = "value"
  type = list(string)
  default = [ "CriticalAddonsOnly=true:NoSchedule" ]
}

variable "node_pool_availability_zones" {
  description = "value"
  type = list(string)
  default = [ "1", "2", "3" ]
}

# variable "vnet_subnet_id" {
#   description = "value"
#   type = string
# }

variable "pod_subnet_id" {
  description = "value"
  type = string
  default = null
}

variable "enable_auto_scaling" {
  description = "value"
  type = bool
}

variable "enable_host_encryption" {
  description = "value"
  type = bool
}

variable "enable_node_public_ip" {
  description = "value"
  type = bool
}

variable "proximity_placement_group_id" {
  description = "value"
  type = string
  default = null
}

variable "orchestrator_version" {
  description = "value"
  type = string
  default = null
}

variable "max_count" {
  description = "value"
  type = number
}

variable "min_count" {
  description = "value"
  type = number
}

variable "node_count" {
  description = "value"
  type = number
}

variable "os_disk_size_gb" {
  description = "value"
  type = number
  default = null
}

variable "os_disk_type" {
  description = "value"
  type = string
}

variable "os_type" {
  description = "value"
  type = string
  default = "Linux"
}

variable "priority" {
  description = "value"
  type = string
  default = "Regular"
}

# #Route Table

variable "route_table_name" {
  description = "value"
  type = string
}

variable "route_address_prefix" {
  description = "value"
  type = string
}

variable "next_hop_type" {
  description = "value"
  type = string
}

variable "next_hop_in_ip_address" {
  description = "value"
  type = string
}

# variable "subnet_id_1" {
#   description = "value"
#   type = string
# }

# variable "subnet_id_2" {
#   description = "value"
#   type = string
# }

#FireWall
variable "pip_name" {
  description = "value"
  type = string
}

variable "zones" {
  description = "value"
  type = list(string)
}

variable "allocation_method" {
  description = "value"
  type = string
}

variable "sku" {
  description = "value"
  type = string
}

variable "firewall_name" {
  description = "value"
  type = string
}

variable "threat_intel_mode" {
  description = "value"
  type = string
}

variable "sku_name" {
  description = "value"
  type = string
}

variable "sku_tier" {
  description = "value"
  type = string
}

# variable "subnet_id" {
#   description = "value"
#   type = string
# }

variable "policy_name" {
  description = "value"
  type = string
}
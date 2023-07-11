variable "resource_group_name" {
  description = "value"
  type = string
}

variable "location" {
  description = "value"
  type = string
}

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

variable "vnet_subnet_id" {
  description = "value"
  type = string
}

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
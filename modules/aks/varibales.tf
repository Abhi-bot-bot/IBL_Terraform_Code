variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "private_cluster_enabled" {
  type = bool
}

variable "default_node_pool_name" {
  type = string
}

variable "default_node_pool_node_count" {
  type = number
}

variable "default_node_pool_vm_size" {
  type = string
}

variable "aks_subnet_id" {
  type = string  
}

variable "default_node_pool_max_count" {
  type = number
}

variable "default_node_pool_min_count" {
  type = number
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}
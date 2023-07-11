variable "kubernetes_cluster_id" {
  description = "value"
  type = string
}

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

variable "vnet_subnet_id" {
  description = "value"
  type = string
}

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

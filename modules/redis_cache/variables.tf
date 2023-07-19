variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "redis_cache_name" {
  type = string
}

variable "capacity" {
  type = number
}

variable "family" {
  type = string
}

variable "redis_sku_name" {
  type = string
}

variable "redis_enable_non_ssl_port" {
  type = bool
}

variable "redis_minimum_tls_version" {
  type = string
}

variable "redis_public_network_access_enabled" {
  type = bool
}
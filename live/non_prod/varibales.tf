variable "resource_group_name" {
  type = string
}

variable "subnet_name" {
  type = list(string)
}

variable "virtual_network_name" {
  type = string
}

#key-vault
variable "key_vault_name" {
  type = string
}

# #private_dns_zone
# variable "private_dns_zone_name" {
#   type = string
# }

#private_endpoint
variable "kv_private_ep_name" {
  type = string
}

variable "indexnumber" {
  type = number
}

variable "kv_service_connection_name" {
  type = string
}

variable "kv_subresource_names" {
  type = list(string)
}

# variable "dns_zone_group_name" {
#   type = string
# }

#Redis_Cache
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

#redis_private_endpoint
variable "redis_private_ep_name" {
  type = string
}

# variable "indexnumber" {
#   type = number
# }

variable "redis_service_connection_name" {
  type = string
}

variable "redis_subresource_names" {
  type = list(string)
}
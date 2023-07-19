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
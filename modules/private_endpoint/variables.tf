variable "private_ep_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "service_connection_name" {
  type = string
}

variable "private_connection_resource_id" {
  type = string
}

variable "subresource_names" {
  type = list(string)
}

# variable "dns_zone_group_name" {
#   type = string
# }

# variable "private_dns_zone_ids" {
#   type = list(string)
# }

variable "environment" {
  type = string
}

variable "application" {
  type = string
}
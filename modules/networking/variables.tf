variable "resource_group_name" {
  description = "value"
  type = string
}

variable "location" {
  description = "value"
  type = string
}

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
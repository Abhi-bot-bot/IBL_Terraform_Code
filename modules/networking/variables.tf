variable "vnet_name" {
  description = "Name of the VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the VNet"
  type        = string
}

variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the subnets"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default = "my-resource-group"
}

variable "location" {
  description = "Azure region"
  type        = string
  default = "Central India"
}

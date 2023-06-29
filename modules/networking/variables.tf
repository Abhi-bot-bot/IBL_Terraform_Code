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



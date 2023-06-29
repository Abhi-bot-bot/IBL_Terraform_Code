variable "vnet_name" {
  description = "Name of the VNet"
  type        = string
  default     = "vnet1"
}

variable "vnet_address_space" {
  description = "Address space of the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_names" {
  description = "Names of the subnets"
  type        = list(string)
  default     = ["subnet1"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


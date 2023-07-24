variable "resource_group_name" {
  
}

variable "location" {
  
}

variable "vnet_name" {
  type = string
}

variable "address_prefix" {
  type = list(string)
}

variable "subnet_names" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}
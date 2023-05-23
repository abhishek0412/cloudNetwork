# Defines the default location for all the resources
variable "location" {
  default = "eastus"
}

# Defines the default resource group for all the resources
variable "resource_group_name" {
  default = "TerraformIndia"
}

# Defines the default vnet for all the resources
variable "vnet_name" {
  default = "IndiaVnet"
}

# Defines the default tag name for all the resources
variable "tagname" {
  default = "Practice"
}

# Defines the default network security group name 
variable "nsgname" {
  default = "IndiaNSG"
}
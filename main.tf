# A resource Group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

# A Network security group
resource "azurerm_network_security_group" "network_security" {
  name                = "network_security"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

# A virtual network
resource "azurerm_virtual_network" "myvn" {
  name                = "IndiaVnet"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["192.168.0.0/24"]

  subnet {
    name           = "North"
    address_prefix = "192.168.0.0/28"
    security_group = azurerm_network_security_group.network_security.id
  }

  subnet {
    name           = "South"
    address_prefix = "192.168.0.24/28"
    security_group = azurerm_network_security_group.network_security.id
  }

  subnet {
    name           = "East"
    address_prefix = "192.168.0.54/28"
    security_group = azurerm_network_security_group.network_security.id
  }

  subnet {
    name           = "West"
    address_prefix = "192.168.0.94/28"
    security_group = azurerm_network_security_group.network_security.id
  }
}
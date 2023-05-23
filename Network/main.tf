# A resource Group
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.resource_group_name
  tags = {
    purpose = var.tagname
  }
}

# A Network security group
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    purpose = var.tagname
  }
}

# A virtual network
resource "azurerm_virtual_network" "virtualnetowrk" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["192.168.0.0/24"]

  subnet {
    name           = "North"
    address_prefix = "192.168.0.0/28"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "South"
    address_prefix = "192.168.0.16/28"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "East"
    address_prefix = "192.168.0.48/28"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = "West"
    address_prefix = "192.168.0.96/28"
    security_group = azurerm_network_security_group.nsg.id
  }
  tags = {
    purpose = var.tagname
  }
}
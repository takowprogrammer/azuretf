resource "azurerm_resource_group" "vnet_rg"{
name = var.resource_group_name
location = var.location
}
resource "azurerm_virtual_network" "my01vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.my01vnet.name
  name                 = each.value["name"]
  address_prefixes     = each.value["address_prefixes"]

}




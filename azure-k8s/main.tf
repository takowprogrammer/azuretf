resource "azurerm_resource_group" "vnet_rg" {
  name = var.k8s_resourceRG
  location = var.location
}


resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = "aks1-cluster"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  dns_prefix          = "test-azure-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

identity {
    type = "SystemAssigned"
  }
}

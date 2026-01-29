
// Spoke Virtual Network - 01

resource "azurerm_virtual_network" "spoke_01" {
  name                = "Spoke-01"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name
}

resource "azurerm_subnet" "spoke_01_workload" {
  name                 = "Workload-01-SN"
  resource_group_name  = azurerm_resource_group.fw_manager.name
  virtual_network_name = azurerm_virtual_network.spoke_01.name
  address_prefixes     = ["10.0.1.0/24"]
}

// Spoke Virtual Network - 02

resource "azurerm_virtual_network" "spoke_02" {
  name                = "Spoke-02"
  address_space       = ["10.1.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name
}

resource "azurerm_subnet" "spoke_02_workload" {
  name                 = "Workload-02-SN"
  resource_group_name  = azurerm_resource_group.fw_manager.name
  virtual_network_name = azurerm_virtual_network.spoke_02.name
  address_prefixes     = ["10.1.1.0/24"]
}

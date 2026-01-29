
// Virtual WAN

resource "azurerm_virtual_wan" "vwan_01" {
  name                = "Vwan-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name

  type = "Standard"
}

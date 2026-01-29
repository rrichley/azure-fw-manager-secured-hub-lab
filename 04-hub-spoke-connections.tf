
// Hub to Spoke-01 connection

resource "azurerm_virtual_hub_connection" "hub_spoke_01" {
  name                      = "hub-spoke-01"
  virtual_hub_id            = azurerm_virtual_hub.hub_01.id
  remote_virtual_network_id = azurerm_virtual_network.spoke_01.id

  internet_security_enabled = true
}

// Hub to Spoke-02 connection

resource "azurerm_virtual_hub_connection" "hub_spoke_02" {
  name                      = "hub-spoke-02"
  virtual_hub_id            = azurerm_virtual_hub.hub_01.id
  remote_virtual_network_id = azurerm_virtual_network.spoke_02.id

  internet_security_enabled = true
}

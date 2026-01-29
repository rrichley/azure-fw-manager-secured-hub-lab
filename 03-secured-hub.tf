// Secured Virtual Hub

resource "azurerm_virtual_hub" "hub_01" {
  name                = "Hub-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name

  virtual_wan_id = azurerm_virtual_wan.vwan_01.id
  address_prefix = "10.2.0.0/16"
}

// Azure Firewall in Secured Hub

resource "azurerm_firewall" "hub_firewall" {
  name                = "fw-hub-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name

  sku_name = "AZFW_Hub"
  sku_tier = "Standard"

  // Associate Firewall Policy (Task 6)
  firewall_policy_id = azurerm_firewall_policy.policy_01.id

  virtual_hub {
    virtual_hub_id = azurerm_virtual_hub.hub_01.id
  }
}

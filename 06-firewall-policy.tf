
// Firewall Policy

resource "azurerm_firewall_policy" "policy_01" {
  name                = "Policy-01"
  resource_group_name = azurerm_resource_group.fw_manager.name
  location            = var.location
  sku                 = "Standard"
}

// Application Rule Collection

resource "azurerm_firewall_policy_rule_collection_group" "app_rules" {
  name               = "App-RC-01"
  firewall_policy_id = azurerm_firewall_policy.policy_01.id
  priority           = 100

  application_rule_collection {
    name     = "Allow-Microsoft"
    priority = 100
    action   = "Allow"

    rule {
      name = "Allow-msft"

      source_addresses = ["*"]

      protocols {
        type = "Http"
        port = 80
      }

      protocols {
        type = "Https"
        port = 443
      }

      destination_fqdns = ["*.microsoft.com"]
    }
  }
}

// DNAT Rule Collection (RDP to VM 01)

resource "azurerm_firewall_policy_rule_collection_group" "dnat_rules" {
  name               = "dnat-rdp"
  firewall_policy_id = azurerm_firewall_policy.policy_01.id
  priority           = 200

  nat_rule_collection {
    name     = "Allow-RDP-VM01"
    priority = 100
    action   = "Dnat"

    rule {
      name = "Allow-rdp"

      source_addresses  = ["*"]
      destination_ports = ["3389"]
      protocols         = ["TCP"]

      destination_address = "51.132.233.228"

      translated_address = azurerm_network_interface.nic_spoke_01.private_ip_address
      translated_port    = 3389
    }
  }
}

// Network Rule Collection (RDP VM-to-VM)

resource "azurerm_firewall_policy_rule_collection_group" "network_rules" {
  name               = "vnet-rdp"
  firewall_policy_id = azurerm_firewall_policy.policy_01.id
  priority           = 300

  network_rule_collection {
    name     = "Allow-VNet-RDP"
    priority = 100
    action   = "Allow"

    rule {
      name = "Allow-vnet"

      source_addresses      = ["*"]
      destination_ports     = ["3389"]
      destination_addresses = ["*"]
      protocols             = ["TCP"]
    }
  }
}

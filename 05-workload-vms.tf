
// Network Interfaces

resource "azurerm_network_interface" "nic_spoke_01" {
  name                = "nic-srv-workload-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke_01_workload.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic_spoke_02" {
  name                = "nic-srv-workload-02"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke_02_workload.id
    private_ip_address_allocation = "Dynamic"
  }
}


// Workload VM - Spoke 01

resource "azurerm_windows_virtual_machine" "srv_workload_01" {
  name                = "Srv-workload-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name
  size                = "Standard_D2s_v3"

  admin_username = var.vm_admin_username
  admin_password = var.vm_admin_password

  network_interface_ids = [
    azurerm_network_interface.nic_spoke_01.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}


// Workload VM - Spoke 02

resource "azurerm_windows_virtual_machine" "srv_workload_02" {
  name                = "Srv-workload-02"
  location            = var.location
  resource_group_name = azurerm_resource_group.fw_manager.name
  size                = "Standard_D2s_v3"

  admin_username = var.vm_admin_username
  admin_password = var.vm_admin_password

  network_interface_ids = [
    azurerm_network_interface.nic_spoke_02.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

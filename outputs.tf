output "firewall_public_ip_address" {
  description = "Public IP of the secured virtual hub firewall"
  value       = azurerm_virtual_hub.hub_01.virtual_router_ips[0]
}



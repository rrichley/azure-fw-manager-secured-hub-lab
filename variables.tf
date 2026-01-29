variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for Firewall Manager lab"
  type        = string
}
variable "vm_admin_username" {
  description = "Admin username for workload VMs"
  type        = string
}

variable "vm_admin_password" {
  description = "Admin password for workload VMs"
  type        = string
  sensitive   = true
}

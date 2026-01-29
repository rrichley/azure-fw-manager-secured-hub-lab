# Azure Firewall Manager – Secured Virtual Hub Lab (Terraform)

This repository contains a Terraform implementation of a **hub-and-spoke network architecture secured with Azure Firewall Manager and a Secured Virtual Hub**, based on the Microsoft Learn lab:

**M06 – Unit 9: Secure your virtual hub using Azure Firewall Manager**

## Architecture Overview

- Virtual WAN (vWAN)
- Secured Virtual Hub with Azure Firewall (AZFW_Hub)
- Two spoke VNets with workload VMs
- Azure Firewall Policy with:
  - Application rule (allow *.microsoft.com)
  - DNAT rule (RDP via firewall public IP)
  - Network rule (east–west RDP between spokes)
- Traffic routing enforced via Firewall Manager

## What This Lab Demonstrates

- Securing hub-and-spoke traffic using Azure Firewall Manager
- Differences between routing vs policy enforcement
- DNAT behaviour in secured virtual hubs
- Real-world Azure Firewall + vWAN design considerations
- Terraform implementation of Firewall Manager scenarios

## Folder Structure

All Terraform files are kept in a **single flat folder** for clarity:

```text
azure-fw-manager-lab/
├── 01-spoke-vnets.tf
├── 02-virtual-wan.tf
├── 03-secured-hub.tf
├── 04-hub-spoke-connections.tf
├── 05-workload-vms.tf
├── 06-firewall-policy.tf
├── 08-routing.tf
├── main.tf
├── variables.tf
├── providers.tf
├── outputs.tf
├── terraform.tfvars
├── README.md
└── .gitignore

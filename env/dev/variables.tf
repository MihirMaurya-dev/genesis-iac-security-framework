variable "resource_groups" {
  description = "A map of resource groups to create. Each key is a unique identifier for the resource group, and the value is an object containing the name, location, and optional tags."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = null
}
variable "virtual_networks" {
  description = "A map of virtual networks to create. Each key is a unique identifier for the virtual network, and the value is an object containing the name, location, and other properties."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
  }))
  default = null
}
variable "subnets" {
  description = "A map of subnets to create. Each key is a unique identifier for the subnet, and the value is an object containing the name, resource group name, virtual network name, and address prefixes."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = null
}
variable "public_ips" {
  description = "A map of public IPs to create. Each key is a unique identifier for the public IP, and the value is an object containing the name, location, resource group name, allocation method, and optional tags."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = optional(map(string), {})
  }))
  default = null
}
variable "nat_gateways" {
  description = "A map of NAT gateways to create. Each key is a unique identifier for the NAT gateway, and the value is an object containing the name, location, resource group name, SKU, optional tags, and public IPs."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    tags                = optional(map(string), {})
  }))
  default = null
}

variable "nat_gateway_associations" {
  description = "A map of associations between NAT gateways and subnets. Each key is a unique identifier for the association, and the value is an object containing the NAT gateway key and subnet key."
  type = map(object({
    subnet_name                   = string
    nat_gateway_key               = string
    subnet_virtual_network_name   = string
    subnet_resource_group_name    = string
    public_ip_name                = string
    public_ip_resource_group_name = string
  }))
  default = null
}

variable "bastion_hosts" {
  description = "A map of Bastion hosts to create. Each key is a unique identifier for the Bastion host, and the value is an object containing the name, location, resource group name, DNS name, SKU, optional tags, and IP configuration."
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    tags                          = optional(map(string), {})
    subnet_name                   = string
    subnet_virtual_network_name   = string
    subnet_resource_group_name    = string
    public_ip_name                = string
    public_ip_resource_group_name = string
  }))
  default = null
}
variable "network_interfaces" {
  description = "A map of network interface configurations"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    subnet_name                 = string
    subnet_virtual_network_name = string
    subnet_resource_group_name  = string
  }))
  default = null
}
variable "linux_virtual_machines" {
  description = "A map of Linux virtual machines to create. Each key is a unique identifier for the virtual machine, and the value is an object containing the name, location, resource group name, size, admin username, admin password, network interface name, and image details."
  type = map(object({
    name                                  = string
    location                              = string
    resource_group_name                   = string
    size                                  = string
    admin_username                        = string
    network_interface_name                = string
    network_interface_resource_group_name = string
    os_disk_caching                       = string
    os_disk_storage_account_type          = string
    image_publisher                       = string
    image_offer                           = string
    image_sku                             = string
    image_version                         = string
  }))
  default = null
}
variable "windows_virtual_machines" {
  description = "A map of Windows virtual machines to create. Each key is a unique identifier for the virtual machine, and the value is an object containing the name, location, resource group name, size, admin username, admin password, network interface name, and image details."
  type = map(object({
    name                                  = string
    location                              = string
    resource_group_name                   = string
    size                                  = string
    admin_username                        = string
    admin_password                        = string
    network_interface_name                = string
    network_interface_resource_group_name = string
    os_disk_caching                       = string
    os_disk_storage_account_type          = string
  }))
  default = {}
}

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
  default = {}
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

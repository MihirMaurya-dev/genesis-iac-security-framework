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
}
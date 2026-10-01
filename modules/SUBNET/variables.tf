variable "subnets" {
  description = "A map of subnets to create. Each key is a unique identifier for the subnet, and the value is an object containing the name, resource group name, virtual network name, and address prefixes."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
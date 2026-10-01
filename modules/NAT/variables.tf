variable "nat_gateways" {
  description = "A map of NAT gateways to create. Each key is a unique identifier for the NAT gateway, and the value is an object containing the name, location, resource group name, SKU, optional tags, and public IPs."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    tags                = optional(map(string), {})
  }))
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

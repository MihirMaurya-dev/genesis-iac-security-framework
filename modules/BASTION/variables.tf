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
}
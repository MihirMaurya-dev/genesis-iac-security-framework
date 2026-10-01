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
  description = "A map of virtual networks to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
  }))
  default = null
}

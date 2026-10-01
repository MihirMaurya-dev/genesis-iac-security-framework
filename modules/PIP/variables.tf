variable "public_ips" {
  description = "A map of public IPs to create. Each key is a unique identifier for the public IP, and the value is an object containing the name, location, resource group name, allocation method, and optional tags."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = optional(map(string), {})
  }))

}
data "azurerm_subnet" "subnet" {
  for_each             = var.nat_gateway_associations
  name                 = each.value.subnet_name
  virtual_network_name = each.value.subnet_virtual_network_name
  resource_group_name  = each.value.subnet_resource_group_name
}
data "azurerm_public_ip" "pip" {
  for_each            = var.nat_gateway_associations
  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_resource_group_name
}
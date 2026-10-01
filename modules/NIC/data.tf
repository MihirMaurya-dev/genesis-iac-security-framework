data "azurerm_subnet" "subnet" {
  for_each             = var.network_interfaces
  name                 = each.value.subnet_name
  virtual_network_name = each.value.subnet_virtual_network_name
  resource_group_name  = each.value.subnet_resource_group_name
}
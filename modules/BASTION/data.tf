data "azurerm_subnet" "subnet" {
  for_each             = var.bastion_hosts
  name                 = each.value.subnet_name
  virtual_network_name = each.value.subnet_virtual_network_name
  resource_group_name  = each.value.subnet_resource_group_name
}
data "azurerm_public_ip" "pip" {
  for_each            = var.bastion_hosts
  name                = each.value.public_ip_name
  resource_group_name = each.value.public_ip_resource_group_name
}
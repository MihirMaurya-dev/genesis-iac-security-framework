# trivy:ignore:AZU-0068
data "azurerm_network_interface" "linux_nic" {
  for_each = var.linux_virtual_machines
  name                = each.value.network_interface_name
  resource_group_name = each.value.network_interface_resource_group_name
}

# trivy:ignore:AZU-0068
data "azurerm_network_interface" "windows_nic" {
  for_each = var.windows_virtual_machines
  name                = each.value.network_interface_name
  resource_group_name = each.value.network_interface_resource_group_name
}

resource "azurerm_nat_gateway" "nat" {
  for_each            = var.nat_gateways
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = lookup(each.value, "tags", null)
}

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  for_each       = var.nat_gateway_associations
  nat_gateway_id = azurerm_nat_gateway.nat[each.value.nat_gateway_key].id
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
}
resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {

  for_each = var.nat_gateway_associations

  nat_gateway_id       = azurerm_nat_gateway.nat[each.value.nat_gateway_key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}
resource "azurerm_public_ip" "pips" {
  for_each            = var.publics
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}

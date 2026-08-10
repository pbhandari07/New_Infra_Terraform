resource "azurerm_resource_group" "resources" {
    for_each = var.rg
    name = each.value.name
    location = each.value.location
}
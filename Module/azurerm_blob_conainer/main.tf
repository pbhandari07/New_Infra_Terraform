data "azurerm_storage_account" "stages" {
  for_each            = var.cnts
  name                = each.value.store_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_storage_container" "containers" {
  for_each           = var.cnts
  name               = each.value.name
  storage_account_id = data.azurerm_storage_account.stages[each.key].id
}

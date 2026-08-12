data "azurerm_public_ip" "dps" {
  for_each            = var.nicvm
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
data "azurerm_subnet" "snets" {
  for_each             = var.nicvm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_network_interface" "nics" {
  for_each            = var.nicvm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  ip_configuration {
    name                          = each.value.ipconfig_name
    public_ip_address_id          = data.azurerm_public_ip.dps[each.key].id
    subnet_id                     = data.azurerm_subnet.snets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.nicvm
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.rg_name
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nics[each.key].id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

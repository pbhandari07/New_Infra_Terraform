rgroup = {
  rg1 = {
    name     = "blue-berry-rg"
    location = "centralindia"
  }
}
sto = {
  store1 = {
    name                     = "cherry007"
    location                 = "centralindia"
    resource_group_name      = "blue-berry-rg"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
con = {
  cnts1 = {
    name       = "almond07"
    store_name = "cherry007"
    rg_name    = "blue-berry-rg"

  }
}
vnetz = {
  vnet1 = {
    name                = "pumpkin"
    resource_group_name = "blue-berry-rg"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}
sunz = {
  sub1 = {
    name                 = "sunflower"
    virtual_network_name = "pumpkin"
    resource_group_name  = "blue-berry-rg"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
pipz = {
  pip1 = {
    name                = "nutspip"
    resource_group_name = "blue-berry-rg"
    location            = "centralindia"
  }
}
nvms = {
  nicvm1 = {
    pip_name       = "nutspip"
    rg_name        = "blue-berry-rg"
    subnet_name    = "sunflower"
    vnet_name      = "pumpkin"
    location       = "centralindia"
    nic_name       = "nicjohns"
    ipconfig_name  = "johnsbros"
    vm_name        = "yoursvm07"
    size           = "Standard_D2s_v3"
    admin_username = "frontendvm"
    admin_password = "Frontendvm@3"
    publisher      = "Canonical"
    offer          = "0001-com-ubuntu-server-jammy"
    sku            = "22_04-lts-gen2"
    version        = "latest"
  }
}

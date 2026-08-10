module "resource_group_name" {
source = "../../Module/azurerm_resource_group" 
rg = var.rgroup
}
module "storage_account" {
    depends_on = [module.resource_group_name]
    source = "../../Module/azurerm_storage_account"
    stgs = var.sto
}
module "storage_container" {
    depends_on = [module.storage_account]
    source = "../../Module/azurerm_blob_conainer"
    cnts = var.con
}
module "virtual_network" {
    depends_on = [module.resource_group_name]
    source = "../../Module/azurerm_virtual_network"
    virtuals = var.vnetz
}
module "subnet" {
    depends_on = [module.virtual_network]
    source = "../../Module/azurerm_subnet"
    subs = var.sunz
}
module "public_ip" {
    depends_on = [module.resource_group_name]
    source = "../../Module/azurerm_public_ip"
    publics = var.pipz
}
module "virtual_machine" {
    depends_on = [ module.resource_group_name, module.subnet, module.virtual_network, module.public_ip ]
    source = "../../Module/azurerm_virtual_machine"
    nicvm = var.nvms
}
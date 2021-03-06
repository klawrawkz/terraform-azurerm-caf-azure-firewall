#Reference: https://www.terraform.io/docs/providers/azurerm/r/firewall.html 
module "caf_name_afw" {
  source  = "aztfmod/caf-naming/azurerm"
  version = "~> 0.1.0"

  name    = var.name
  type    = "afw"
  convention  = var.convention
}

resource "azurerm_firewall" "az_firewall" {
  name                = module.caf_name_afw.afw
  location            = var.location 
  resource_group_name = var.rg
  tags                = local.tags

  ip_configuration {
    name                 = "az_firewall_ip_configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
}
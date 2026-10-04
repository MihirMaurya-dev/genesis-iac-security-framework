module "RG9876" {
  source          = "../../modules/RG"
  resource_groups = var.resource_groups
}

module "VNET" {
  depends_on       = [module.RG9876]
  source           = "../../modules/VNET"
  virtual_networks = var.virtual_networks
}

module "SNET" {
  depends_on = [module.VNET]
  source     = "../../modules/SNET"
  subnets    = var.subnets
}

module "PIP" {
  depends_on = [module.RG9876]
  source     = "../../modules/PIP"
  public_ips = var.public_ips
}

module "VM" {
  depends_on             = [module.SNET, module.PIP]
  source                 = "../../modules/VM"
  linux_virtual_machines = var.linux_virtual_machines
}
module "RG9876" {
  source          = "../../modules/RG"
  resource_groups = var.resource_groups
}

module "VNET" {
  depends_on       = [module.RG9876]
  source           = "../../modules/VNET"
  virtual_networks = var.virtual_networks
}
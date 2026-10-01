module "RG" {
  source          = "../../modules/RG"
  resource_groups = var.resource_groups
}
module "VNET" {
  depends_on       = [module.RG]
  source           = "../../modules/VNET"
  virtual_networks = var.virtual_networks
}
module "SUBNET" {
  depends_on = [module.VNET]
  source     = "../../modules/SUBNET"
  subnets    = var.subnets
}
module "PIP" {
  depends_on = [module.RG]
  source     = "../../modules/PIP"
  public_ips = var.public_ips
}
module "NAT" {
  depends_on               = [module.RG, module.PIP, module.SUBNET]
  source                   = "../../modules/NAT"
  nat_gateways             = var.nat_gateways
  nat_gateway_associations = var.nat_gateway_associations
}
module "BASTION" {
  depends_on    = [module.PIP, module.SUBNET]
  source        = "../../modules/BASTION"
  bastion_hosts = var.bastion_hosts
}
module "NIC" {
  depends_on         = [module.SUBNET]
  source             = "../../modules/NIC"
  network_interfaces = var.network_interfaces
}
module "VM" {
  depends_on               = [module.NIC]
  source                   = "../../modules/VM"
  linux_virtual_machines   = var.linux_virtual_machines
  windows_virtual_machines = var.windows_virtual_machines
}
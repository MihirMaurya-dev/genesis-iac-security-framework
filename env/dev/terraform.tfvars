resource_groups = {
  "primary_rg" = {
    name     = "rg-frontend-dev-westus"
    location = "westus"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}

virtual_networks = {
  "primary_vnet" = {
    name                = "vnet-frontend-dev-westus"
    location            = "westus"
    resource_group_name = "rg-frontend-dev-westus"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}

subnets = {
  frontend_subnet = {
    name                 = "snet-frontend-dev-westus"
    resource_group_name  = "rg-frontend-dev-westus"
    virtual_network_name = "vnet-frontend-dev-westus"
    address_prefixes     = ["10.0.1.0/24"]
  }
  bastion_subnet = {
    name                 = "AzureBastionSubnet" # Azure requires this exact name for Bastion
    resource_group_name  = "rg-frontend-dev-westus"
    virtual_network_name = "vnet-frontend-dev-westus"
    address_prefixes     = ["10.0.3.0/24"]
  }
  appgw_subnet = {
    name                 = "ApplicationGatewaySubnet" # Standard naming
    resource_group_name  = "rg-frontend-dev-westus"
    virtual_network_name = "vnet-frontend-dev-westus"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

public_ips = {
  "bastion_pip" = {
    name                = "pip-bastion-dev-westus"
    location            = "westus"
    resource_group_name = "rg-frontend-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
  appgw_pip = {
    name                = "pip-appgw-dev-westus"
    location            = "westus"
    resource_group_name = "rg-frontend-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
  natgw_pip = {
    name                = "pip-natgw-dev-westus"
    location            = "westus"
    resource_group_name = "rg-frontend-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}

bastion_hosts = {
  "primary_bastion" = {
    name                = "bas-primary-dev-westus"
    location            = "westus"
    resource_group_name = "rg-frontend-dev-westus"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
    subnet_name                   = "AzureBastionSubnet"
    subnet_virtual_network_name   = "vnet-frontend-dev-westus"
    subnet_resource_group_name    = "rg-frontend-dev-westus"
    public_ip_name                = "pip-bastion-dev-westus"
    public_ip_resource_group_name = "rg-frontend-dev-westus"
  }
}

nat_gateways = {
  "primary_natgw" = {
    name                = "ngw-primary-dev-westus"
    location            = "west us"
    resource_group_name = "rg-frontend-dev-westus"
    sku_name            = "StandardV2"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}

nat_gateway_associations = {
  "frontend_natgw_assoc" = {
    subnet_name                   = "snet-frontend-dev-westus"
    nat_gateway_key               = "primary_natgw"
    subnet_virtual_network_name   = "vnet-frontend-dev-westus"
    subnet_resource_group_name    = "rg-frontend-dev-westus"
    public_ip_name                = "pip-natgw-dev-westus"
    public_ip_resource_group_name = "rg-frontend-dev-westus"
  }
}

network_interfaces = {
  frontend_nic = {
    name                        = "nic-frontend-vm-dev-westus"
    location                    = "west us"
    resource_group_name         = "rg-frontend-dev-westus"
    subnet_name                 = "snet-frontend-dev-westus"
    subnet_virtual_network_name = "vnet-frontend-dev-westus"
    subnet_resource_group_name  = "rg-frontend-dev-westus"
  }
}

linux_virtual_machines = {
  frontend_vm = {
    name                                  = "vm-frontend-dev-westus"
    resource_group_name                   = "rg-frontend-dev-westus"
    location                              = "west us"
    size                                  = "Standard_D4_v5"
    admin_username                        = "adminuser"
    os_disk_caching                       = "ReadWrite"
    os_disk_storage_account_type          = "Standard_LRS"
    image_publisher                       = "Canonical"
    image_offer                           = "0001-com-ubuntu-server-jammy"
    image_sku                             = "22_04-lts"
    image_version                         = "latest"
    network_interface_name                = "nic-frontend-vm-dev-westus"
    network_interface_resource_group_name = "rg-frontend-dev-westus"
  }
}

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
  "primary_subnet" = {
    name                 = "snet-frontend-dev-westus"
    resource_group_name  = "rg-frontend-dev-westus"
    virtual_network_name = "vnet-frontend-dev-westus"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

public_ips = {
  "primary_pip" = {
    name                = "pip-frontend-dev-westus"
    resource_group_name = "rg-frontend-dev-westus"
    location            = "westus"
    allocation_method   = "Static"
  }
}

linux_virtual_machines = {
  "primary_vm" = {
    name                 = "vm-frontend-dev-westus"
    resource_group_name  = "rg-frontend-dev-westus"
    location             = "westus"
    size                 = "Standard_B1s"
    admin_username       = "adminuser"
    admin_password       = "Password1234!"
    subnet_name          = "snet-frontend-dev-westus"
    virtual_network_name = "vnet-frontend-dev-westus"
    public_ip_name       = "pip-frontend-dev-westus"
  }
}

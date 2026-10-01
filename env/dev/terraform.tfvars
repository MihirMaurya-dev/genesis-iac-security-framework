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

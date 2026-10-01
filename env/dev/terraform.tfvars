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

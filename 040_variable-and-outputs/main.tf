terraform {
}

module "azure_rg" {
    source = "./azure_rg"
    rsgname = "changefile"
    location = "westeurope"
}

output "resource_group_id" {
  value = module.azure_rg.resource_group_id
  # sensitive = true
}
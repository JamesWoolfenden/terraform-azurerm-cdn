module "storage" {
  source       = "JamesWoolfenden/storageaccount/azurerm"
  version      = "v0.0.27"
  common_tags  = var.common_tags
  account_name = "pikecdn"
  resource_group = {
    name     = "pike"
    location = "uksouth"
  }
  containers = {}
  blobs      = {}
}

output "storage" {
  sensitive = true
  value     = module.storage
}

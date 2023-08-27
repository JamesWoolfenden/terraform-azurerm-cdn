module "storage" {
  source       = "git::https://github.com/JamesWoolfenden/terraform-azurerm-storageaccount.git?ref=db3d718b2f3f6419b8f4f9ec977891b28310e4e1"
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

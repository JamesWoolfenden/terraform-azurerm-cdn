module "cdn" {
  source = "../../"
  cdn = {
    name               = "example-endpoint"
    profile_name       = "example-profile"
    location           = "global"
    origin_host_header = module.storage.storage.primary_blob_host
    origin_path        = "/"
  }
  content_types_to_compress = ["text/html", "text/css", "application/javascript"]
  origins = [{
    name      = "example"
    host_name = "www.contoso.com"
    }
  ]
  rg_name = "pike"
}

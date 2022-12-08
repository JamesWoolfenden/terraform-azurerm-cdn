resource "azurerm_cdn_endpoint" "pike" {
  name                      = var.cdn.name
  profile_name              = var.cdn.profile_name
  location                  = var.cdn.location
  resource_group_name       = var.rg_name
  is_http_allowed           = var.is_http_allowed
  is_https_allowed          = var.is_https_allowed
  origin_host_header        = var.cdn.origin_host_header
  origin_path               = var.cdn.origin_path
  content_types_to_compress = var.content_types_to_compress

  dynamic "origin" {
    for_each = var.origins
    content {
      name      = origin.value["name"]
      host_name = origin.value["host_name"]
    }
  }
}

variable "cdn" {
  type = map(any)
}

variable "content_types_to_compress" {
  type = list(string)
}

variable "origins" {
  type = list(object({
    name      = string
    host_name = string
  }))
}

variable "rg_name" {
  type = string
}

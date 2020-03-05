
locals {
  zone_id = var.zone_id
  ttl = var.ttl
  extra_spf = var.enable_mailchimp ? "include:servers.mcsv.net ${var.extra_spf}" : var.extra_spf
  web_hostname = var.web_hostname
}
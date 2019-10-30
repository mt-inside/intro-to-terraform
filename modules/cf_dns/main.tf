locals {
  domain     = "workshop.mt165.info"
  cf_zone_id = "d0077309259a42a610d14298aa627d46"
}

resource "cloudflare_record" "main" {
  for_each = var.ips

  zone_id = local.cf_zone_id
  name    = "${var.name}.${local.domain}"
  type    = "A"
  value   = each.value
  ttl     = 300
  proxied = false
}

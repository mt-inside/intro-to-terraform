locals {
  domain = "mt165.training"
}

resource "cloudflare_record" "main" {
  for_each = var.ips

  domain  = local.domain
  name    = "${var.name}.${local.domain}"
  type    = "A"
  value   = each.value
  ttl     = 300
  proxied = false
}

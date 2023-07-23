resource "yandex_vpc_network" "foo" {}

resource "yandex_dns_zone" "zone1" {
  name        = "my-private-zone"
  description = "desc"

  labels = {
    label1 = "label-1-value"
  }

  zone             = var.site_url
  public           = true
  private_networks = [yandex_vpc_network.foo.id]
}

locals {
  tt1 = [for v in yandex_lb_network_load_balancer.balancer.listener : v]
  tt2 = [for k in local.tt1.0.external_address_spec : k]
  tt3  = local.tt2.0.address
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = var.site_url
  type    = "A"
  ttl     = 600
  data    = [local.tt3]
}
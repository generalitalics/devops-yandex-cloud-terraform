resource "yandex_lb_network_load_balancer" "balancer" {
  name = "network-balancer-1"

  listener {
    name = "listener-web-servers"
    port = 80
    target_port = 3000
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  listener {
    name = "listener-web-servers2"
    port = 443
    target_port = 443
    external_address_spec {
      ip_version = "ipv4"
    }
  }


  attached_target_group {
    target_group_id = yandex_lb_target_group.web-servers.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "web-servers" {
  name = "web-servers-target-group"

  target {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    address   = yandex_compute_instance.vm1.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    address   = yandex_compute_instance.vm2.network_interface.0.ip_address
  }
}
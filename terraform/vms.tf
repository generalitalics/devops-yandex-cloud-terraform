data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2204-lts"
}
// vm1
resource "yandex_compute_instance" "vm1" {
  allow_stopping_for_update = true
  name = "devopspractic-4"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }

}

// vm2
resource "yandex_compute_instance" "vm2" {
  allow_stopping_for_update = true
  name = "devopspractic-5"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }

}

resource "yandex_vpc_network" "network_terraform" {
  name = "net_terraform"
}

resource "yandex_vpc_subnet" "subnet_terraform" {
  name           = "sub_terraform"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network_terraform.id
  v4_cidr_blocks = ["192.168.15.0/24"]
}
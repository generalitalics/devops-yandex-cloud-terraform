resource "local_file" "inventory" {
    filename = "${path.module}/../ansible/inventory.ini"
    file_permission  = "0644"
    content = format("[webservers]\nvm1 ansible_host=${yandex_compute_instance.vm1.network_interface.0.nat_ip_address} ansible_user=%s\nvm2 ansible_host=${yandex_compute_instance.vm2.network_interface.0.nat_ip_address} ansible_user=%s", var.ssh_user, var.ssh_user)
}
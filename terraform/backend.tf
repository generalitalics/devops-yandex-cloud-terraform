resource "digitalocean_droplet" "web1" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
}

resource "digitalocean_droplet" "web2" {
  image  = "ubuntu-18-04-x64"
  name   = "web-2"
  region = "ams3"
  size   = "s-1vcpu-1gb"
}
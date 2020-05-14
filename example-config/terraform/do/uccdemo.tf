
# berkeley 172.16.86.10/32 us-west-1
# tymnet 172.16.86.20/32 us-east-1
# mitre 172.16.86.30/32 us-east-2
# bremen 172.16.86.40/32 eu-central-1
# hannover 172.16.86.50/32 eu-west-2
# 
# kremvax 172.16.99.0/24 172.16.99.1 eu-north-1

resource "digitalocean_droplet" "berkeley" {
  image = "ubuntu-18-04-x64"
  name	= "berkeley"
  region = "sgp1"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "tymnet" {
  image = "ubuntu-18-04-x64"
  name	= "tymnet"
  region = "sfo2"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "mitre" {
  image = "ubuntu-18-04-x64"
  name	= "mitre"
  region = "nyc1"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "bremen" {
  image = "ubuntu-18-04-x64"
  name	= "bremen"
  region = "ams3"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "hannover" {
  image = "ubuntu-18-04-x64"
  name	= "hannover"
  region = "fra1"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

resource "digitalocean_droplet" "kremvax" {
  image = "ubuntu-18-04-x64"
  name	= "kgb"
  region = "tor1"
  size = "s-1vcpu-1gb"
  private_networking = false
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
}

#Test for using IaaC and deploying a few machines to Digital Ocean

variable "do_token" {}

provider "digitalocean" {
    token = "${var.do_token}"
}

# Create the instance
resource "digitalocean_droplet" "bastion" {
    image   = "centos-7-x64"
    name    = "bastion"
    region  = "AMS3"
    size    = "1Gi"
}

resource "digitalocean_droplet" "master" {
    image   = "centos-7-x64"
    name    = "bastion"
    region  = "AMS3"
    size    = "4Gi"
}

# Assign a Floating IP
resource "digitalocean_floating_ip" "master" {
  region     = "AM3"
}
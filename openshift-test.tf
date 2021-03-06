#Test for using IaaC and deploying a few machines to Digital Ocean

variable "do_token" {}

provider "digitalocean" {
    token = "${var.do_token}"
}

# Create the instance
resource "digitalocean_droplet" "master" {
    image   = "centos-7-x64"
    name    = "master1"
    region  = "AMS3"
    size    = "512mb"
}

# Assign a Floating IP
resource "digitalocean_floating_ip" "test" {
  region     = "AM3"
}
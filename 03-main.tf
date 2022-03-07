## This module creates number of servers in each of provided region.
## I.e. if number_of_servers = 2 and regions = ["nyc1", "nyc2", "nyc3"] this will create six servers at summary.

module "db1000n" {
  source               = "./module"
  count                = 2
  regions              = ["nyc1", "nyc3", "sfo3", "ams3", "sgp1", "lon1", "fra1", "tor1", "blr1"]
  name                 = "db00-${count.index}"
  digitalocean_tag     = "stop-sites"
  image_name           = "ubuntu-20-04-x64"
  size                 = "s-1vcpu-1gb"
  ipv6                 = true
  backups              = false
  monitoring           = true
  droplet_agent        = true
  tags                 = "stop-sites"
  digitalocean_ssh_key = "name_of_ssh_key"
}

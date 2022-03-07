data "digitalocean_tag" "stop-sites" {
  name = var.tags
}

data "digitalocean_ssh_key" "terraform" {
  name = var.digitalocean_ssh_key
}

resource "digitalocean_droplet" "db1000n" {
  for_each      = toset(var.regions)
  name          = "${var.name}-${each.key}"
  size          = var.size
  region        = each.key
  ipv6          = var.ipv6
  backups       = var.backups
  monitoring    = var.monitoring
  droplet_agent = var.droplet_agent
  image         = var.image_name

  tags = [data.digitalocean_tag.stop-sites.id]

  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  connection {
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
    host        = self.ipv4_address
  }

  provisioner "file" {
    source      = "${path.module}/script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
}

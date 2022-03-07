# Adjust number of servers to match your load
variable "number_of_servers" {
  description = "Number of servers which will create in each of provided region"
  default     = ""
}

variable "do_token" {
  type    = string
  default = "952e2"
}

variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "pvt_key" {
  default = "~/.ssh/id_rsa"
}

variable "regions" {
  type = list(string)
}

variable "name" {
  type = string
}

variable "digitalocean_tag" {
  type = string
}

variable "size" {
  type = string
}

variable "ipv6" {
  type = string
}

variable "backups" {
  type = string
}

variable "monitoring" {
  type = string
}

variable "droplet_agent" {
  type = string
}

variable "image_name" {
  type = string
}

variable "tags" {
  type = string
}

variable "digitalocean_ssh_key" {
  type = string
}

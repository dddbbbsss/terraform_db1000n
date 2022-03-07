# Adjust number of servers to match your load
variable "number_of_servers" {
  description = "Number of servers which will create in each of provided region"
  default     = "2"
}

variable "do_token" {
  type    = string
  default = "get_a_key_in_api"
}

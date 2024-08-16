variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-07c8c1b18ca66bb07"
}

variable "public_key" {
  description = "ssh public key"
}

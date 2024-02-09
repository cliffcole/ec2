variable "region" {}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "availability_zone" {}
variable "name" {
  type = string
}
variable "environment" {
  type = string
}
variable "instance_count" {
  type = number
  default = 1
}
variable "subnet_id" {
  
}
variable "security_groups" {
  
}
variable "ssh_key_name" {
  
}

variable "private_key_pem" {
  
}
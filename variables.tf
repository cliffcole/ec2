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
variable "env" {
  type = string
}
variable "instance_count" {
  type = number
  default = 1
}
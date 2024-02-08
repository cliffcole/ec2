
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}
locals {
  default_ami = data.aws_ami.amazon_linux_2.id
}

resource "aws_instance" "web_instance" {
    count = var.instance_count
  ami               = var.ami_id == "" ? local.default_ami : var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  tags = {
    "Name" = "${var.name}-${count.index + 1}"
    "environment"  = var.env
  }
}
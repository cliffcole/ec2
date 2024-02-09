
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
  subnet_id = var.subnet_id
  security_groups = var.security_groups
  key_name        = var.ssh_key_name

connection {
    user        = "ec2-user"
    private_key = var.private_key_pem
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo rm -rf /tmp",
      "sudo yum install git -y",
      "sudo git clone https://github.com/cliffcole/web /tmp",
      "sudo bash /tmp/install/install.sh"
     ]
  }

  lifecycle {
    ignore_changes = [security_groups]
  }
  tags = {
    "Name" = "${var.name}-${count.index + 1}"
    "environment"  = var.environment
  }
}
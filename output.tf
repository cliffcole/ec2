output "public_IP" {
  value = aws_instance.web_instance[*].public_ip
}

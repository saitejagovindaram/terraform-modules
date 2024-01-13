output "public_ip" {
  value = aws_instance.module_practice.public_ip
}

output "private_ip" {
  value = aws_instance.module_practice.private_ip
}

output "instance_id" {
  value = aws_instance.module_practice.id
}
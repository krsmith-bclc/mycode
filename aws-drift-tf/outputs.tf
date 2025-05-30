output "instance_id" {
  value = aws_instance.example-kyle.id
}

output "public_ip" {
  value       = aws_instance.example-kyle.public_ip
  description = "The public IP of the web server"
}

output "security_groups" {
  value = [aws_instance.example-kyle.vpc_security_group_ids]
}


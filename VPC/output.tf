output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "ssh_command" {
  description = "Command to connect to the instance"
  value       = "ssh -i my-key.pem ec2-user@${aws_instance.web_server.public_ip}"
}

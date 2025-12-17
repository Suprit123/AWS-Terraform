output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2_instance["public_subnet"].public_ip
}

output "ssh_command" {
  description = "Command to connect to the instance"
  value       = "ssh -i my-key.pem ec2-user@${aws_instance.ec2_instance["public_subnet"].public_ip}"
}

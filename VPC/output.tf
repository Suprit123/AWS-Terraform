output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_subnet.subnets["public"].id
}

output "ssh_command" {
  description = "Command to connect to the instance"
  value       = "ssh -i ${aws_key_pair.generated_key_pair.key_name}.pem ec2-user@${aws_instance.servers["public_vm"].public_ip}"
}

output "vpc_id" {
  description = "ID for VPC created"
  value       = aws_vpc.NetSpecialty.id
}

output "subnet_ids" {
  description = "ID for subnets created"
  value       = { for k, v in aws_subnet.subnets : k => v.id }
}

output "server-ips" {
  description = "IP's assigned to both ec2 instance"
  value = {
    for k, v in aws_instance.servers : k => {
      private_ip = v.private_ip
      publc_ip   = v.public_ip
    }
  }
}

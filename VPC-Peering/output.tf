output "mumbai_vpc_id" {
  value = aws_vpc.mumbai.id
}

output "virginia_vpc_id" {
  value = aws_vpc.virginia.id
}

output "peering_connection_id" {
  value = aws_vpc_peering_connection.mumbai-to-virginia.id
}

output "mumbai_instance_id" {
  value = aws_instance.mumbai.id
}

output "mumbai_instance_private_ip" {
  value = aws_instance.mumbai.private_ip
}

output "virginia_instance_id" {
  value = aws_instance.virginia.id
}

output "virginia_instance_private_ip" {
  value = aws_instance.virginia.private_ip
}

output "connection_instructions" {
  value = <<-EOT
    Mumbai: aws ec2-instance-connect ssh --instance-id ${aws_instance.mumbai.id} --region ap-south-1
    Virginia: aws ec2-instance-connect ssh --instance-id ${aws_instance.virginia.id} --region us-east-1
    
    Test peering: ping ${aws_instance.virginia.private_ip}
  EOT
}
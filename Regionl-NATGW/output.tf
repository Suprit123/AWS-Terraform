output "subnet" {
  description = "Value of the created Subnets"
  value       = { for k, v in aws_subnet.subnets : k => v.id }
}

output "vpc_id" {
  description = "VPC ID of the created VPC"
  value       = aws_vpc.RGNAT.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID of the created IGW"
  value       = aws_internet_gateway.RGNAT-IGW.id
}

output "route_table_id" {
  description = "Route Table ID of the created Route Table"
  value       = aws_route_table.RGNAT-RT.id
}
# Create a route table for the Regional NAT Gateway VPC
resource "aws_route_table" "RGNAT-RT" {
  vpc_id = aws_vpc.RGNAT.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.RGNAT-NGW.id
    }

    tags = {
    Name = "RGNAT-RT"
  }
}

# Create a route table association for each subnet in the VPC
resource "aws_route_table_association" "RGNAT-RT-Assoc" {
  for_each = {
    subnet1 = var.subnets["subnet1"]
    subnet2 = var.subnets["subnet2"]
  }
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.RGNAT-RT.id
}
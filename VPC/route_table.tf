# Route table for public Subnets(Routes to IGW)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.NetSpecialty.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }
  tags = { Name = "public-rt" }
}

# Route table for Private Subnets(Routes to NAT GW)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.NetSpecialty.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = { Name = "private-rt" }
}

resource "aws_route_table_association" "assoc" {
  for_each = var.subnet_cidr

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = each.value.is_public ? aws_route_table.public.id : aws_route_table.private.id

}

# Create VPC in Virginia Region
resource "aws_vpc" "virginia" {
  provider   = aws.virginia
  cidr_block = var.virginia_cidr

  tags = {
    Name = var.virginia_vpc_name
  }
}
# Create Subnet in Virginia VPC
resource "aws_subnet" "virginia_subnet" {
  provider   = aws.virginia
  vpc_id     = aws_vpc.virginia.id
  cidr_block = var.virginia_snet_cidr

  tags = {
    Name = "Virginia-subnet"
  }
}

# Virginia Route Table
resource "aws_route_table" "virginia" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia.id

  route {
    cidr_block                = var.mumbai_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.mumbai-to-virginia.id
  }
  tags = {
    Name = "virginia-rt"
  }
}

# Virginia Route Table Association
resource "aws_route_table_association" "virginia" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.virginia_subnet.id
  route_table_id = aws_route_table.virginia.id
}
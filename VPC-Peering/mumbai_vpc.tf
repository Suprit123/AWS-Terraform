# Create VPC in Mumbai Region
resource "aws_vpc" "mumbai" {
  provider   = aws.mumbai
  cidr_block = var.mumbai_cidr
  tags = {
    Name = var.mumbai_vpc_name
  }
}

# Create Subnet in Mumbai VPC
resource "aws_subnet" "mumbai_subnet" {
  provider   = aws.mumbai
  vpc_id     = aws_vpc.mumbai.id
  cidr_block = var.mumbai_subnet_cidr
  tags = {
    Name = "Mumbai-Subnet"
  }
}

# Mumbai Route Table
resource "aws_route_table" "mumbai" {
  provider = aws.mumbai
  vpc_id   = aws_vpc.mumbai.id

  route {
    cidr_block                = var.virginia_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.mumbai-to-virginia.id
  }
  tags = {
    Name = "mumbai-rt"
  }
}

# Mumbai Route Table Association
resource "aws_route_table_association" "mumbai" {
  provider       = aws.mumbai
  subnet_id      = aws_subnet.mumbai_subnet.id
  route_table_id = aws_route_table.mumbai.id
}
# --- VPC & Networking ---

# Create the VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-VPC"
  }
}

# Create the IGW and attach to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.project_name}-IGW"
  }
}

# Create Public and Private Subnet
resource "aws_subnet" "subnets" {
  for_each                = var.subnet_cidr
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.public
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = var.project_name
    type = each.key
  }
}

# Create Route Table for Public Subnet and associate with IGW
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-PublicRT"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.subnets["public_subnet"].id
  route_table_id = aws_route_table.public_rt.id
}

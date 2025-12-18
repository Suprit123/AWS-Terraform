# Dynamic data fetch for AZs

data "aws_availability_zones" "available" {
  state = "available"
}

# Subnet (Single Resource Block)
resource "aws_subnet" "subnets" {
  for_each = var.subnet_cidr

  vpc_id                  = aws_vpc.NetSpecialty.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = each.value.is_public
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${each.key}-subnet"
    Type = each.value.is_public ? "Public" : "Private"
  }
}

# Elastic IP for NATGW
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway (Specifically In "nat" subnet)
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets["nat"].id # Reference the specific map key from variables

  tags = {
    Name = "${var.project_name}-ngw"
  }

  # Ensure IGW exists before creating NAT
  depends_on = [aws_internet_gateway.igw]
}

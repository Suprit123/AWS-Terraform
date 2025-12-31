resource "aws_vpc" "RGNAT" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "RGNAT-VPC"
  }
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id            = aws_vpc.RGNAT.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.name
  }
}

resource "aws_internet_gateway" "RGNAT-IGW" {
  vpc_id = aws_vpc.RGNAT.id

  tags = {
    Name = "RGNAT-IGW"
  }
}

resource "aws_eip" "RGNAT-eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "RGNAT-NGW" {
  vpc_id = aws_vpc.RGNAT.id
  availability_mode = "regional"

  tags = {
    Name = "RGNAT-NGW"
  }
}
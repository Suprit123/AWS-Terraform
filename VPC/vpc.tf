### Contains VPC and Internet Gateway ###

resource "aws_vpc" "NetSpecialty" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.NetSpecialty.id

  tags = {
    Name = "${var.project_name}-IGW"
  }
}

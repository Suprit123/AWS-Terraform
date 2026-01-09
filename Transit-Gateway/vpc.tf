resource "aws_vpc" "TGW_VPC" {
  for_each   = var.vpc
  cidr_block = each.value.vpc_cidr
  region     = each.value.region

  tags = {
    Name = each.value.vpc_name
  }
}

resource "aws_subnet" "TGW_SUBNET" {
  for_each          = var.subnets
  cidr_block        = each.value.cidr
  vpc_id            = aws_vpc.TGW_VPC[each.value.vpc_name].id
  availability_zone = each.value.az

  tags = {
    Name = each.value.sub_name
  }
}

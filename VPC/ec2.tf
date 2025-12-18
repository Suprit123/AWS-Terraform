# Fetch latest Amazon Linux 2023

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Security Group
resource "aws_security_group" "allow_basic" {
  name        = "allow_basic"
  description = "Allow SSH/ICMP"
  vpc_id      = aws_vpc.NetSpecialty.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance (Singe Resource block)
resource "aws_instance" "servers" {
  for_each = var.instance_config

  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = each.value.type
  subnet_id                   = aws_subnet.subnets[each.value.subnet_key].id
  associate_public_ip_address = each.value.public_ip
  vpc_security_group_ids      = [aws_security_group.allow_basic.id]
  key_name                    = aws_key_pair.generated_key_pair.key_name

  tags = {
    Name = each.key
  }
}

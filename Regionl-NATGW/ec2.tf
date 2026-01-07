# Create VPC Endpoint for EC2 in Mumbai region
resource "aws_vpc_endpoint" "RGNAT-ep" {
  vpc_id            = aws_vpc.RGNAT.id
  vpc_endpoint_type = "Interface"
  service_name      = "com.amazonaws.ap-south-1.ec2"
  subnet_ids        = [aws_subnet.subnets["subnet3"].id]


  tags = {
    Name = "RGNAT-ec2-endpoint"
  }
}

# Create EC2 Instance Connect Endpoint in Mumbai region
resource "aws_ec2_instance_connect_endpoint" "name" {
  subnet_id = aws_subnet.subnets["subnet3"].id


  tags = {
    Name = "RGNAT-eice"
  }
}

# Security Group for Mumbai EC2 Instances
resource "aws_security_group" "RGNAT-ec2" {
  name   = "RGNAT-ec2-sg"
  vpc_id = aws_vpc.RGNAT.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Out ALL"

  }
  tags = {
    Name = "RGNAT-ec2-sg"
  }
}

# Create data source to fetch the latest Amazon Linux 2023 AMI in Mumbai region
data "aws_ami" "mumbai" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
# Create an EC2 instance in Mumbai region using data source AMI
resource "aws_instance" "mumbai" {
  ami                    = data.aws_ami.mumbai.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnets["subnet1"].id
  vpc_security_group_ids = [aws_security_group.RGNAT-ec2.id]

  tags = {
    Name = "mumbai-private-instance"
  }

}

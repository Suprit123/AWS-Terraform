# Security Group for Mumbai EC2 Instances
resource "aws_security_group" "mumbai-ec2" {
  provider = aws.mumbai
  name     = "mumbai-ec2-sg"
  vpc_id   = aws_vpc.mumbai.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.virginia_cidr]
    description = "ICMP from Virginia"
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.virginia_cidr]
    description = "Allow TCP from Virginia"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Out ALL"

  }
  tags = {
    Name = "mumbai-ec2-sg"
  }
}

# Security Group for Mumbai VPC Endpoint
resource "aws_security_group" "mumbai_endpoint" {
  provider = aws.mumbai
  name     = "mumbai-endpoint-sg"
  vpc_id   = aws_vpc.mumbai.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.mumbai_cidr]
    description = "Allow HTTPS from Mumbai VPC"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Out ALL"
  }
  tags = {
    Name = "mumbai-endpoint-sg"
  }
}

# Security Group for Mumbai VPC Interface Endpoint
resource "aws_security_group" "mumbai_eice" {
  provider = aws.mumbai
  name     = "mumbai-eice-sg"
  vpc_id   = aws_vpc.mumbai.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "mumbai-eice-sg"
  }
}
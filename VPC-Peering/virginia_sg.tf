<<<<<<< Updated upstream
# Security Group for Virginia EC2 Instances
resource "aws_security_group" "virginia_ec2" {
  provider = aws.virginia
  name     = "virginia-ec2-sg"
  vpc_id   = aws_vpc.virginia.id

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
    cidr_blocks = [var.mumbai_cidr]
    description = "ICMP from Mumbai"
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.mumbai_cidr]
    description = "Allow TCP from Mumbai"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Out ALL"
  }
}

# Security Group for Virginia VPC Endpoint
resource "aws_security_group" "virginia_endpoint" {
  provider = aws.virginia
  name     = "virginia-endpoint-sg"
  vpc_id   = aws_vpc.virginia.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.virginia_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "virginia-endpoint-sg"
  }
}

# Security Group for Virginia VPC Interface Endpoint
resource "aws_security_group" "virginia_eice" {
  provider = aws.virginia
  name     = "virginia-eice-sg"
  vpc_id   = aws_vpc.virginia.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "virginia-eice-sg"
  }
=======
# Security Group for Virginia EC2 Instances
resource "aws_security_group" "virginia_ec2" {
  provider = aws.virginia
  name     = "virginia-ec2-sg"
  vpc_id   = aws_vpc.virginia.id

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
    cidr_blocks = [var.mumbai_cidr]
    description = "ICMP from Mumbai"
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.mumbai_cidr]
    description = "Allow TCP from Mumbai"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Out ALL"
  }
}

# Security Group for Virginia VPC Endpoint
resource "aws_security_group" "virginia_endpoint" {
  provider = aws.virginia
  name     = "virginia-endpoint-sg"
  vpc_id   = aws_vpc.virginia.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.virginia_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "virginia-endpoint-sg"
  }
}

# Security Group for Virginia VPC Interface Endpoint
resource "aws_security_group" "virginia_eice" {
  provider = aws.virginia
  name     = "virginia-eice-sg"
  vpc_id   = aws_vpc.virginia.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "virginia-eice-sg"
  }
>>>>>>> Stashed changes
}
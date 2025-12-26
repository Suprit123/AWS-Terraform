<<<<<<< Updated upstream
data "aws_ami" "virginia" {
  provider    = aws.virginia
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "virginia" {
  provider        = aws.virginia
  instance_type = var.instance_type
  ami             = data.aws_ami.virginia.id
  subnet_id       = aws_subnet.virginia_subnet.id
  security_groups = [aws_security_group.virginia_ec2.id]

  tags = {
    Name = "virginia-private-instance"
  }
=======
data "aws_ami" "virginia" {
  provider    = aws.virginia
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "virginia" {
  provider        = aws.virginia
  instance_type = var.instance_type
  ami             = data.aws_ami.virginia.id
  subnet_id       = aws_subnet.virginia_subnet.id
  security_groups = [aws_security_group.virginia_ec2.id]

  tags = {
    Name = "virginia-private-instance"
  }
>>>>>>> Stashed changes
}
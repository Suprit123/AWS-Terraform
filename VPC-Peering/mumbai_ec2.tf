data "aws_ami" "mumbai" {
  provider    = aws.mumbai
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "mumbai" {
  provider               = aws.mumbai
  ami                    = data.aws_ami.mumbai.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.mumbai_subnet.id
  vpc_security_group_ids = [aws_security_group.mumbai-ec2.id]

  tags = {
    Name = "mumbai-private-instance"
  }

}
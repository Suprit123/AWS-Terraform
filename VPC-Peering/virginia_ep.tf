<<<<<<< Updated upstream
resource "aws_vpc_endpoint" "virginia_ec2" {
  provider           = aws.virginia
  vpc_id             = aws_vpc.virginia.id
  service_name        = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.virginia_subnet.id]
  security_group_ids = [aws_security_group.virginia_endpoint.id]

  tags = {
    Name = "virginia-ec2-endpoint"
  }
}

resource "aws_ec2_instance_connect_endpoint" "virginia" {
  provider           = aws.virginia
  subnet_id          = aws_subnet.virginia_subnet.id
  security_group_ids = [aws_security_group.virginia_eice.id]

  tags = {
    Name = "virginia-eice"
  }
=======
resource "aws_vpc_endpoint" "virginia_ec2" {
  provider           = aws.virginia
  vpc_id             = aws_vpc.virginia.id
  service_name        = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.virginia_subnet.id]
  security_group_ids = [aws_security_group.virginia_endpoint.id]

  tags = {
    Name = "virginia-ec2-endpoint"
  }
}

resource "aws_ec2_instance_connect_endpoint" "virginia" {
  provider           = aws.virginia
  subnet_id          = aws_subnet.virginia_subnet.id
  security_group_ids = [aws_security_group.virginia_eice.id]

  tags = {
    Name = "virginia-eice"
  }
>>>>>>> Stashed changes
}
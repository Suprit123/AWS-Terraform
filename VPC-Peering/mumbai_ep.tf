# VPC Endpoint for Mumbai VPC EC2 Service
resource "aws_vpc_endpoint" "mumbai-ec2" {
  provider           = aws.mumbai
  vpc_id             = aws_vpc.mumbai.id
  service_name        = "com.amazonaws.ap-south-1.ec2"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.mumbai_subnet.id]
  security_group_ids = [aws_security_group.mumbai_endpoint.id]
 

  tags = {
    Name = "mumbai-ec2-endpoint"
  }
}

# EC2 Instance Connect Endpoint for Mumbai VPC
resource "aws_ec2_instance_connect_endpoint" "mumbai" {
  provider           = aws.mumbai
  subnet_id          = aws_subnet.mumbai_subnet.id
  security_group_ids = [aws_security_group.mumbai_eice.id]

  tags = {
    Name = "mumbai-eice"
  }
}
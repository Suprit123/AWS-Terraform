resource "aws_vpc_peering_connection" "mumbai-to-virginia" {
  provider    = aws.mumbai
  vpc_id      = aws_vpc.mumbai.id
  peer_vpc_id = aws_vpc.virginia.id
  peer_region = "us-east-1"

  tags = {
    Name = "mumbai-to-virginia"
  }
}

resource "aws_vpc_peering_connection_accepter" "virginia-to-mumbai" {
  provider                  = aws.virginia
  vpc_peering_connection_id = aws_vpc_peering_connection.mumbai-to-virginia.id
  auto_accept               = true

  tags = {
    Name = "virginia-to-mumbai"
  }
}
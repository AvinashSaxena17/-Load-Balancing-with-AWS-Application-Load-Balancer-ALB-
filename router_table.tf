resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc-ap-south-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }

  tags = {
    Name  = "Public Route Table"
  }
}


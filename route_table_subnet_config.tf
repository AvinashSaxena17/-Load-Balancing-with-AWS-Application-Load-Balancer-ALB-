resource "aws_route_table_association" "public_subnet_association" {
  count         = length(var.cidr_public_subnet)
  depends_on    = [aws_subnet.aws-demo-Public-Subnet, aws_route_table.public_route_table]
  subnet_id     = element(aws_subnet.aws-demo-Public-Subnet[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}



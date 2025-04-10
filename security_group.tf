resource "aws_security_group" "sg_vpc_ap_south_1" {
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  vpc_id = aws_vpc.vpc-ap-south-1.id

  depends_on = [ aws_vpc.vpc-ap-south-1 ]

  tags = {
    Name = "sg: vpc_ap-south-1"
  }
}



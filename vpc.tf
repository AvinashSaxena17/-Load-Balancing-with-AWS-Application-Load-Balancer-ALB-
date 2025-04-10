#Created AWS VPC in ap-south-1
#CIDR - 10.0.0.0/16
 resource "aws_vpc" "vpc-ap-south-1" {
    cidr_block = var.aws_vpc_cidr
tags = {
  Name = "VPC: ap-south-1"
}
   
 }


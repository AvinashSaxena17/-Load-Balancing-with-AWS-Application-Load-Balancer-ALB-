data "aws_subnet" "public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["Subnet Public : Public Subnet 1"]
  }

  depends_on = [ 
    aws_route_table_association.public_subnet_association
  ]
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["Subnet Public : Public Subnet 2"]
  }

  depends_on = [ 
    aws_route_table_association.public_subnet_association
  ]
}


resource "aws_key_pair" "deployement_key_pair" {
  key_name   = "aws_key"
  public_key = file("${path.module}/YOUR_SSH_KEY")
}


locals {
  public_subnets = [
    data.aws_subnet.public_subnet_1.id,
    data.aws_subnet.public_subnet_2.id
  ]
}



resource "aws_instance" "ec2-instance" {
  count = length(local.public_subnets)
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.deployement_key_pair.key_name
  subnet_id              = local.public_subnets[count.index]
  vpc_security_group_ids = [aws_security_group.sg_vpc_ap_south_1.id]

user_data = file("script.sh")

  tags = {
    Name = "Ec2_public_subnet-${count.index+1}"
  }
}







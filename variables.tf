variable "aws_vpc_cidr" {
    default = "10.0.0.0/16"
    description = "CIDR values"
    type = string
  
}

variable "cidr_public_subnet" {
    type = list(string)
    description = "Public Subnet CIDR values"
    default = [ "10.0.1.0/24","10.0.2.0/24" ]

}



variable "availability_zone" {
  type = list(string)
  description = "Availability Zones"
  default = ["ap-south-1a"]  # Wrapped in square brackets to make it a list
}

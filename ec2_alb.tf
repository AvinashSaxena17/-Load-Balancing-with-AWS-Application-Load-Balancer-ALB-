resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           =  false
  load_balancer_type = "application"
  security_groups    =  [aws_security_group.sg_vpc_ap_south_1.id]
  subnets            =  [for subnet in aws_subnet.aws-demo-Public-Subnet : subnet.id]
}
resource "aws_lb_target_group" "my_TG" {
  name = "myTG"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc-ap-south-1.id 

  health_check{
    path = "/"
    port = "traffic-port"
  }

}

resource "aws_lb_target_group_attachment" "attach1" {
  count            = length(aws_instance.ec2-instance) # Ensure count is used properly
  target_group_arn = aws_lb_target_group.my_TG.arn
  target_id        = aws_instance.ec2-instance[count.index].id
  port             = 80
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_TG.arn
  }
}

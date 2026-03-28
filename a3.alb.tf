 resource "aws_alb" "app_lb" {
  name = "ak-alb"
  load_balancer_type = "application"
  #with this lb we need to add security group and subnet
  security_groups = [aws_security_group.alb_sg.id] #this is the security
  subnets = values(aws_subnet.ak_subnet)[*].id #this is the subnet
  tags = {
    Name = "ak-alb"
  }
}
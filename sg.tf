resource "aws_security_group" "web_sg" {
  # ... other configuration ...
  ######allow ssh access from anywhere
  name   = "web-sg-ak"
  vpc_id = aws_vpc.ak_vpc.id
 
  # ... other configuration ...

  dynamic "ingress" {
    for_each = var.allowed_ingress_ports
    content {
      description = "Allow ingress on port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidr_blocks 
    }
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #tcp, udp, icmp and all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}












/* resource "aws_security_group" "web_sg" {
  # ... other configuration ...
######allow ssh access from anywhere
    name        = "web-sg-AK"
    vpc_id = aws_vpc.ak_vpc.id
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ####allow http access from anywhere
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 8400
    to_port          = 8403
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
##outbound rule to allow all traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
}
}
*/
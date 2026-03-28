resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ak_vpc.id    

  tags = {
    Name = "ak-igw "
  }
}
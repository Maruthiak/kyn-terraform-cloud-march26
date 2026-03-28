resource "aws_vpc" "ak_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "ak-vpc"
  }
}
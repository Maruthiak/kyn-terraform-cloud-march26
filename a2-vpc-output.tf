 output "vpc_id" {
  value = aws_vpc.ak_vpc.id
  description = "vpc id of the created vpc"
  
}

output "subnet_ids" {
  value = values(aws_subnet.ak_subnet)[*].id
  description = "subnet ids of the created subnets"
  
}

output "igw_id" {
  value = aws_internet_gateway.gw.id
  description = "internet gateway id of the created internet gateway"
  
}
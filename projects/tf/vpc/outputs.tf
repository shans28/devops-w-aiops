output "vpc_id" {
  value = aws_vpc.vpc-app-01.id
}

output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}
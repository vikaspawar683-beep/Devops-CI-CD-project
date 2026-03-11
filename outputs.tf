output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
}

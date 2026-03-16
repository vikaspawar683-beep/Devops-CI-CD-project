output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "app1_public_ip" {
  value = aws_instance.app1.public_ip
}

output "app2_public_ip" {
  value = aws_instance.app2.public_ip
}

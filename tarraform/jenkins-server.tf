resource "aws_instance" "jenkins_server" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet1.id
  key_name      = "Jenkins-server"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "Jenkins-Server"
  }
}

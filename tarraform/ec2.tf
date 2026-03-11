resource "aws_instance" "app1" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "App-Server-1"
  }
}

resource "aws_instance" "app2" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet2.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "App-Server-2"
  }
}

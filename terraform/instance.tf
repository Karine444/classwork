resource "aws_instance" "my_instance" {
  ami                          = data.aws_ami.myImage.id
  instance_type                = "t2.micro"
  subnet_id                    = aws_subnet.public_subnet.id
  vpc_security_group_ids       = [aws_security_group.my_sg.id]
  key_name                     = var.aws_key_pair

  tags = {
    Name = "my_instance"
  }
}

output "instance_url" {
  value = aws_instance.my_instance.public_ip
}
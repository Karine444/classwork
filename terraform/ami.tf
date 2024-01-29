data "aws_ami" "myImage" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "custom-ami"
  }
}
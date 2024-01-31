data "aws_ami" "myImage" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "classwork_20_01_24"
  }
}

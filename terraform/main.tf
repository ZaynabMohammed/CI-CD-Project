resource "aws_instance" "ubuntu-instance" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name      = "EC2_Key"
  security_groups = ["${aws_security_group.UbuntuSG.name}"]

  tags  = {
    Name  = "Ubuntu-EC2"
  }
}

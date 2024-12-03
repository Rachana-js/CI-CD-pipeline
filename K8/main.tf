provider "aws" {
  region = "us-east-1"


}

resource "aws_instance" "instance-1" {
  ami                         = "ami-0866a3c8686eaeeba"
  instance_type               = "t2.medium"
  security_groups             = ["default"]
  key_name                    = "project"
  associate_public_ip_address = true
  user_data                   = file("docker.sh")
  tags = {
    Name = "k8-server"
  }
}

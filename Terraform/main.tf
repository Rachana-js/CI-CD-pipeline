provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "instance-1" {
  ami                         = "ami-0614680123427b75e"
  instance_type               = "t2.micro"
  security_groups             = [default]
  key_name                    = "mumpvt"
  associate_public_ip_address = true
  user_data                   = file("grafana.sh")
  tags = {
    Name = "Grafana-server"
  }
}


resource "aws_instance" "instance-1" {
  ami                         = "ami-0614680123427b75e"
  instance_type               = "t2.micro"
  security_groups             = [default]
  key_name                    = "mumpvt"
  associate_public_ip_address = true
  tags = {
    Name = "Node-expo"
  }
}


